class MyFavoriteModel {
  String? favoriteId;
  String? favoriteUserId;
  String? favoriteItemId;
  String? itemId;
  String? itemName;
  String? itemNameAr;
  String? itemDesc;
  String? itemDescAr;
  String? itemImage;
  String? itemCount;
  String? itemActive;
  String? itemPrice;
  String? itemDiscount;
  String? itemDate;
  String? itemCat;
  String? userId;

  MyFavoriteModel(
      {this.favoriteId,
      this.favoriteUserId,
      this.favoriteItemId,
      this.itemId,
      this.itemName,
      this.itemNameAr,
      this.itemDesc,
      this.itemDescAr,
      this.itemImage,
      this.itemCount,
      this.itemActive,
      this.itemPrice,
      this.itemDiscount,
      this.itemDate,
      this.itemCat,
      this.userId});

  MyFavoriteModel.fromJson(Map<String, dynamic> json) {
    favoriteId = json['favorite_id'];
    favoriteUserId = json['favorite_user_id'];
    favoriteItemId = json['favorite_item_id'];
    itemId = json['items_id'];
    itemName = json['items_name'];
    itemNameAr = json['items_name_ar'];
    itemDesc = json['items_desc'];
    itemDescAr = json['items_desc_ar'];
    itemImage = json['items_image'];
    itemCount = json['items_count'];
    itemActive = json['items_active'];
    itemPrice = json['items_price'];
    itemDiscount = json['items_discount'];
    itemDate = json['items_date'];
    itemCat = json['items_cat'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['favorite_id'] = favoriteId;
    data['favorite_user_id'] = favoriteUserId;
    data['favorite_item_id'] = favoriteItemId;
    data['items_id'] = itemId;
    data['items_name'] = itemName;
    data['items_name_ar'] = itemNameAr;
    data['items_desc'] = itemDesc;
    data['items_desc_ar'] = itemDescAr;
    data['items_image'] = itemImage;
    data['items_count'] = itemCount;
    data['items_active'] = itemActive;
    data['items_price'] = itemPrice;
    data['items_discount'] = itemDiscount;
    data['items_date'] = itemDate;
    data['items_cat'] = itemCat;
    data['user_id'] = userId;
    return data;
  }
}