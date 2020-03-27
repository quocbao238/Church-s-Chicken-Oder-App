import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blocs/blocs/login_bloc/login_bloc.dart';
import 'package:flutter_blocs/ui/pages/home_pages/home_pages.dart';
import 'package:flutter_blocs/ui/pages/signup_pages/signup_page.dart';

class LoginPageParent extends StatefulWidget {
  @override
  _LoginPageParentState createState() => _LoginPageParentState();
}

class _LoginPageParentState extends State<LoginPageParent> {
  TextEditingController emailCntrlr;
  TextEditingController passCntrlr;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {},
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) => WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              appBar: AppBar(
                title: Text("Login"),
                centerTitle: true,
                automaticallyImplyLeading: false,
              ),
              body: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(5.0),
                      // child: BlocListener<LoginBloc, LoginState>(
                      //   listener: (context, state) {
                      //     if (state is LoginSuccessState) {
                      //       navigateToHomeScreen(context, state.user);
                      //     }
                      //   },
                      //   child: BlocBuilder<LoginBloc, LoginState>(
                      //     builder: (context, state) {
                      //       if (state is LoginInitial) {
                      //         return buildInitialUi();
                      //       } else if (state is LoginLoadingState) {
                      //         return buildLoadingUi();
                      //       } else if (state is LoginFailState) {
                      //         return buildFailureUi(state.message);
                      //       } else if (state is LoginSuccessState) {
                      //         emailCntrlr.text = "";
                      //         passCntrlr.text = "";
                      //         return Container();
                      //       }
                      //     },
                      //   ),
                      // ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5.0),
                      child: TextField(
                        controller: emailCntrlr,
                        decoration: InputDecoration(
                          errorStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          labelText: "E-mail",
                          hintText: "E-mail",
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5.0),
                      child: TextField(
                        controller: passCntrlr,
                        decoration: InputDecoration(
                          errorStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          labelText: "Password",
                          hintText: "Password",
                        ),
                        keyboardType: TextInputType.visiblePassword,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          child: RaisedButton(
                            color: Colors.cyan,
                            child: Text("Login"),
                            textColor: Colors.white,
                            onPressed: () {
                              // loginBloc.add(
                              //   LoginButtonPressed(
                              //     email: emailCntrlr.text,
                              //     password: passCntrlr.text,
                              //   ),
                              // );
                            },
                          ),
                        ),
                        Container(
                          child: RaisedButton(
                            color: Colors.cyan,
                            child: Text("Sign Up Now"),
                            textColor: Colors.white,
                            onPressed: () {
                              navigateToSignUpScreen(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInitialUi() {
    return Container(
      padding: EdgeInsets.all(5.0),
      child: Text(
        "Enter Login Credentials",
        style: TextStyle(
          fontSize: 30.0,
          color: Colors.teal,
        ),
      ),
    );
  }

  Widget buildLoadingUi() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildFailureUi(String message) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(5.0),
          child: Text(
            "Fail $message",
            style: TextStyle(color: Colors.red),
          ),
        ),
        buildInitialUi(),
      ],
    );
  }

  void navigateToHomeScreen(BuildContext context, FirebaseUser user) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return HomePageParent();
    }));
  }

  void navigateToSignUpScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return SignUpPageParent();
    }));
  }
  //     ),
  //   ),
  // );
}

// class LoginPAge extends StatelessWidget {
//   TextEditingController emailCntrlr = TextEditingController();
//   TextEditingController passCntrlr = TextEditingController();
//   LoginBloc loginBloc;
//   UserRepository userRepository;

//   LoginPAge({@required this.userRepository});

//   @override
//   Widget build(BuildContext context) {
//     loginBloc = BlocProvider.of<LoginBloc>(context);

//     return WillPopScope(
//       onWillPop: () async => false,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("Login"),
//           centerTitle: true,
//           automaticallyImplyLeading: false,
//         ),
//         body: Container(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Container(
//                 padding: EdgeInsets.all(5.0),
//                 child: BlocListener<LoginBloc, LoginState>(
//                   listener: (context, state) {
//                     if (state is LoginSuccessState) {
//                       navigateToHomeScreen(context, state.user);
//                     }
//                   },
//                   child: BlocBuilder<LoginBloc, LoginState>(
//                     builder: (context, state) {
//                       if (state is LoginInitial) {
//                         return buildInitialUi();
//                       } else if (state is LoginLoadingState) {
//                         return buildLoadingUi();
//                       } else if (state is LoginFailState) {
//                         return buildFailureUi(state.message);
//                       } else if (state is LoginSuccessState) {
//                         emailCntrlr.text = "";
//                         passCntrlr.text = "";
//                         return Container();
//                       }
//                     },
//                   ),
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.all(5.0),
//                 child: TextField(
//                   controller: emailCntrlr,
//                   decoration: InputDecoration(
//                     errorStyle: TextStyle(color: Colors.white),
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(),
//                     labelText: "E-mail",
//                     hintText: "E-mail",
//                   ),
//                   keyboardType: TextInputType.emailAddress,
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.all(5.0),
//                 child: TextField(
//                   controller: passCntrlr,
//                   decoration: InputDecoration(
//                     errorStyle: TextStyle(color: Colors.white),
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(),
//                     labelText: "Password",
//                     hintText: "Password",
//                   ),
//                   keyboardType: TextInputType.visiblePassword,
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: <Widget>[
//                   Container(
//                     child: RaisedButton(
//                       color: Colors.cyan,
//                       child: Text("Login"),
//                       textColor: Colors.white,
//                       onPressed: () {
//                         loginBloc.add(
//                           LoginButtonPressed(
//                             email: emailCntrlr.text,
//                             password: passCntrlr.text,
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                   Container(
//                     child: RaisedButton(
//                       color: Colors.cyan,
//                       child: Text("Sign Up Now"),
//                       textColor: Colors.white,
//                       onPressed: () {
//                         navigateToSignUpScreen(context);
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildInitialUi() {
//     return Container(
//       padding: EdgeInsets.all(5.0),
//       child: Text(
//         "Enter Login Credentials",
//         style: TextStyle(
//           fontSize: 30.0,
//           color: Colors.teal,
//         ),
//       ),
//     );
//   }

//   Widget buildLoadingUi() {
//     return Center(
//       child: CircularProgressIndicator(),
//     );
//   }

//   Widget buildFailureUi(String message) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         Container(
//           padding: EdgeInsets.all(5.0),
//           child: Text(
//             "Fail $message",
//             style: TextStyle(color: Colors.red),
//           ),
//         ),
//         buildInitialUi(),
//       ],
//     );
//   }

//   void navigateToHomeScreen(BuildContext context, FirebaseUser user) {
//     Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//       return HomePageParent();
//     }));
//   }

//   void navigateToSignUpScreen(BuildContext context) {
//     Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//       return SignUpPageParent();
//     }));
//   }
// }
