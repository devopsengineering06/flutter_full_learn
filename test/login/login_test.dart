import 'package:flutter_full_learn/404/bloc/feature/login/model/login_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vexana/vexana.dart';

import 'package:flutter_full_learn/404/bloc/feature/login/service/login_service.dart';

void main() {
  late ILoginService loginService;

  setUp(() {
    loginService = LoginService(NetworkManager<User?>(options: BaseOptions(baseUrl: 'https://reqres.in/')));
  });
  test('Login Test - eve.holt@reqres.in & cityslicka ', () async {
    final response = await loginService.login(User(email: 'eve.holt@reqres.in', password: 'cityslicka'));

    expect(response, isNotNull);
  });
}
