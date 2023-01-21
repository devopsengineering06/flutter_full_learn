import '../../../202/cache/shared_learn_cache.dart';
import '../../../product/service/project_dio.dart';
import '../../../product/service/project_network_manager.dart';
import '../model/resource_model.dart';
import '../service/reqres_service.dart';
import '../view/reqres_view.dart';

abstract class ReqresViewModel extends LoadingStatefull<ReqresView> with ProjectDioMixin {
  late final IReqresService reqresService;

  List<Data> resources = [];
  @override
  void initState() {
    super.initState();
    reqresService = ReqresService(ProjectNetworkManager.instance.service);
    ProjectNetworkManager.instance.addBaseHeaderToToken('veli');
    _fetch();
  }

  Future<void> _fetch() async {
    changeLoading();
    resources = (await reqresService.fetchResourceItem())?.data ?? [];
    changeLoading();
  }
}
