import 'package:my_ecommerce/core/constants/api_link.dart';

import '../../../../core/class/crud.dart';

class OrdersPindingsData {
  final Crud crud;

  OrdersPindingsData(this.crud);

  getData(String userId) async {
    var response =
        await crud.postData(ApiLink.pindingOrders, {'userId': userId});
    return response.fold((l) => 1, (r) => r);
  }


  delete(String orderId) async {
    var response =
        await crud.postData(ApiLink.deleteOrder, {'orderId': orderId});
    return response.fold((l) => 1, (r) => r);
  }
}
