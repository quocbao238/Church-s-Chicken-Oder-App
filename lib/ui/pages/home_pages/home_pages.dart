import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blocs/blocs/home_bloc/home_bloc.dart';
import 'package:flutter_blocs/repository/user_repository.dart';
import 'package:flutter_blocs/ui/custom_widget/customConfig.dart';
import 'package:flutter_blocs/ui/pages/home_pages/comboPage.dart';
import 'package:flutter_blocs/ui/pages/home_pages/my_bottom_tab.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

  /* Page Controller */
  PageController _pageController;
  /* List Widget */
  List<Widget> pages;
  /* Page view Index */
  int selectedIndex = 0;
  /* Bottom tab index*/
  int currentIndex = 1;
  /* Bottom Tab Funtion */
  void _onPress(int num) {
    setState(() {
      currentIndex = num;
      print("currentIndex ${currentIndex}");
    });
  }

  final _drawerController = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    _definePages();
    double getHeight = MediaQuery.of(context).size.height;
    double getWidth = MediaQuery.of(context).size.width;
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
          builder: (context, state) => pageView(context, getHeight, getWidth),
        ),
      ),
    );
  }

  WillPopScope pageView(
      BuildContext context, double getHeight, double getWidth) {
    return new WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text("Home"),
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
          body: Stack(
            children: <Widget>[buildPageView(), buildBottomBar(getWidth)],
          )),
    );
  }

  Positioned buildBottomBar(double getWidth) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        padding: EdgeInsets.only(left: getWidth * 0.05, right: getWidth * 0.05),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            MyBottomTabs(navigatorBottom1, "Combos", currentIndex == 0, () {
              _onPress(0);
            }),
            MyBottomTabs(navigatorBottom2, "Family", currentIndex == 1, () {
              _onPress(1);
            }),
            MyBottomTabs(navigatorBottom3, "Sides & Sweets", currentIndex == 2,
                () {
              _onPress(2);
            }),
            MyBottomTabs(navigatorBottom4, "Drinks", currentIndex == 3, () {
              _onPress(3);
            }),
          ],
        ),
      ),
    );
  }

  Positioned buildPageView() {
    return Positioned.fill(
      child: pages[currentIndex],
    );
  }

  _definePages() {
    pages = [
      ComboPage(),
      Container(color: Colors.blue),
      Container(color: Colors.green),
      Container(color: Colors.amber),
    ];
  }
}
