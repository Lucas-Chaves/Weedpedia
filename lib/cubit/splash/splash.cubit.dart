import 'package:flutter_bloc/flutter_bloc.dart';

import 'splash.state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit(SplashState state) : super(SplashInitialState());

  void splashScreenLoading() async {
    emit(SplashLoadingState());
    await Future.delayed(Duration(seconds: 5));
    emit(SplashLoadedState());
  }
}
