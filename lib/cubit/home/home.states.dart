import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../models/models.dart';

@immutable
abstract class HomeStates extends Equatable {
  const HomeStates();
}

class HomeInitialState extends HomeStates {
  const HomeInitialState();

  @override
  List<Object> get props => [];
}

class HomeLoadingState extends HomeStates {
  const HomeLoadingState();

  @override
  List<Object> get props => [];
}

class HomePullRefreshState extends HomeStates {
  const HomePullRefreshState();

  @override
  List<Object> get props => [];
}

class HomeSuccessState extends HomeStates {
  const HomeSuccessState();

  @override
  List<Object> get props => [];
}

class HomeGenericErrorState extends HomeStates {
  const HomeGenericErrorState();

  @override
  List<Object> get props => [];
}

class HomeStraintInitialState extends HomeStates {
  final List<Marijuana> strains;

  const HomeStraintInitialState({this.strains});

  @override
  List<Object> get props => [strains];
}
