import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/controller/cart_controller.dart';
import 'package:my_ecommerce/core/constants/api_link.dart';

import '../../../core/constants/color.dart';
import '../../../core/functions/translate_database.dart';
import '../../../data/models/cart_model.dart';

class CartItem extends StatelessWidget {
  final CartModel cartModel;

  const CartItem({
    super.key,
    required this.cartModel,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.startToEnd,
      key: const Key('key'),
      child: Card(
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: CachedNetworkImage(
                  imageUrl: "${ApiLink.itemsImageUrl}/${cartModel.itemsImage!}",
                  fit: BoxFit.fill),
            ),
            Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          translateDatabase(
                              arText: cartModel.itemsNameAr!,
                              enText: cartModel.itemsName!),
                          style: const TextStyle(
                            fontSize: 20,
                            color: AppColor.black,
                          )),
                      Text(
                        ' ${cartModel.itemPrice!} \$',
                        style: const TextStyle(
                          fontSize: 20,
                          color: AppColor.primaryColor,
                        ),
                      ),
                    ],
                  ),
                )),
            Expanded(
                flex: 1,
                child: GetBuilder<CartController>(builder: (controller) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 15,
                        child: IconButton(
                          alignment: Alignment.center,
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            controller.addCartItem(cartModel.itemsId!,'1');
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 35,
                        child: Text(cartModel.itemCount!,
                            style: const TextStyle(
                                fontFamily: 'Cairo',
                                fontSize: 20,
                                color: AppColor.black)),
                      ),
                      SizedBox(
                        height: 20,
                        child: IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () {
                            controller.deleteCartItem(cartModel.itemsId!,'1');
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  );
                })),
          ],
        ),
      ),
    );
  }
}
