import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/items/item_details_controller.dart';
import '../../../core/constants/color.dart';
import '../../../core/functions/translate_database.dart';
import '../../widgets/items/custom_bottom_nav_bar.dart';
import '../../widgets/items/custom_item_color_option.dart';
import '../../widgets/items/custom_item_image_stack.dart';
import '../../widgets/items/custom_price_quantity.dart';
import '../../widgets/items/rating_section.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemDetailsControllerImp());

    return Scaffold(
      body: GetBuilder<ItemDetailsControllerImp>(builder: (controller) {
        return ListView(
          children: [
            CustomItemImageStack(itemModel: controller.itemModel),
            const SizedBox(
              height: 100,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Text(
                      translateDatabase(
                          arText: controller.itemModel.itemsNameAr,
                          enText: controller.itemModel.itemsName),
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge
                          ?.copyWith(color: AppColor.fourthColor, height: 2),
                    )),
                const SizedBox(
                  height: 10,
                ),
                CustomPriceQuantity(
                    itemModel: controller.itemModel,
                    onAdd: () {
                      controller.incrementQyn();
                    },
                    onDelete: () {
                    
                      controller.decrementQyn();
                    }),
                Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Text(
                        translateDatabase(
                            arText: controller.itemModel.itemsDescAr,
                            enText: controller.itemModel.itemsDesc),
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(height: 1.8))),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Text(
                      '45'.tr,
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge
                          ?.copyWith(color: AppColor.fourthColor, height: 2),
                    )),
                const SizedBox(
                  height: 10,
                ),
                CustomItemColorOptions(itemModel: controller.itemModel),
                const RatingItemSection()
              ],
            )
          ],
        );
      }),
      bottomNavigationBar: const CustomBotomNavBar(),
    );
  }
}
