import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blocs/blocs/reg_bloc/userreg_bloc.dart';
import 'package:flutter_blocs/repository/user_repository.dart';
import 'package:flutter_blocs/ui/pages/home_pages/home_pages.dart';

class SignUpPageParent extends StatefulWidget {
  final UserRepository userRepository;
  SignUpPageParent({@required this.userRepository});
  @override
  _SignUpPageParentState createState() => _SignUpPageParentState();
}

class _SignUpPageParentState extends State<SignUpPageParent> {
  TextEditingController emailCntrl = TextEditingController();
  TextEditingController passCntrlr = TextEditingController();
  GlobalKey signupGlobalKey = GlobalKey();
  UserRepository userRepository;
  @override
  void initState() {
    super.initState();
    userRepository = widget.userRepository;
  }

  @override
  Widget build(BuildContext context) {
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
                userRepository: userRepository,
              );
            }));
          } else if (state is UserRegFailure) {
            debugPrint(state.message);
          }
        },
        child: BlocBuilder<UserregBloc, UserregState>(
          builder: (context, state) => Scaffold(
            key: signupGlobalKey,
            appBar: AppBar(
              title: Text("Sign Up"),
              centerTitle: true,
              automaticallyImplyLeading: false,
            ),
            body: pageView(),
          ),
        ),
      ),
    );
  }

  Container pageView() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: TextField(
              controller: emailCntrl,
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
                  child: Text("Sign Up"),
                  textColor: Colors.white,
                  onPressed: () {
                    FocusScope.of(context).requestFocus(new FocusNode());
                    BlocProvider.of<UserregBloc>(signupGlobalKey.currentContext)
                        .add(SignUpButtonPressed(
                            email: emailCntrl.text.trim(),
                            password: passCntrlr.text.trim()));
                  },
                ),
              ),
              Container(
                child: RaisedButton(
                  color: Colors.cyan,
                  child: Text("Login Now"),
                  textColor: Colors.white,
                  onPressed: () {
                    // navigateToLoginPage(context);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
