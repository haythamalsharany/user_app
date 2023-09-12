import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/routes.dart';
import '../../core/localization/changelocal.dart';
import '../widgets/language/custombuttomlang.dart';

class Language extends GetView<LocaleController> {
  const Language({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("1".tr, style: Theme.of(context).textTheme.displayLarge),
              const SizedBox(height: 20),
              CustomButtonLang(
                  textbutton: "Ar",
                  onPressed: () {
                    controller.changeLang("ar");
                    if (controller.myServices.sharedPreferences
                            .getString('step') ==
                        '2') {
                      Get.toNamed(AppRoute.homeScreen);
                    } else {
                      Get.toNamed(AppRoute.onBoarding);
                    }
                  }),
              CustomButtonLang(
                  textbutton: "En",
                  onPressed: () {
                    controller.changeLang("en");
                    if (controller.myServices.sharedPreferences
                            .getString('step') =='2') {
                      Get.toNamed(AppRoute.homeScreen);
                    } else {
                      Get.toNamed(AppRoute.onBoarding);
                    }
                  }),
            ],
          )),
    );
  }
}
