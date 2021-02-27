import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../models/models.dart';

@immutable
abstract class WeedsStates extends Equatable {
  const WeedsStates();
}

class WeedsInitialState extends WeedsStates {
  const WeedsInitialState();

  @override
  List<Object> get props => [];
}

class WeedsLoadingState extends WeedsStates {
  const WeedsLoadingState();

  @override
  List<Object> get props => [];
}

class WeedsPullRefreshState extends WeedsStates {
  const WeedsPullRefreshState();

  @override
  List<Object> get props => [];
}

class WeedsSuccessState extends WeedsStates {
  const WeedsSuccessState();

  @override
  List<Object> get props => [];
}

class WeedsGenericErrorState extends WeedsStates {
  const WeedsGenericErrorState();

  @override
  List<Object> get props => [];
}

class WeedsStraintInitialState extends WeedsStates {
  final List<Marijuana> strains;

  const WeedsStraintInitialState({this.strains});

  @override
  List<Object> get props => [strains];
}
