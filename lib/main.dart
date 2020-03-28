import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blocs/blocs/auth_bloc/auth_bloc_bloc.dart';
import 'package:flutter_blocs/repository/user_repository.dart';
import 'package:flutter_blocs/ui/pages/home_pages/home_pages.dart';
import 'package:flutter_blocs/ui/pages/login_pages/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // UserRepository userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
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
  UserRepository userRepository;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AuthBloc()..add(AppStartedEvent(userRepository: userRepository)),
      child: BlocListener<AuthBloc, AuthBlocState>(
        listener: (context, state) {},
        child: BlocBuilder<AuthBloc, AuthBlocState>(
          builder: (context, state) {
            if (state is AuthenticatedState) {
              debugPrint("AuthenticatedState");
              return HomePageParent(
                user: state.user,
                userRepository: userRepository,
              );
            } else if (state is UnauthenticatedState) {
              debugPrint("UnauthenticatedState");
              return LoginPageParent(
                userRepository: userRepository,
              );
            }
          },
        ),
      ),
    );
  }
}
