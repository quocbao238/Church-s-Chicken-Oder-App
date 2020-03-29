import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blocs/blocs/auth_bloc/auth_bloc_bloc.dart';
import 'package:flutter_blocs/repository/user_repository.dart';
import 'package:flutter_blocs/ui/custom_widget/loading_widget.dart';
import 'package:flutter_blocs/ui/pages/home_pages/home_pages.dart';
import 'package:flutter_blocs/ui/pages/intro_pages/intro_page.dart';
import 'package:flutter_blocs/ui/pages/login_pages/login_page.dart';

import 'blocs/auth_bloc/auth_bloc_bloc.dart';
import 'repository/user_repository.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // UserRepository userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Popeyes',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: IntroPage(
          userRepository: new UserRepository(),
        ));
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
        listener: (context, state) {},
        child: BlocBuilder<AuthBloc, AuthBlocState>(
          builder: (context, state) {
            if (state is AuthenLoadingState) {
              return LoadingWidget();
            } else if (state is AuthenticatedState) {
              debugPrint("AuthenticatedState");
              return HomePageParent(
                user: state.user,
                userRepository: userRepository,
              );
            } else if (state is UnauthenticatedState) {
              debugPrint("UnauthenticatedState");
              return IntroPage(
                userRepository: userRepository,
              );
            }
          },
        ),
      ),
    );
  }
}
