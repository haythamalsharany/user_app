

import 'package:my_ecommerce/core/constants/api_link.dart';

import '../../../../core/class/crud.dart';

class OrdersDetailsData {
  final Crud crud;

  OrdersDetailsData(this.crud);

  getData(String orderId) async {
    var response =
        await crud.postData(ApiLink.orderDetails, {'orderId': orderId});
    return response.fold((l) => 1, (r) => r);
  }
}