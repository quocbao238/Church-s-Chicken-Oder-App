import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blocs/blocs/home_bloc/home_bloc.dart';
import 'package:flutter_blocs/repository/user_repository.dart';
import '../../../main.dart';

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
      create: (context) => HomeBloc(userRepository: widget.userRepository),
      child: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is LogOutSuccessState) {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return App();
            }));
          }
        },
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) => pageView(context),
        ),
      ),
    );
  }

  Scaffold pageView(BuildContext context) {
    return Scaffold(
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
              BlocProvider.of<HomeBloc>(context).add(LogOutEvent());
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
    );
  }
}
