import '../../core/class/crud.dart';
import '../../core/constants/api_link.dart';

class CheckoutData {
  Crud crud;
  CheckoutData(this.crud);
  checkout(Map data) async {
    var response = await crud.postData(ApiLink.checkout, data);
    return response.fold((l) => l, (r) => r);
  }
}