import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/core/class/handlingdataview.dart';
import 'package:my_ecommerce/core/shared/custom_appbar.dart';

import '../../controller/favorite_controller.dart';
import '../../controller/items/offers_controller.dart';
import '../../core/constants/api_link.dart';
import '../../core/constants/color.dart';
import '../../core/constants/imgaeasset.dart';
import '../../core/functions/translate_database.dart';
import '../../data/models/item_model.dart';
import 'home_page.dart';

class Offers extends StatelessWidget {
  const Offers({super.key});

  @override
  Widget build(BuildContext context) {
    OffersControllerImpl offersControllerImpl = Get.put(OffersControllerImpl());
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: ListView(
        children: [
          CustomAppBar(
            title: 'Offers',
            onPressedSearchIcon: () {
              offersControllerImpl.onSearchPresed();
            },
            onPressedfavIcon: () {
              offersControllerImpl.goToFavorite();
            },
            myController: offersControllerImpl.search,
            onChange: (val) {
              offersControllerImpl.checkSearch(val);
            },
          ),
          GetBuilder<OffersControllerImpl>(
              builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: !controller.isSearched
                      ? Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.items.length,
                            itemBuilder: (context, index) => CustomListItems(
                                itemModel: controller.items[index]),
                          ),
                        )
                      : SearchDataList(listData: controller.searchData))),
        ],
      ),
    ));
  }
}

class CustomListItems extends GetView<OffersControllerImpl> {
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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(
                              '${itemModel.itemsPriceDiscount} \$',
                              style: const TextStyle(
                                  color: AppColor.primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              '${itemModel.itemsPrice} \$',
                              style: const TextStyle(
                                  color: AppColor.grey,
                                  fontSize: 16,
                                  decoration: TextDecoration.lineThrough,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Icon(
                              Icons.access_time_outlined,
                              color: AppColor.grey,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(controller.myServices.sharedPreferences
                                .getString('deliveryTime')!),
                            const SizedBox(
                              width: 20,
                            ),
                             Text('106'.tr)
                          ],
                        )
                      ],
                    ),
                  ),
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
