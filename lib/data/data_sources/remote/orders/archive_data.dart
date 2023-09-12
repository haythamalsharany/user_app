import '../../../../core/class/crud.dart';
import '../../../../core/constants/api_link.dart';

class OrdersArchuiveData {
  final Crud crud;

  OrdersArchuiveData(this.crud);

  getData(String userId) async {
    var response =
        await crud.postData(ApiLink.archiveOrders, {'userId': userId});
    return response.fold((l) => 1, (r) => r);
  }

  addRating(String orderId, String  rating, String? comment) async {
    var response = await crud.postData(ApiLink.rating,
        {'orderId': orderId, 'rating': rating, 'comment': comment});
    return response.fold((l) => 1, (r) => r);
  }
}
