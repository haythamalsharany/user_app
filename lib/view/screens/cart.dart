import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/controller/cart_controller.dart';
import 'package:my_ecommerce/core/class/handlingdataview.dart';

import '../widgets/cart/cart_item.dart';
import '../widgets/cart/cart_top_section.dart';
import '../widgets/cart/custom_bottom_cart.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    return Scaffold(
      appBar: AppBar(
        title: Text('54'.tr),
      ),
      body: GetBuilder<CartController>(builder: (controller) {
        return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView(
              children: [
                const SizedBox(
                  height: 10,
                ),
                CartTopSection(
                  itemCount: controller.totalcountitems,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    ...List.generate(
                        controller.data.length,
                        (index) => CartItem(
                              cartModel: controller.data[index],
                            )),
                  ]),
                )
              ],
            ));
      }),
      bottomNavigationBar: GetBuilder<CartController>(builder: (controller) {
        return controller.data.isNotEmpty
            ? CustomBottomCart(
                couponController: controller.couponControler,
                totalPrice: controller.getTotalPrice(),
                onApplyCoupon: () {
                  controller.checkCoupon();
                },
                price: controller.priceorders,
                shipping: 300.00,
                discount: controller.couponDiscount,
              )
            : const SizedBox.shrink();
      }),
    );
  }
}
