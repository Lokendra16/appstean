import 'package:appstean_test/module/home/model/user_response.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {}

class HomeInitialState extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoadingState extends HomeState {
  @override
  List<Object> get props => [];
}

class GetListSuccessState extends HomeState {
  final List<UserResponse> response;

  GetListSuccessState({required this.response});

  @override
  List<Object> get props => [response];
}

class HomeFailureState extends HomeState {
  final String msg;

  HomeFailureState({required this.msg});

  @override
  List<Object> get props => [];
}
