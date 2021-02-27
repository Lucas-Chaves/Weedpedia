import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/models.dart';
import '../../../repositories/repositories.dart';

import 'weeds.states.dart';

class WeedsCubit extends Cubit<WeedsStates> {
  final StrainApiImpl apiImpl;
  WeedsCubit({
    WeedsStates state,
    this.apiImpl,
  }) : super(WeedsInitialState());

  getAllStraint() async {
    try {
      emit(WeedsLoadingState());
      List<Marijuana> strains = await apiImpl.getAllStrains();
      emit(WeedsStraintInitialState(strains: strains));
    } catch (e) {
      emit(WeedsGenericErrorState());
    }
  }

  getAllStraintRefresh() async {
    try {
      emit(WeedsPullRefreshState());
      List<Marijuana> strains = await apiImpl.getAllStrains();
      emit(WeedsStraintInitialState(strains: strains));
    } catch (e) {
      emit(WeedsGenericErrorState());
    }
  }
}
