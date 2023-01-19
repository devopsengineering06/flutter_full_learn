import 'package:flutter_learn_full/202/cache/shared_learn_cache.dart';
import '../../../product/service/project_dio.dart';
import '../model/resource_model.dart';
import '../view/reqres_view.dart';
import '../service/reqres_service.dart';

abstract class ReqresViewModel extends LoadingStatefull<ReqresView>
    with ProjectDioMixin {
  late final IReqresService reqresService;
  List<Data> resources = [];

  @override
  void initState() {
    super.initState();
    reqresService = ReqresService(service);
    _fetch();
  }

  Future<void> _fetch() async {
    changeLoading();
    resources = (await reqresService.fetchResourceItem())?.data ?? [];
    changeLoading();
  }
}
