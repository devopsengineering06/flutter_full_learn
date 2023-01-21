import 'package:dio/dio.dart';
import 'package:flutter_full_learn/303/reqres_resource/model/resource_model.dart';
import 'package:flutter_full_learn/303/reqres_resource/service/reqres_service.dart';
import 'package:flutter_full_learn/303/reqres_resource/viewModel/reqres_provider.dart';

import 'package:flutter_full_learn/303/testtable/user_save_model.dart';
import 'package:flutter_full_learn/product/global/resource_context.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';

@GenerateMocks([ReqresProvider])
void main() {
  setUp(() {
    Map<String, Object> values = <String, Object>{'vb': "veli"};
    SharedPreferences.setMockInitialValues(values);
  });
  test('saveToLocale - Test', () {
    var mockProvider = ReqresProvider(ReqresService(Dio()));
    final resourceContext = ResourceContext();
    final result = mockProvider.saveToLocale(resourceContext, []);

    expect(result, []);
  });

  test('userTest - Test', () async {
    var userViewModel = UserSaveViewModel();
    final result = userViewModel.getReadData("vb", MockStore());

    expect(result, false);
  });

  test('fetchItems - Test', () async {
    var mockProvider = ReqresProvider(MockReqResService());
    final result = await mockProvider.fetchItems();

    expect(result, isNotEmpty);
  });
}

class MockReqResService extends IReqresService {
  MockReqResService() : super(Dio());

  @override
  Future<ResourceModel?> fetchResourceItem() async {
    return ResourceModel(data: [const Data(color: 'a', id: 1)]);
  }
}
