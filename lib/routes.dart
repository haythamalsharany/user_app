import 'package:get/get.dart';
import 'package:my_ecommerce/view/screens/about.dart';
import 'package:my_ecommerce/view/screens/address/add_address_details.dart';
import 'package:my_ecommerce/view/screens/address/address_edit.dart';
import 'package:my_ecommerce/view/screens/address/address_view.dart';
import 'package:my_ecommerce/view/screens/auth/forgetpassword/forgetpassword.dart';
import 'package:my_ecommerce/view/screens/auth/forgetpassword/resetpassword.dart';
import 'package:my_ecommerce/view/screens/auth/forgetpassword/success_resetpassword.dart';
import 'package:my_ecommerce/view/screens/auth/forgetpassword/verifycode.dart';
import 'package:my_ecommerce/view/screens/auth/login.dart';
import 'package:my_ecommerce/view/screens/auth/signup.dart';
import 'package:my_ecommerce/view/screens/auth/success_signup.dart';
import 'package:my_ecommerce/view/screens/auth/verifycodesignup.dart';
import 'package:my_ecommerce/view/screens/cart.dart';
import 'package:my_ecommerce/view/screens/favorite_screen.dart';
import 'package:my_ecommerce/view/screens/home_page.dart';
import 'package:my_ecommerce/view/screens/home_screen.dart';
import 'package:my_ecommerce/view/screens/items/items.dart';
import 'package:my_ecommerce/view/screens/language.dart';
import 'package:my_ecommerce/view/screens/onboarding.dart';
import 'package:my_ecommerce/view/screens/orders/archive_orders.dart';
import 'package:my_ecommerce/view/screens/orders/order_details.dart';

import 'core/constants/routes.dart';
import 'core/middleware/mymiddleware.dart';
import 'view/screens/address/add_address.dart';
import 'view/screens/checkout.dart';
import 'view/screens/items/item_details.dart';
import 'view/screens/orders/pinding_orders.dart';
import 'view/screens/settings.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]),
  // GetPage(name: "/", page: () => TestView()),
//  Auth
  GetPage(
    name: AppRoute.homeScreen,
    page: () => const HomeScreen(),
  ),
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => const VerfiyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoute.successResetpassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  GetPage(
      name: AppRoute.verfiyCodeSignUp, page: () => const VerfiyCodeSignUp()),
  //
  GetPage(name: AppRoute.homePage, page: () => const HomePage()),
  GetPage(name: AppRoute.items, page: () => const Items()),
  GetPage(name: AppRoute.itemdetails, page: () => const ItemDetails()),
  GetPage(name: AppRoute.myfavroite, page: () => const FavoriteScreen()),
  GetPage(name: AppRoute.settings, page: () => const SettingsPage()),
  GetPage(name: AppRoute.about, page: () => const About()),
  GetPage(name: AppRoute.cart, page: () => const Cart()),
  //address
  GetPage(name: AppRoute.addressView, page: () => const AddressView()),
  GetPage(name: AppRoute.addressAdd, page: () => const AddAddress()),
  GetPage(name: AppRoute.addressEdit, page: () => const AddressEdit()),
  GetPage(
      name: AppRoute.addressAddDetails, page: () => const AddressAddDetails()),
  GetPage(name: AppRoute.checkout, page: () => const Checkout()),
  GetPage(name: AppRoute.orderspending, page: () => const PindingOrders()),
  GetPage(name: AppRoute.ordersarchive, page: () => const ArchiveOrders()),
  GetPage(name: AppRoute.ordersdetails, page: () => const OrderDetails()),
  GetPage(name: AppRoute.lang, page: () => const Language()),
];
