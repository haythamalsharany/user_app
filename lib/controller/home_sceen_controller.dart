import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/view/screens/home_page.dart';
import 'package:my_ecommerce/view/screens/settings.dart';

import '../view/screens/notifictions.dart';
import '../view/screens/offers.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int index);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentPage = 0;
  List<Map<String, dynamic>> pages = [
    {'118'.tr: const HomePage(), 'icon': Icons.home_outlined},
    {
      '112'.tr: const Notifications(),
      'icon': Icons.notifications_active_outlined
    },
    {'41'.tr: const Offers(), 'icon': Icons.local_offer_sharp},
    {'83'.tr: const SettingsPage(), 'icon': Icons.settings}
  ];

  @override
  changePage(int index) {
    currentPage = index;
    update();
  }
}
