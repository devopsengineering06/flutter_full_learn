import 'package:vexana/vexana.dart';

import '../../404/bloc/feature/login/model/login_model.dart';

class VexanaNetworkManager extends NetworkManager<User> {
  VexanaNetworkManager() : super(options: BaseOptions(baseUrl: 'https://reqres.in/'));
}
