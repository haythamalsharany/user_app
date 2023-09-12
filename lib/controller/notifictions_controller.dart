import 'package:get/get.dart';
import 'package:my_ecommerce/core/class/statusrequest.dart';
import 'package:my_ecommerce/core/functions/handingdatacontroller.dart';
import 'package:my_ecommerce/core/services/services.dart';

import '../data/data_sources/remote/notifications_data.dart';

class NotificationsController extends GetxController {
  final NotifictionsData _notifictionsData = NotifictionsData(Get.find());
  final MyServices _myServices = Get.find();
  List notifictions = [];
  StatusRequest statusRequest = StatusRequest.none;

  getNotifications() async {
    statusRequest = StatusRequest.loading;
    var response = await _notifictionsData
        .getData(_myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        notifictions.addAll(response['data']);
      
      } else {
        statusRequest = StatusRequest.failure;
      }
      //
    }
    update();
  }

  @override
  void onInit() {
    getNotifications();
    super.onInit();
  }
}
