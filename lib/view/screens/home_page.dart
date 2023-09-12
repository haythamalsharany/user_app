import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/controller/home_controller.dart';
import 'package:my_ecommerce/core/class/handlingdataview.dart';
import 'package:my_ecommerce/core/functions/translate_database.dart';
import 'package:my_ecommerce/data/models/item_model.dart';

import '../../core/constants/api_link.dart';
import '../../core/constants/color.dart';
import '../widgets/home/categories_home.dart';
import '../../core/shared/custom_appbar.dart';
import '../widgets/home/custom_discount_home.dart';
import '../../core/shared/custom_title.dart';
import '../widgets/home/list_items_home.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(builder: (controller) {
      return Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            children: [
              CustomAppBar(
                title: '43'.tr,
                onPressedSearchIcon: () {
                  controller.onSearchPresed();
                },
                onPressedfavIcon: () {
                  controller.goToFavorite();
                },
                myController: controller.search,
                onChange: (val) {
                  controller.checkSearch(val);
                },
              ),
              HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: !controller.isSearched
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomDiscountHome(
                              title: translateDatabase(
                                  arText: 'مفاجأة الموسم',
                                  enText: controller.body),
                              body: translateDatabase(
                                  arText: 'تخفيض 20 %',
                                  enText: controller.body),
                            ),
                            CustomTitle(
                              title: '39'.tr,
                            ),
                            const CategoriesHome(),
                             CustomTitle(
                              title: '113'.tr,
                            ),
                            const ListItemsHome(),
                          ],
                        )
                      : SearchDataList(listData: controller.searchData))
            ],
          ),
        ),
      );
    });
  } 
}

class SearchDataList extends GetView<HomeControllerImp> {
  final List<ItemModel> listData;
  const SearchDataList({super.key, required this.listData});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listData.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          controller.goToItemDetails(listData[index]);
        },
        child: Card(
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: CachedNetworkImage(
                    imageUrl:
                        "${ApiLink.itemsImageUrl}/${listData[index].itemsImage!}",
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
                                arText: listData[index].itemsNameAr!,
                                enText: listData[index].itemsName!),
                            style: const TextStyle(
                              fontSize: 20,
                              color: AppColor.black,
                            )),
                        Text(
                          ' ${translateDatabase(arText: listData[index].categoriesNamaAr!, enText: listData[index].categoriesName!)} ',
                          style: const TextStyle(
                            fontSize: 20,
                            color: AppColor.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
