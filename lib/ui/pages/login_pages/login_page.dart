import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blocs/blocs/login_bloc/login_bloc.dart';
import 'package:flutter_blocs/repository/user_repository.dart';
import 'package:flutter_blocs/ui/custom_widget/customConfig.dart';
import 'package:flutter_blocs/ui/custom_widget/loading_widget.dart';
import 'package:flutter_blocs/ui/custom_widget/showToast.dart';
import 'package:flutter_blocs/ui/pages/home_pages/home_pages.dart';
import 'package:flutter_blocs/ui/pages/signup_pages/signup_page.dart';
import 'package:google_fonts/google_fonts.dart';

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

  @override
  Widget build(BuildContext context) {
    final double getHeight = MediaQuery.of(context).size.height;
    final double getWidth = MediaQuery.of(context).size.width;
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
            resizeToAvoidBottomPadding: false,
            body: Stack(
              children: <Widget>[
                buildImageScreen(getHeight, getWidth),
                buildAppbar(getHeight, getWidth),
                buildCenterPage(context, getHeight, getWidth),
                // LoadingWidget(),
                state is LoginLoadingState ? LoadingWidget() : SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SafeArea buildCenterPage(
      BuildContext context, double getHeight, double getWidth) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: getHeight * 0.4),
              padding: EdgeInsets.only(left: 25.0, right: 25.0),
              child: TextField(
                controller: controllerEmail,
                decoration: InputDecoration(
                  errorStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "E-mail",
                  prefixIcon: Icon(
                    Icons.mail,
                    color: Colors.black,
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  left: 25.0, right: 25.0, top: getHeight * 0.02),
              child: TextField(
                controller: controllerPassword,
                decoration: InputDecoration(
                  errorStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Password",
                  prefixIcon: Icon(
                    Icons.vpn_key,
                    color: Colors.black,
                  ),
                  suffixIcon: IconButton(
                      icon: Icon(Icons.remove_red_eye, color: Colors.black),
                      onPressed: () {
                        debugPrint('222');
                      }),
                ),
                keyboardType: TextInputType.visiblePassword,
              ),
            ),
            Container(
              height: getHeight * 0.05,
              margin: EdgeInsets.only(right: 25.0, left: 25.0),
              child: Row(
                children: <Widget>[
                  Flexible(flex: 5, child: Container()),
                  Flexible(
                    flex: 3,
                    child: Container(
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
                BlocProvider.of<LoginBloc>(loginGlobalKey.currentContext).add(
                    LoginButtonPressedEvent(
                        email: controllerEmail.text.trim(),
                        password: controllerPassword.text.trim()));
              },
              child: Container(
                height: getHeight * 0.08,
                width: getWidth,
                margin: EdgeInsets.only(
                    top: getHeight * 0.015, left: 25.0, right: 25.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius * 1.5),
                  // border: Border.all(color: Colors.red, width: 2.0),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color.fromRGBO(85, 202, 242, 1),
                      Color.fromRGBO(85, 97, 242, 1)
                    ],
                  ),
                ),
                child: Center(
                  child: Text(
                    "Login",
                    style: GoogleFonts.bitter(
                        textStyle: TextStyle(
                            color: Colors.white,
                            height: 1,
                            letterSpacing: 0.5,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w600)),
                  ),
                ),
              ),
            ),
            Container(
              height: getHeight * 0.23,
              alignment: AlignmentDirectional.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: getHeight * 0.08,
                    child: Center(
                      child: Text(
                        "Already have an account? ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      BlocProvider.of<LoginBloc>(context)
                          .add(GotoSignUpPageEvent());
                    },
                    child: Container(
                      height: getHeight * 0.08,
                      child: Center(
                        child: Text(
                          "Sign Up!",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // BlocProvider.of<LoginBloc>(context)
  //   .add(GotoSignUpPageEvent());

  Container buildImageScreen(double getHeight, double getWidth) {
    return Container(
      height: getHeight,
      width: getWidth,
      child: Image.asset(
        loginImage,
        fit: BoxFit.cover,
      ),
    );
  }

  Positioned buildAppbar(double getHeight, double getWidth) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        margin: EdgeInsets.only(
          top: getHeight * 0.04,
          // left: getWidth * 0.3,
          // right: getWidth * 0.3,
        ),
        height: getHeight * 0.35,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                left: getWidth * 0.35,
                right: getWidth * 0.35,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: getHeight * 0.02,
                    width: getHeight * 0.02,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey),
                  ),
                  Container(
                    height: getHeight * 0.02,
                    width: getHeight * 0.1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(radius),
                        color: Colors.grey),
                  ),
                  Container(
                    height: getHeight * 0.05,
                    width: getHeight * 0.02,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey),
                  ),
                ],
              ),
            ),
            Container(
              width: getHeight * 0.3,
              child: Image.asset(
                sliderLogoImage,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
