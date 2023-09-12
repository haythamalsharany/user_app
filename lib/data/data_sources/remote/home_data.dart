import '../../../core/class/crud.dart';
import '../../../core/constants/api_link.dart';

class HomeData {
  final Crud apiOperations;

  HomeData(this.apiOperations);

  getData() async {
    var response = await apiOperations.postData(ApiLink.home, {});
    return response.fold((l) => l, (r) => r);
  }
   geSearchData(String searchText) async {
    var response = await apiOperations.postData(ApiLink.search, {"search":searchText});
    return response.fold((l) => l, (r) => r);
  }
}
