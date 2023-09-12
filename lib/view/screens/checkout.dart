import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/core/constants/color.dart';
import 'package:my_ecommerce/core/constants/imgaeasset.dart';
import 'package:my_ecommerce/core/constants/routes.dart';
import 'package:my_ecommerce/core/shared/custom_title.dart';

import '../../controller/checkout_controller.dart';
import '../widgets/checkout/address_card.dart';
import '../widgets/checkout/delivery_type.dart';
import '../widgets/checkout/payment_method.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CheckoutController());
    return Scaffold(
      appBar: AppBar(
        title:  Text('111'.tr),
      ),
      body: GetBuilder<CheckoutController>(builder: (controller) {
        return Container(
          padding: const EdgeInsets.all(15),
          child: ListView(
            children: [
               CustomTitle(
                title: ' 68'.tr,
                textColor: AppColor.secondColor,
              ),
              PaymentMethod(
                methodName: '74'.tr,
                isActive: controller.paymentMethod == 'Cash',
              ),
              PaymentMethod(
                methodName: '75'.tr,
                isActive: controller.paymentMethod == 'Payment Card',
              ),
              const SizedBox(
                height: 20,
              ),
               CustomTitle(
                title: '119'.tr,
                textColor: AppColor.secondColor,
              ),
              Row(
                children: [
                  DeliveryType(
                    image: AppImageAsset.deliveryImage2,
                    isActive: controller.deliveryType == "0" ? true : false,
                    type: '0',
                  ),
                  DeliveryType(
                    image: AppImageAsset.drivethruImage,
                    isActive: controller.deliveryType == "1" ? true : false,
                    type: '1',
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTitle(
                title: '88'.tr,
                textColor: AppColor.secondColor,
              ),
              if (controller.addresses.isEmpty)
                Row(
                  children: [
                    CustomTitle(
                      title: '109'.tr,
                      textColor: AppColor.secondColor,
                    ),
                    TextButton(
                        onPressed: () {
                          Get.toNamed(AppRoute.addressAddDetails);
                        },
                        child: Text('110'.tr))
                  ],
                ),
              ...List.generate(
                  controller.addresses.length,
                  (index) => InkWell(
                        onTap: () {
                          controller.chooseShippingAddress(
                              controller.addresses[index].addressId!);
                        },
                        child: AddressCard(
                          title: controller.addresses[index].addressName!,
                          subtitle:
                              '${controller.addresses[index].addressCity} ${controller.addresses[index].addressStreet}',
                          isActive: controller.addressid ==
                              controller.addresses[index].addressId,
                        ),
                      )),
            ],
          ),
        );
      }),
      bottomNavigationBar:
          GetBuilder<CheckoutController>(builder: (controller) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: MaterialButton(
            color: AppColor.secondColor,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            onPressed: () {
              controller.checkout();
            },
            child: Text(
              '111'.tr,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        );
      }),
    );
  }
}
