import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blocs/blocs/auth_bloc/auth_bloc_bloc.dart';
import 'package:flutter_blocs/ui/pages/home_pages/home_pages.dart';
import 'package:flutter_blocs/ui/pages/login_pages/login_page.dart';
import 'package:flutter_blocs/ui/pages/splash_pages.dart/splash_page.dart';
import 'repository/user_repository.dart';

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
        home: App()
        // BlocProvider(
        //   create: (context) =>
        //       AuthBloc(userRepository: userRepository)..add(AppStartedEvent()),
        //   child: App(
        //     userRepository: userRepository,
        //   ),
        // ),

        );
  }
}

class App extends StatelessWidget {
  // UserRepository userRepository;

  // App({this.userRepository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: BlocListener<AuthBloc, AuthBlocState>(
        listener: (context, state) {
          if (state is AuthBlocInitial) {
            return SplashPage();
          } else if (state is AuthenticatedState) {
            // return HomePageParent(
            //     user: state.user, userRepository: userRepository);
            return HomePageParent();
          } else if (state is UnauthenticatedState) {
            // return LoginPageParent(userRepository: userRepository);
            return LoginPageParent();
          }
        },
      ),
    );
  }
}
