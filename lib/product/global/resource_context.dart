import 'package:flutter/cupertino.dart';
import 'package:flutter_learn_full/303/reqres_resource/model/resource_model.dart';

class ResourceContext extends ChangeNotifier {
  ResourceModel? model;

  void saveModel(ResourceModel? model) {
    this.model = model;
  }

  void clear() {
    model = null;
  }
}
