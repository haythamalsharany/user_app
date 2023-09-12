import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/core/constants/color.dart';
import 'package:my_ecommerce/core/constants/imgaeasset.dart';
import 'package:rating_dialog/rating_dialog.dart';

import '../../../controller/orders/archive_orders_controller.dart';

showRatingDialog(BuildContext context, String orderId) {
  showDialog(
    barrierDismissible: true, // set to false if you want to force a rating
    builder: (BuildContext context) {
      return RatingDialog(
        initialRating: 1.0,
        // your app's name?
        title: Text(
          '103'.tr,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
            color: AppColor.secondColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        // encourage your user to leave a high rating?
        message: Text(
          '102'.tr,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 15),
        ),
        // your app's logo?
        image: Image.asset(AppImageAsset.logo, height: 100, width: 100),
        submitButtonText: '104'.tr,

        submitButtonTextStyle: const TextStyle(
            color: AppColor.primaryColor, fontWeight: FontWeight.bold),
        commentHint: ' 105'.tr,
        showCloseButton: true,

        onSubmitted: (response) {
          ArchiveOrdersController controller = Get.find();
          controller.addRating(
              orderId: orderId,
              rating: response.rating,
              comment: response.comment);
        },
      );
    },
    context: context,
  );
}
