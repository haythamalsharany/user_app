import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/core/services/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/constants/routes.dart';

abstract class SettingsController extends GetxController {}

class SettingsControllerImp extends SettingsController {
  List settingsList = [];
  MyServices myServices = Get.find();
  bool switchValue = false;
  logout() {
    var userId = myServices.sharedPreferences.getString('id');
    var userLang = myServices.sharedPreferences.getString('lang');
    FirebaseMessaging.instance.unsubscribeFromTopic('user');
    FirebaseMessaging.instance.unsubscribeFromTopic('user$userId');
    myServices.sharedPreferences.clear();
    myServices.sharedPreferences.setString('lang', userLang!);
    Get.offAndToNamed(AppRoute.login);
  }

  @override
  void onInit() {
    settingsList = [
      {
        'title': '47'.tr,
        'trailing': Switch(
            onChanged: (val) {
              switchValue = val;
              var userId = myServices.sharedPreferences.getString('id');
              if (val == true) {
                FirebaseMessaging.instance.subscribeToTopic('users');
                FirebaseMessaging.instance.subscribeToTopic('user$userId');
              } else {
                FirebaseMessaging.instance.unsubscribeFromTopic('user');
                FirebaseMessaging.instance.unsubscribeFromTopic('user$userId');
              }
            },
            value: switchValue),
        'onTap': () {
          switchValue = !switchValue;
        }
      },
      {
        'title': '48'.tr,
        'trailing': const Icon(Icons.card_travel),
        'onTap': () {
          Get.toNamed(AppRoute.orderspending);
        }
      },
      {
        'title': '49'.tr,
        'trailing': const Icon(Icons.card_travel),
        'onTap': () {
          Get.toNamed(AppRoute.ordersarchive);
        }
      },
      {
        'title': '53'.tr,
        'trailing': const Icon(Icons.location_on_outlined),
        'onTap': () {
          Get.toNamed(AppRoute.addressView);
        }
      },
        {
        'title': '81'.tr,
        'trailing': const Icon(Icons.language),
        'onTap': () {
          Get.toNamed(AppRoute.lang);
        }
      },
      {
        'title': '50'.tr,
        'trailing': const Icon(Icons.help_outline_rounded),
        'onTap': () {
          Get.toNamed(AppRoute.about);
        }
      },
      {
        'title': '50'.tr,
        'trailing': const Icon(Icons.help_outline_rounded),
        'onTap': () {
          Get.toNamed(AppRoute.about);
        }
      },
      {
        'title': '51'.tr,
        'trailing': const Icon(Icons.phone_callback_outlined),
        'onTap': () {
          launchUrl(Uri.parse('tel:+967715512377'));
        }
      },
      {
        'title': '52'.tr,
        'trailing': const Icon(Icons.exit_to_app),
        'onTap': () {
          logout();
        }
      },
    ];

    super.onInit();
  }

  changeSwitchVal(bool val) {
    switchValue = val;
    update();

    var userId = myServices.sharedPreferences.getString('id');
    if (val == true) {
      FirebaseMessaging.instance.subscribeToTopic('users');
      FirebaseMessaging.instance.subscribeToTopic('user$userId');
    } else {
      FirebaseMessaging.instance.unsubscribeFromTopic('user');
      FirebaseMessaging.instance.unsubscribeFromTopic('user$userId');
    }
  }
}
