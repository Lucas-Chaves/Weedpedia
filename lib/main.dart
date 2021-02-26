import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maripedia/repositories/repositories.dart';
import './pages/splash.page.dart';
import './cubit/cubit.dart';

void main(List<String> args) {
  StrainApiImpl apiImpl = StrainApiImpl();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<SplashCubit>(
          create: (BuildContext context) => SplashCubit(
            SplashInitialState(),
          ),
        ),
        BlocProvider<HomeCubit>(
          create: (BuildContext context) => HomeCubit(
            state: HomeInitialState(),
            apiImpl: apiImpl,
          ),
        ),
      ],
      child: InitialApp(),
    ),
  );
}

class InitialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
