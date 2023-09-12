import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/controller/items/items_controller.dart';
import 'package:my_ecommerce/core/constants/imgaeasset.dart';
import 'package:my_ecommerce/data/models/item_model.dart';

import '../../../controller/favorite_controller.dart';
import '../../../core/constants/api_link.dart';
import '../../../core/constants/color.dart';
import '../../../core/functions/translate_database.dart';

class CustomListItems extends GetView<ItemsControllerImpl> {
  final ItemModel itemModel;
  const CustomListItems({super.key, required this.itemModel});

  @override
  Widget build(BuildContext context) {
    FavoriteControllerImp favoriteController = Get.put(FavoriteControllerImp());
    favoriteController.isFavorite[itemModel.itemsId!] = itemModel.favorite!;
    return InkWell(
      onTap: () {
        controller.goToItemDetails(itemModel);
      },
      child: Card(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(
                    tag: "${itemModel.itemsId}",
                    child: CachedNetworkImage(
                        imageUrl:
                            '${ApiLink.itemsImageUrl}/${itemModel.itemsImage}',
                        fit: BoxFit.fill),
                  ),
                  Text(
                    translateDatabase(
                        arText: itemModel.itemsNameAr,
                        enText: itemModel.itemsName),
                    style: const TextStyle(color: AppColor.black, fontSize: 16),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Icon(
                        Icons.access_time_outlined,
                        color: AppColor.grey,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: [
                          Text(controller.myServices.sharedPreferences
                              .getString('deliveryTime')!),
                          const SizedBox(
                            width: 4,
                          ),
                           Text('106'.tr)
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '${itemModel.itemsPriceDiscount} \$',
                        style: const TextStyle(
                            color: AppColor.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      GetBuilder<FavoriteControllerImp>(
                          builder: (favController) {
                        return IconButton(
                            icon: Icon(
                              favController.isFavorite[itemModel.itemsId] == '0'
                                  ? Icons.favorite_border_outlined
                                  : Icons.favorite,
                              color: AppColor.primaryColor,
                            ),
                            onPressed: () {
                              if (favController.isFavorite[itemModel.itemsId] ==
                                  '0') {
                                favController.setFavorite(
                                    itemModel.itemsId, '1');
                              } else {
                                favController.setFavorite(
                                    itemModel.itemsId, '0');
                              }
                            });
                      })
                    ],
                  )
                ],
              ),
            ),
            itemModel.itemsDiscount != '0'
                ? Positioned(
                    left: controller.myServices.sharedPreferences
                                .getString('lang') ==
                            'en'
                        ? 4
                        : null,
                    right: controller.myServices.sharedPreferences
                                .getString('lang') ==
                            'ar'
                        ? 4
                        : null,
                    top: 4,
                    child: Image.asset(
                      AppImageAsset.saleOne,
                      width: 40,
                    ),
                  )
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
