import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blocs/blocs/home_bloc/home_bloc.dart';
import 'package:flutter_blocs/config/configapp.dart';
import 'package:flutter_blocs/repository/user_repository.dart';
import 'package:flutter_blocs/ui/custom_widget/customConfig.dart';
import 'package:flutter_blocs/ui/pages/home_pages/combos/comboPage.dart';
import 'package:flutter_blocs/ui/pages/home_pages/drinks/drinkPage.dart';
import 'package:flutter_blocs/ui/pages/home_pages/family/familyPage.dart';
import 'package:flutter_blocs/ui/pages/home_pages/my_bottom_tab.dart';
import 'package:flutter_blocs/ui/pages/home_pages/sides/sidesPage.dart';
import '../../../main.dart';

class HomePageParent extends StatefulWidget {
  final FirebaseUser user;
  final UserRepository userRepository;
  HomePageParent({@required this.user, @required this.userRepository});
  @override
  _HomePageParentState createState() => _HomePageParentState();
}

class _HomePageParentState extends State<HomePageParent> {
  GlobalKey homeGlobalKey = GlobalKey();

  /* Page Controller */
  PageController _pageController;
  /* List Widget */
  List<Widget> pages;
  /* Page view Index */
  int selectedIndex = 0;
  /* Bottom tab index*/
  int currentIndex = 0;
  /* Bottom Tab Funtion */
  void _onPress(int num) {
    BlocProvider.of<HomeBloc>(homeGlobalKey.currentContext)
        .add(ChangePageEvent(index: num));
  }

  Future<bool> _onWillPop() async {
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
  void initState() {
    ConfigApp.isShowstatusBarColor = true;
    super.initState();
  }

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
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return App();
                },
              ),
            );
          } else if (state is ChangePageState) {
            currentIndex = state.index;
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
        key: homeGlobalKey,
        body: Stack(
          children: <Widget>[
            buildPageView(),
            buildTopView(getWidth, getHeight),
            buildBottomBar(getWidth, getHeight),
          ],
        ),
      ),
    );
  }

  Positioned buildTopView(double getWidth, double getHeight) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: getWidth * 0.05),
          height: getHeight * 0.1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Spacer(),
              GestureDetector(
                onTap: () {
                  _onMenuPressed(
                    context: homeGlobalKey.currentContext,
                    getHeight: getHeight,
                  );
                },
                child: Container(
                  height: getWidth * 0.1,
                  width: getWidth * 0.1,
                  child: ClipOval(
                    child: Image.network(
                      "https://avatars2.githubusercontent.com/u/51372227?s=460&u=10b00a76a16feb0edadd49f31c7d2805c2663239&v=4",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Positioned buildBottomBar(double getWidth, double getHeight) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        height: getHeight * 0.1,
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
      FamilyPage(),
      SidesPage(),
      DrinkPage(),
    ];
  }

  void _onMenuPressed({BuildContext context, double getHeight}) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        // color: Color(0xFF737373),
      color: Colors.transparent,
        height: getHeight * 0.3,
        child: Container(
          child: _buildMenuWidgetBotom(context),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(15.0),
              topRight: const Radius.circular(15.0),
            ),
          ),
        ),
      ),
    );
  }

  Column _buildMenuWidgetBotom(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[

        Expanded(
          flex: 4,
          child: Center(
            child: ListTile(
              title: Text(
                'Help and Support',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400),
              ),
              onTap: () {
                Navigator.pop(context);
                showDialog(
                  context: context,
                  builder: (context) => new AlertDialog(
                    title: new Text('Notification'),
                    content: new Text('The feature are improving'),
                  ),
                );
              },
            ),
          ),
        ),
        Divider(height: 2.0, color: Colors.black),

        // Expanded(
        //   flex: 1,
        //   child: Center(
        //     child: Divider(height: 2.0, color: Colors.black),
        //   ),
        // ),
        Expanded(
          flex: 4,
          child: Center(
            child: ListTile(
              title: Text(
                'Privacy Settings',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400),
              ),
              onTap: () {
                Navigator.pop(context);
                showDialog(
                  context: context,
                  builder: (context) => new AlertDialog(
                    title: new Text('Notification'),
                    content: new Text('The feature are improving'),
                  ),
                );
              },
            ),
          ),
        ),
        Divider(height: 2.0, color: Colors.black),
        // Expanded(
        //     flex: 1,
        //     child: Center(
        //       child: Divider(height: 2.0, color: Colors.black),
        //     )),
        Expanded(
          flex: 4,
          child: Center(
            child: ListTile(
              title: Text(
                'Log out',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400),
              ),
              onTap: () {
                Navigator.pop(context);
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: new Text('Are you sure?'),
                    content: new Text('Do you want to Log out?'),
                    actions: <Widget>[
                      new FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: new Text('No'),
                      ),
                      new FlatButton(
                        onPressed: () {
                          BlocProvider.of<HomeBloc>(
                                  homeGlobalKey.currentContext)
                              .add(LogOutEvent());

                          Navigator.pop(context);
                        },
                        child: new Text('Yes'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        Divider(height: 2.0, color: Colors.black),

        // Expanded(
        //   flex: 1,
        //   child: Center(
        //     child: Divider(height: 2.0, color: Colors.black),
        //   ),
        // ),
      ],
    );
  }
}
