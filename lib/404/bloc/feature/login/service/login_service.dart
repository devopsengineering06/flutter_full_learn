import 'package:vexana/vexana.dart';

import 'package:flutter_full_learn/product/model/token_model.dart';
import '../model/login_model.dart';

abstract class ILoginService {
  final INetworkManager networkManager;

  ILoginService(this.networkManager);

  Future<TokenModel?> login(User model);

  final String _loginPath = 'api/login';
}

class LoginService extends ILoginService {
  LoginService(super.networkManager);

  @override
  Future<TokenModel?> login(User model) async {
    final response = await networkManager.send<TokenModel, TokenModel>(_loginPath,
        data: model, parseModel: TokenModel(), method: RequestType.POST);
    return response.data;
  }
}
