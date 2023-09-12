import '../../../../core/class/crud.dart';
import '../../../../core/constants/api_link.dart';

class RatingData {
  final Crud apiOperations;

  RatingData(this.apiOperations);

  getData(String itemId) async {
    var response =
        await apiOperations.postData(ApiLink.viewRating, {'itemId': itemId});
    return response.fold((l) => l, (r) => r);
  }

  addData(Map data) async {
    var response = await apiOperations.postData(ApiLink.addRating, data);
    return response.fold((l) => l, (r) => r);
  }

   editData(Map data) async {
    var response = await apiOperations.postData(ApiLink.editRating, data);
    return response.fold((l) => l, (r) => r);
  }

   deleteData(Map data) async {
    var response = await apiOperations.postData(ApiLink.deleteRating, data);
    return response.fold((l) => l, (r) => r);
  }

   getItemColors(String itemId) async {
    var response =
        await apiOperations.postData(ApiLink.getItemColors, {'itemId': itemId});
    return response.fold((l) => l, (r) => r);
  }
}
