
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blocs/blocs/reg_bloc/userreg_bloc.dart';
import 'package:flutter_blocs/repository/user_repository.dart';
import 'package:flutter_blocs/ui/custom_widget/customConfig.dart';
import 'package:flutter_blocs/ui/custom_widget/loading_widget.dart';
import 'package:flutter_blocs/ui/custom_widget/showToast.dart';
import 'package:flutter_blocs/ui/pages/home_pages/home_pages.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../blocs/reg_bloc/userreg_bloc.dart';
import '../../../blocs/reg_bloc/userreg_bloc.dart';

class SignUpPageParent extends StatefulWidget {
  final UserRepository userRepository;
  SignUpPageParent({@required this.userRepository});
  @override
  _SignUpPageParentState createState() => _SignUpPageParentState();
}

class _SignUpPageParentState extends State<SignUpPageParent> {
  TextEditingController userCntrl = TextEditingController();
  TextEditingController emailCntrl = TextEditingController();
  TextEditingController passCntrlr = TextEditingController();
  GlobalKey signupGlobalKey = GlobalKey();
  UserRepository userRepository;
  bool isChecked = true;
  bool isHide = true;

  @override
  void initState() {
    super.initState();
    userRepository = widget.userRepository;
  }

  @override
  Widget build(BuildContext context) {
    final double getHeight = MediaQuery.of(context).size.height;
    final double getWidth = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => UserregBloc(userRepository: userRepository),
      child: BlocListener<UserregBloc, UserregState>(
        listener: (context, state) {
          if (state is UserRegSuccessful) {
            emailCntrl.text = "";
            passCntrlr.text = "";
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return HomePageParent(
                user: state.user,
                userRepository: state.userRepository,
              );
            }));
          } else if (state is UserRegFailure) {
            showToast(msg: state.message, context: context);
          } else if (state is HideShowPasswordState) {
            // FocusScope.of(context).requestFocus(new FocusNode());
            isHide = !state.isHide;
          }
        },
        child: BlocBuilder<UserregBloc, UserregState>(
          builder: (context, state) => Scaffold(
            key: signupGlobalKey,
            resizeToAvoidBottomPadding: false,
            // resizeToAvoidBottomInset: false,
            body: Stack(
              children: <Widget>[
                buildImageScreen(getHeight, getWidth),
                buildAppbar(getHeight, getWidth),
                buildCenterPage(context, getHeight, getWidth),
                buildBottomSignIn(context, getHeight, getWidth),
                buildBackSignIn(getHeight, getWidth),
                state is UserRegLoading ? LoadingWidget() : SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Positioned buildBottomSignIn(
      BuildContext context, double getHeight, double getWidth) {
    return Positioned(
      bottom: getHeight * 0.02,
      left: getHeight * 0.02,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            height: getHeight * 0.08,
            width: getWidth * 0.4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius * 1.5),
              border: Border.all(width: 2, color: Colors.blue),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: getHeight * 0.045,
                  width: getHeight * 0.045,
                  child: Image.asset('assets/flogo.png'),
                ),
                Container(
                  margin: EdgeInsets.only(left: getWidth * 0.02),
                  child: Text(
                    "Facebook",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: getHeight * 0.08,
            width: getWidth * 0.4,
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.red),
              borderRadius: BorderRadius.circular(radius * 1.5),
              // color: Colors.red,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: getHeight * 0.06,
                  width: getHeight * 0.06,
                  child: Image.asset('assets/glogo.png'),
                ),
                Container(
                  margin: EdgeInsets.only(left: getWidth * 0.02),
                  child: Text(
                    "Google",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

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

  Positioned buildBackSignIn(double getHeight, double getWidth) {
    return Positioned(
      top: getWidth * 0.08,
      left: getWidth * 0.04,
      child: IconButton(
          onPressed: () {
            setState(() {
              print("ONTAP");
              Navigator.pop(context);
            });
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 40.0)),
      // ),
    );
  }

  Positioned buildAppbar(double getHeight, double getWidth) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        margin: EdgeInsets.only(
          top: getHeight * 0.02,
        ),
        height: getHeight * 0.3,
        width: getWidth * 0.3,
        child: Center(
          child: Image.asset(
            sliderLogoImage,
            fit: BoxFit.cover,
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
              margin: EdgeInsets.only(top: getHeight * 0.35),
              padding: EdgeInsets.only(left: 25.0, right: 25.0),
              child: TextField(
                controller: userCntrl,
                decoration: InputDecoration(
                  errorStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "User Name",
                  prefixIcon: Icon(
                    Icons.person_pin,
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
                controller: emailCntrl,
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
                obscureText: isHide,
                controller: passCntrlr,
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
                        // FocusScope.of(context).requestFocus(new FocusNode());
                        BlocProvider.of<UserregBloc>(
                                signupGlobalKey.currentContext)
                            .add(HideShowPasswordEvent(isHide: isHide));
                      }),
                ),
                keyboardType: TextInputType.visiblePassword,
              ),
            ),
            // Container(
            //   height: getHeight * 0.06,
            //   margin: EdgeInsets.only(right: 25.0, left: 25.0),
            //   child: Row(
            //     children: <Widget>[
            //       Flexible(
            //           flex: 2,
            //           child: CircularCheckBox(
            //               activeColor: Colors.blue,
            //               disabledColor: Colors.black,
            //               inactiveColor: Colors.black,
            //               value: isChecked,
            //               onChanged: (bool x) {
            //                 setState(() {
            //                   isChecked = !isChecked;
            //                 });
            //               })),
            //       Flexible(
            //         flex: 8,
            //         child: Container(
            //           child: Text(
            //             "I agree to the terms and privacy policy",
            //             style: TextStyle(
            //               color: Colors.white,
            //               fontWeight: FontWeight.bold,
            //               fontSize: 14.0,
            //             ),
            //           ),
            //         ),
            //       )
            //     ],
            //   ),
            // ),
            GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
                BlocProvider.of<UserregBloc>(signupGlobalKey.currentContext)
                    .add(SignUpButtonPressed(
                        email: emailCntrl.text.trim(),
                        password: passCntrlr.text.trim(),
                        userName: userCntrl.text.trim(),
                        isCheckin: isChecked));
              },
              child: Container(
                height: getHeight * 0.08,
                width: getWidth,
                margin: EdgeInsets.only(
                    top: getHeight * 0.01, left: 25.0, right: 25.0),
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
                    "Sign up for free".toUpperCase(),
                    style: GoogleFonts.bitter(
                        textStyle: TextStyle(
                            color: Colors.white,
                            height: 1,
                            letterSpacing: 0.5,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
