import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './pages.dart';
import '../views/splash/splash.dart';
import '../cubit/cubit.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SplashCubit splashCubit = BlocProvider.of<SplashCubit>(context);

    return Scaffold(
      backgroundColor: Colors.black12,
      body: BlocBuilder<SplashCubit, SplashState>(
        cubit: splashCubit,
        builder: (BuildContext context, SplashState state) {
          if (state is SplashInitialState) {
            splashCubit.splashScreenLoading();
            return SplashView();
          } else if (state is SplashLoadingState) {
            return SplashView();
          } else if (state is SplashLoadedState) {
            Future.delayed(Duration.zero, () {
              Navigator.pushReplacement(context, createRoute(InitialPage()));
            });
            return Container();
          }
          return Container();
        },
      ),
    );
  }
}

PageRouteBuilder createRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 0.1);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
