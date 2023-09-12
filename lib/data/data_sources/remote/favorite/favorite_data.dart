import '../../../../core/class/crud.dart';
import '../../../../core/constants/api_link.dart';

class FavoriteData {
  final Crud apiOperations;

  FavoriteData(this.apiOperations);

  addFavorite(String itemId, String userId) async {
    var response = await apiOperations
        .postData(ApiLink.favoriteAdd, {'itemId': itemId, 'userId': userId});
    return response.fold((l) => l, (r) => r);
  }

  removeFavorite(String itemId, String userId) async {
    var response = await apiOperations
        .postData(ApiLink.favoriteRemove, {'itemId': itemId, 'userId': userId});
    return response.fold((l) => l, (r) => r);
  }

  getFavorite(String userId) async {
    var response =
        await apiOperations.postData(ApiLink.favoriteView, {'userId': userId});
    return response.fold((l) => l, (r) => r);
  }
}
