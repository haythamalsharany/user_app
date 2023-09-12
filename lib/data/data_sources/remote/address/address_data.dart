import '../../../../core/class/crud.dart';
import '../../../../core/constants/api_link.dart';

class AddressData {
  Crud crud;
  AddressData(this.crud);
  getData(String usersid) async {
    var response =
        await crud.postData(ApiLink.addressView, {"userId": usersid});
    return response.fold((l) => l, (r) => r);
  }

  addData(String usersid, String name, String city, String street, String lat,
      String long) async {
    var response = await crud.postData(ApiLink.addressAdd, {
      "userId": usersid,
      "addressName": name,
      "city": city,
      "street": street,
      "lat": lat,
      "long": long,
    });
    return response.fold((l) => l, (r) => r);
  }


   editData(String addressId, String name, String city, String street, String lat,
      String long) async {
    var response = await crud.postData(ApiLink.addressEdit, {
      "addressId": addressId,
      "addressName": name,
      "city": city,
      "street": street,
      "lat": lat,
      "long": long,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String addressid) async {
    var response =
        await crud.postData(ApiLink.addressDelete, {"addressId": addressid});
    return response.fold((l) => l, (r) => r);
  }
}
