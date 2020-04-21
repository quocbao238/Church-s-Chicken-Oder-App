import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blocs/blocs/auth_bloc/auth_bloc_bloc.dart';
import 'package:flutter_blocs/config/configapp.dart';
import 'package:flutter_blocs/repository/user_repository.dart';
import 'package:flutter_blocs/ui/custom_widget/loading_widget.dart';
import 'package:flutter_blocs/ui/pages/home_pages/home_pages.dart';
import 'package:flutter_blocs/ui/pages/intro_pages/intro_page.dart';

import 'blocs/auth_bloc/auth_bloc_bloc.dart';
import 'repository/user_repository.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: ConfigApp.isShowstatusBarColor ? null : Colors.black,
    systemNavigationBarColor:
        ConfigApp.isShowstatusBarColor ? null : Colors.transparent,
    systemNavigationBarDividerColor:
        ConfigApp.isShowstatusBarColor ? null : Colors.transparent,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Church\'s Chicken',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: App());
  }
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  UserRepository userRepository = UserRepository();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AuthBloc()..add(AppStartedEvent(userRepository: userRepository)),
      child: BlocListener<AuthBloc, AuthBlocState>(
        listener: (context, state) {
          if (state is AuthenticatedState) {
            debugPrint("AuthenticatedState");
            Navigator.of(context)
                .pushReplacement(new MaterialPageRoute(builder: (context) {
              return HomePageParent(
                  user: state.user, userRepository: userRepository);
            }));
          } else if (state is UnauthenticatedState) {
            debugPrint("UnauthenticatedState");
            Navigator.of(context)
                .pushReplacement(new MaterialPageRoute(builder: (context) {
              return IntroPage(userRepository: userRepository);
            }));
          }
        },
        child: BlocBuilder<AuthBloc, AuthBlocState>(
          builder: (context, state) {
            return LoadingWidget();
          },
        ),
      ),
    );
  }
}
