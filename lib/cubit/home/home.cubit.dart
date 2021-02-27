import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/models.dart';
import '../../../repositories/repositories.dart';

import 'home.states.dart';

class HomeCubit extends Cubit<HomeStates> {
  final StrainApiImpl apiImpl;
  HomeCubit({
    HomeStates state,
    this.apiImpl,
  }) : super(HomeInitialState());

  getAllStraint() async {
    try {
      emit(HomeLoadingState());
      List<Marijuana> strains = await apiImpl.getAllStrains();
      emit(HomeStraintInitialState(strains: strains));
    } catch (e) {
      emit(HomeGenericErrorState());
    }
  }

  getAllStraintRefresh() async {
    try {
      emit(HomePullRefreshState());
      List<Marijuana> strains = await apiImpl.getAllStrains();
      emit(HomeStraintInitialState(strains: strains));
    } catch (e) {
      emit(HomeGenericErrorState());
    }
  }
}
