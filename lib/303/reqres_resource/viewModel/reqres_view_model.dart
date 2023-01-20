import 'package:flutter_full_learn/202/cache/shared_learn_cache.dart';
import 'package:flutter_full_learn/product/service/project_network_manager.dart';
import '../../../product/service/project_dio.dart';
import '../model/resource_model.dart';
import '../view/reqres_view.dart';
import '../service/reqres_service.dart';

abstract class ReqresViewModel extends LoadingStatefull<ReqresView> with ProjectDioMixin {
  late final IReqresService reqresService;
  List<Data> resources = [];

  @override
  void initState() {
    super.initState();
    reqresService = ReqresService(ProjectNetworkManager.instance.service);
    _fetch();
  }

  Future<void> _fetch() async {
    changeLoading();
    resources = (await reqresService.fetchResourceItem())?.data ?? [];
    changeLoading();
  }
}
