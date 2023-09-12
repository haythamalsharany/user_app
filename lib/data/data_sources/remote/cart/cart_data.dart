



import '../../../../core/class/crud.dart';
import '../../../../core/constants/api_link.dart';

class CartData {
  final Crud apiOperations;

  CartData(this.apiOperations);

  addCartItem(String itemId, String userId,String qyt) async {
    var response = await apiOperations
        .postData(ApiLink.cartAdd, {'itemId': itemId, 'userId': userId,'Qyt': qyt});
    return response.fold((l) => l, (r) => r);
  }

  deleteCartItem(String itemId, String userId,String qyt) async {
    var response = await apiOperations
        .postData(ApiLink.cartDelete, {'itemId': itemId, 'userId': userId,'Qyt': qyt});
    return response.fold((l) => l, (r) => r);
  }
  getCartItems( String userId) async {
    var response = await apiOperations
        .postData(ApiLink.cartView, { 'userId': userId});
    return response.fold((l) => l, (r) => r);
  }
  getCartItemsCount( String itemId,String userId,) async {
    var response = await apiOperations
        .postData(ApiLink.cartGetItemCount, {'itemId': itemId, 'userId': userId});
    return response.fold((l) => l, (r) => r);
  }
  checkCoupon( String couponName) async {
    var response = await apiOperations
        .postData(ApiLink.checkCoupon, {'couponName': couponName});
    return response.fold((l) => l, (r) => r);
  }
}