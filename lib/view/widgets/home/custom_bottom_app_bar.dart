import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/controller/home_sceen_controller.dart';

import '../../../core/constants/color.dart';
import 'custom_bottom_button.dart';

class CustomBottomAppBar extends GetView<HomeScreenControllerImp> {
  const CustomBottomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 50,
      shape: const CircularNotchedRectangle(),
      notchMargin: 10,
      child: Row(
        children: [
          ...List.generate(
            controller.pages.length + 1,
            (index) {
              int i = index > 2 ? index - 1 : index;
              return index == 2
                  ? const Spacer()
                  : GetBuilder<HomeScreenControllerImp>(builder: (logic) {
                      return CustomBottomNavButton(
                        activeColor: logic.currentPage == i
                            ? AppColor.primaryColor
                            : AppColor.grey2,
                        buttonText: logic.pages[i].keys.first,
                        buttonIcon: logic.pages[i]['icon'],
                        onPressed: () => logic.changePage(i),
                      );
                    });
            },
          )
        ],
      ),
    );
  }
}
