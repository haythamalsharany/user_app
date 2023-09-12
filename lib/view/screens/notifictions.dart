import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:my_ecommerce/controller/notifictions_controller.dart';
import 'package:my_ecommerce/core/class/handlingdataview.dart';

import '../../core/constants/color.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationsController());
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          '112'.tr,
        ),
      ),
      body: GetBuilder<NotificationsController>(builder: (controller) {
        return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
                itemCount: controller.notifictions.length,
                itemBuilder: (context, index) => ListTile(
                      title: Text(
                          controller.notifictions[index]['notification_title']),
                      subtitle: Text(
                          controller.notifictions[index]['notification_body']),
                      trailing: Text(
                        Jiffy(
                          controller.notifictions[index]['date_time'],
                          "yyyy-MM-dd",
                        ).fromNow().toString(),
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColor.primaryColor),
                      ),
                    )));
      }),
    );
  }
}
