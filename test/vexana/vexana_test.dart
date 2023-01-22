// ignore_for_file: unused_local_variable

import 'package:flutter_full_learn/404/bloc/feature/login/model/login_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vexana/vexana.dart';

import 'model_unkown.dart';

void main() {
  late final INetworkManager networkManager;

  setUp(() {
    networkManager = NetworkManager<User>(
      options: BaseOptions(baseUrl: 'https://reqres.in/api'),
    );
  });
  test('Vexana test', () async {
    final response = await networkManager.send<UnkownModel, UnkownModel>('/unkown',
        parseModel: UnkownModel(), method: RequestType.GET);
  });
}
