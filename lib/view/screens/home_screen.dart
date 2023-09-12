import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/core/constants/routes.dart';

import '../../controller/home_sceen_controller.dart';
import '../widgets/home/custom_bottom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(builder: (controller) {
      return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.shopping_basket_outlined),
          onPressed: () {
            Get.toNamed(AppRoute.cart);
          },
        ),
        bottomNavigationBar: const CustomBottomAppBar(),
        body: controller.pages.elementAt(controller.currentPage).values.first,
      );
    });
  }
}
