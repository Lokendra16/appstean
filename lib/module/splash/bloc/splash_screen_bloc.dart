import 'package:appstean_test/main.dart';
import 'package:appstean_test/module/login/login_screen.dart';
import 'package:appstean_test/module/splash/bloc/splash_screen_event.dart';
import 'package:appstean_test/module/splash/bloc/splash_screen_state.dart';
import 'package:appstean_test/service/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  SplashScreenBloc() : super(SplashScreenInitialState()) {
    on((event, emit) => null);
  }


}
