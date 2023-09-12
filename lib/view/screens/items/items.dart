import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/core/class/handlingdataview.dart';
import 'package:my_ecommerce/data/models/item_model.dart';

import '../../../controller/items/items_controller.dart';
import '../../../core/shared/custom_appbar.dart';
import '../../widgets/items/custom_list_items.dart';
import '../../widgets/items/items_categories.dart';
import '../home_page.dart';

class Items extends StatelessWidget {
  const Items({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   ItemsControllerImpl controller =  Get.put(ItemsControllerImpl());
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
            const CategoriesItems(),
            GetBuilder<ItemsControllerImpl>(
                builder: (controller) => HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget:!controller.isSearched ? GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 0.67),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.items.length,
                        itemBuilder: (context, index) => CustomListItems(
                              itemModel:
                                  ItemModel.fromJson(controller.items[index]),
                            ))
                            : SearchDataList(listData: controller.searchData)
                            ))
          ],
        ),
      ),
    );
  }
}
