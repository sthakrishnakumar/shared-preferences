import 'package:shared_preference/features/form/data/models/form_model.dart';
import 'package:shared_preference/features/form/data/service/service.dart';

class DataSource {
  Future<FormModel> getFormData() async {
    final result = await Service().getData();
    return FormModel.fromJson(result);
  }
}
