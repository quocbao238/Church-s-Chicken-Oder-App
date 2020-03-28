import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blocs/blocs/home_bloc/home_bloc.dart';
import 'package:flutter_blocs/repository/user_repository.dart';
import 'package:flutter_blocs/ui/pages/signup_pages/signup_page.dart';

class HomePageParent extends StatefulWidget {
  FirebaseUser user;
  UserRepository userRepository;
  HomePageParent({@required this.user, @required this.userRepository});

  @override
  _HomePageParentState createState() => _HomePageParentState();
}

class _HomePageParentState extends State<HomePageParent> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is LogOutSuccessState) {
            // navigateToSignUpPage(context);
          } else if (state is HomeInitial) {
            // return Container();
          } else if (state is LogOutSuccessState) {
            // return Container();
          }
        },
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) => pageView(context),
        ),
      ),
    );
  }

  WillPopScope pageView(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("email"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.white,
              ),
              onPressed: () {
                onPressedLogOut(context);
                // homePageBloc.add(LogOutEvent());
              },
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Text(widget.user.uid),
            ),
          ],
        ),
      ),
    );
  }

  void navigateToSignUpPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return SignUpPageParent();
    }));
  }

  void onPressedLogOut(BuildContext context) {
    BlocProvider.of<HomeBloc>(context).add(LogOutEvent());
  }
}
