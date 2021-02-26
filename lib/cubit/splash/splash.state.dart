import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

@immutable
abstract class SplashState extends Equatable {
  const SplashState();
}

class SplashInitialState extends SplashState {
  const SplashInitialState();

  @override
  List<Object> get props => [];
}

class SplashLoadingState extends SplashState {
  const SplashLoadingState();

  @override
  List<Object> get props => [];
}

class SplashLoadedState extends SplashState {
  const SplashLoadedState();

  @override
  List<Object> get props => [];
}
