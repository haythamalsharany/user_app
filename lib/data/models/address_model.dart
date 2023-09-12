class AddressModel {
  String? addressId;
  String? addressUsersid;
  String? addressName;
  String? addressCity;
  String? addressStreet;
  String? addressLat;
  String? addressLong;

  AddressModel(
      {this.addressId,
      this.addressUsersid,
      this.addressName,
      this.addressCity,
      this.addressStreet,
      this.addressLat,
      this.addressLong});

  AddressModel.fromJson(Map<String, dynamic> json) {
    addressId = json['addresses_id'];
    addressUsersid = json['addresses_usersid'];
    addressName = json['addresses_name'];
    addressCity = json['addresses_city'];
    addressStreet = json['addresses_street'];
    addressLat = json['addresses_lat'];
    addressLong = json['addresses_long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['addresses_id'] = addressId;
    data['addresses_usersid'] = addressUsersid;
    data['addresses_name'] = addressName;
    data['addresses_city'] = addressCity;
    data['addresses_street'] = addressStreet;
    data['addresses_lat'] = addressLat;
    data['addresses_long'] = addressLong;
    return data;
  }
}
