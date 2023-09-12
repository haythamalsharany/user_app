class ApiLink {
  //static const String baseUrl='http://localhost/myEccommerceApi/';
  // static const String baseUrl='10.0.0.160/myEcommerceApi/';
  static const String baseUrl = 'http://10.0.2.2/myEccommerceApi';
  static const String test = '$baseUrl/test.php';

  //===================== image ======================//
  static const String imageUrl = '$baseUrl/upload';
  static const String categoriesImageUrl = '$imageUrl/categories';
  static const String itemsImageUrl = '$imageUrl/items';
  //===================== Auth ======================//
  static const String signup = '$baseUrl/auth/signup.php';
  static const String verifySignup = '$baseUrl/auth/verifycode.php';
  static const String login = '$baseUrl/auth/login.php';
  static const String resend = '$baseUrl/auth/resend.php';

  //===================== forgot password ======================//
  static const String verifycode = '$baseUrl/forgetPassword/verifycode.php';
  static const String checkEmail = '$baseUrl/forgetPassword/checkEmail.php';
  static const String resetPassword =
      '$baseUrl/forgetPassword/resetPassword.php';

  //===================== Home ======================//
  static const String home = '$baseUrl/home.php';

  //===================== Items ======================//
  static const String items = '$baseUrl/items/items.php';
  static const String search = '$baseUrl/items/search.php';
  //===================== favorite ======================//
  static const String favoriteAdd = '$baseUrl/favorite/add.php';
  static const String favoriteRemove = '$baseUrl/favorite/remove.php';
  static const String favoriteView = '$baseUrl/favorite/view.php';
  //===================== cart ======================//
  static const String cartAdd = '$baseUrl/cart/add.php';
  static const String cartDelete = '$baseUrl/cart/delete.php';
  static const String cartView = '$baseUrl/cart/view.php';
  static const String cartGetItemCount = '$baseUrl/cart/getCountItem.php';
  static const String checkCoupon = '$baseUrl/coupon/check_coupon.php';
  //===================== Address ======================//
  static const String addressView = '$baseUrl/addresses/view.php';
  static const String addressAdd = '$baseUrl/addresses/add.php';
  static const String addressEdit = '$baseUrl/addresses/edit.php';
  static const String addressDelete = '$baseUrl/addresses/delete.php';
  //===================== orders ======================//
  static const String checkout = '$baseUrl/orders/checkout.php';
  static const String pindingOrders = '$baseUrl/orders/pinding.php';
  static const String archiveOrders = '$baseUrl/orders/archive.php';
  static const String deleteOrder = '$baseUrl/orders/delete.php';
  static const String orderDetails = '$baseUrl/orders/details.php';
  static const String rating = '$baseUrl/rating.php';
  //================================notifications=====================//
  static const String notifictionsView = '$baseUrl/notifications.php';
  static const String offers = '$baseUrl/offers.php';
    //================================rating=====================//
  static const String viewRating = '$baseUrl/product_rating/view_rating.php';
  static const String addRating = '$baseUrl/product_rating/add_rating.php';
  static const String editRating = '$baseUrl/product_rating/edit_rating.php';
  static const String deleteRating = '$baseUrl/product_rating/delete_rating.php';
    //================================itemColors=====================//
    static const String getItemColors = '$baseUrl/items/get_item_colors.php';


}
