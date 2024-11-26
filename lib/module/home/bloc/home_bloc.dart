import 'dart:async';

import 'package:appstean_test/main.dart';
import 'package:appstean_test/module/home/bloc/home_event.dart';
import 'package:appstean_test/module/home/bloc/home_state.dart';
import 'package:appstean_test/module/home/model/user_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  HomeBloc() : super(HomeInitialState()) {
    on(getListApi);
  }

  FutureOr<void> getListApi(GetListEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    List<UserResponse> response = await repository.getList();
    emit(GetListSuccessState(response: response));

  }
}
