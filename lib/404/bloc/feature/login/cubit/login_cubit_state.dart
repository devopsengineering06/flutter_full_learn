// ignore_for_file: public_member_api_docs, sort_constructors_first
// abstract class LoginState {}

// 1. yol    // Üstte abstract class dan türetilerek logicler yapılır
// class LoginInitial extends LoginState {
//   final bool isLoading = false;
// }

// 2. yol  Hocanın tercihi
import 'package:equatable/equatable.dart';
import 'package:flutter_full_learn/404/bloc/feature/login/model/login_model.dart';

class LoginState extends Equatable {
  final bool isLoading;
  final User? model;

  const LoginState({this.model, this.isLoading = false});

  @override
  List<Object?> get props => [isLoading, model];

  LoginState copyWith({    // Değer yollanmazsa en son değerini alır
    bool? isLoading,
    User? model,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      model: model ?? this.model,
    );
  }
}
