import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/controller/cart_controller.dart';

import '../../../core/constants/color.dart';
import 'custom_button_cart.dart';

class CustomBottomCart extends StatelessWidget {
  final double price;
  final double totalPrice;
  final double shipping;
  final int discount;
  final TextEditingController couponController;
  final Function()? onApplyCoupon;

  const CustomBottomCart({
    super.key,
    required this.price,
    required this.shipping,
    required this.discount,
    required this.totalPrice,
    required this.couponController,
    this.onApplyCoupon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        GetBuilder<CartController>(builder: (controller) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            child: controller.couponName.isEmpty
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          flex: 3,
                          child: TextField(
                            controller: couponController,
                            decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColor.grey2)),
                                disabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey)),
                                contentPadding: const EdgeInsets.all(8),
                                hintText: '123'.tr),
                          )),
                      const SizedBox(
                        width: 4,
                      ),
                      Expanded(
                          flex: 2,
                          child: CustomButtonCoupon(
                              text: '122'.tr, onPressed: onApplyCoupon))
                    ],
                  )
                : Center(
                    child: Text(
                      '${'121'.tr}: ${controller.couponName}',
                      style: const TextStyle(
                          color: AppColor.secondColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
          );
        }),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          decoration: BoxDecoration(
              border: Border.all(color: AppColor.secondColor),
              borderRadius: BorderRadius.circular(10)),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    '55'.tr,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    '$price \$',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    '120'.tr,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    '$discount %',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    '57'.tr,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    '$shipping \$',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Divider(
                height: 3,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    '56'.tr,
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    '$totalPrice \$',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primaryColor,
                    ),
                  ),
                ),
              ],
            )
          ]),
        ),
        const CustomButtonCart()
      ]),
    );
  }
}

class CustomButtonCoupon extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomButtonCoupon({Key? key, required this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 0, right: 4, left: 4),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        padding: const EdgeInsets.symmetric(vertical: 14),
        onPressed: onPressed,
        color: AppColor.primaryColor,
        textColor: Colors.white,
        child: Text(text, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}
