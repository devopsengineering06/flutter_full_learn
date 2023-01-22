// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import '../../../../../product/model/token_model.dart';
import '../model/login_model.dart';

class LoginState extends Equatable {
  final bool isLoading;
  final User? model;
  final TokenModel? tokenModel;
  final bool isCompleted;

  const LoginState({this.isLoading = false, this.model, this.tokenModel, this.isCompleted = false});

  @override
  List<Object?> get props => [isLoading, model];

  LoginState copyWith({
    bool? isLoading,
    User? model,
    TokenModel? tokenModel,
    bool? isCompleted,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      model: model ?? this.model,
      tokenModel: tokenModel ?? this.tokenModel,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
