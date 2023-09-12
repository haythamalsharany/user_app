import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/controller/items/item_details_controller.dart';

import '../../../core/constants/color.dart';
import '../../../data/models/item_model.dart';

class CustomPriceQuantity extends GetView<ItemDetailsControllerImp> {
  final ItemModel itemModel;
  final Function() onAdd;
  final Function() onDelete;
  const CustomPriceQuantity(
      {super.key,
      required this.itemModel,
      required this.onAdd,
      required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            IconButton(onPressed: onAdd, icon: const Icon(Icons.add)),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 5),
              width: 50,
              decoration:
                  BoxDecoration(border: Border.all(color: AppColor.black)),
              child: Text(controller.cartItemCount.toString(),
                  style: const TextStyle(
                      color: AppColor.black, fontSize: 20, height: 1.1)),
            ),
            IconButton(
                onPressed: controller.cartItemCount > 0 ? onDelete : null,
                icon: const Icon(Icons.remove))
          ],
        ),
        const Spacer(),
        if (itemModel.itemsDiscount != '0')
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 6),
            child: Text(
              '${itemModel.itemsPrice} \$',
              style: const TextStyle(
                  color: AppColor.grey,
                  fontSize: 26,
                  decorationThickness: 3,
                  decoration: TextDecoration.lineThrough,
                  height: 1.1),
            ),
          ),
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, bottom: 6),
          child: Text(
            '${itemModel.itemsPriceDiscount} \$',
            style: const TextStyle(
                color: AppColor.primaryColor,
                fontSize: 26,
                fontWeight: FontWeight.bold,
                height: 1.1),
          ),
        )
      ],
    );
  }
}
