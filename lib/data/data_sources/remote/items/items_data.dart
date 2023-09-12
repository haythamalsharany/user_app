import '../../../../core/class/crud.dart';
import '../../../../core/constants/api_link.dart';

class ItemsData {
  final Crud apiOperations;

  ItemsData(this.apiOperations);

  getData(String catId,String usersid) async {
    var response =
        await apiOperations.postData(ApiLink.items, {'catId': catId,'usersid':usersid});
    return response.fold((l) => l, (r) => r);
  }
}
