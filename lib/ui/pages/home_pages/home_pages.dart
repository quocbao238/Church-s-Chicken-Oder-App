import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blocs/blocs/home_bloc/home_bloc.dart';
import 'package:flutter_blocs/repository/user_repository.dart';
import '../../../main.dart';
import '../../custom_widget/showToast.dart';

class HomePageParent extends StatefulWidget {
  final FirebaseUser user;
  final UserRepository userRepository;
  HomePageParent({@required this.user, @required this.userRepository});

  @override
  _HomePageParentState createState() => _HomePageParentState();
}

class _HomePageParentState extends State<HomePageParent> {
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

  FirebaseUser user;
  @override
  void initState() {
    super.initState();
    widget.user.reload();
  }

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

  WillPopScope pageView(BuildContext context) {
    return new WillPopScope(
      onWillPop: _onWillPop,
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
              child: Text(widget?.user?.displayName ?? "Deo co data"),
            ),
          ],
        ),
      ),
    );
  }
}
