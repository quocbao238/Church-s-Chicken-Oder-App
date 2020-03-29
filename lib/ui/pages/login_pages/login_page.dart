import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blocs/blocs/login_bloc/login_bloc.dart';
import 'package:flutter_blocs/repository/user_repository.dart';
import 'package:flutter_blocs/ui/custom_widget/loading_widget.dart';
import 'package:flutter_blocs/ui/custom_widget/showToast.dart';
import 'package:flutter_blocs/ui/pages/home_pages/home_pages.dart';
import 'package:flutter_blocs/ui/pages/signup_pages/signup_page.dart';

class LoginPageParent extends StatefulWidget {
  final UserRepository userRepository;
  LoginPageParent({@required this.userRepository});

  @override
  _LoginPageParentState createState() => _LoginPageParentState();
}

class _LoginPageParentState extends State<LoginPageParent> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  GlobalKey loginGlobalKey = GlobalKey();

  Future<bool> _onWillPop() async {
    showToast(msg: "On backpress");
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit an App'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: new Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(userRepository: widget.userRepository),
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            Navigator.of(context)
                .pushReplacement(new MaterialPageRoute(builder: (context) {
              return HomePageParent(
                  user: state.user, userRepository: widget.userRepository);
            }));
          } else if (state is LoginFailState) {
            showToast(context: context, msg: state.message);
          } else if (state is GotoSignUpPageState) {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => SignUpPageParent(
                        userRepository: widget.userRepository,
                      )),
            );
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) => Scaffold(
            key: loginGlobalKey,
            body: Stack(
              children: <Widget>[
                SafeArea(
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
                                BlocProvider.of<LoginBloc>(context)
                                    .add(GotoSignUpPageEvent());
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // LoadingWidget(),
                state is LoginLoadingState ? LoadingWidget() : SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
