import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blocs/blocs/login_bloc/login_bloc.dart';
import 'package:flutter_blocs/repository/user_repository.dart';
import 'package:flutter_blocs/ui/custom_widget/showToast.dart';
import 'package:flutter_blocs/ui/pages/home_pages/home_pages.dart';
import 'package:flutter_blocs/ui/pages/signup_pages/signup_page.dart';
import 'package:toast/toast.dart';

class LoginPageParent extends StatefulWidget {
  UserRepository userRepository;
  LoginPageParent({@required this.userRepository});

  @override
  _LoginPageParentState createState() => _LoginPageParentState();
}

class _LoginPageParentState extends State<LoginPageParent> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  GlobalKey loginGlobalKey = GlobalKey();
  UserRepository userRepository;
  @override
  void initState() {
    super.initState();
    userRepository = widget.userRepository;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(userRepository: userRepository),
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            navigateToHomeScreen(
                context: loginGlobalKey.currentContext,
                user: state.user,
                userRepository: widget.userRepository);
          } else if (state is LoginFailState) {
            showToast(context: context, msg: state.message);
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) => Scaffold(
            key: loginGlobalKey,
            body: Stack(
              children: <Widget>[
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5.0),
                        child: TextField(
                          controller: controllerEmail,
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
                          controller: controllerPassword,
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
                                FocusScope.of(context)
                                    .requestFocus(new FocusNode());
                                BlocProvider.of<LoginBloc>(
                                        loginGlobalKey.currentContext)
                                    .add(LoginButtonPressedEvent(
                                        email: controllerEmail.text.trim(),
                                        password:
                                            controllerPassword.text.trim()));
                              },
                            ),
                          ),
                          Container(
                            child: RaisedButton(
                              color: Colors.cyan,
                              child: Text("Sign Up Now"),
                              textColor: Colors.white,
                              onPressed: () {
                                navigateToSignUpScreen(
                                    loginGlobalKey.currentContext);
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // LoadingWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void navigateToHomeScreen(
      {BuildContext context,
      FirebaseUser user,
      UserRepository userRepository}) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return HomePageParent(user: user, userRepository: userRepository);
    }));
  }

  void navigateToSignUpScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => SignUpPageParent(
                userRepository: widget.userRepository,
              )),
    );
  }
}
