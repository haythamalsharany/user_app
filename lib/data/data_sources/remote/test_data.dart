import '../../../core/class/crud.dart';
import '../../../core/constants/api_link.dart';

class TestData {
  final Crud apiOperations;

  TestData(this.apiOperations);

  getData() async {
    var response = await apiOperations.postData(ApiLink.test, {});
    return response.fold((l) => l, (r) => r);
  }
}
