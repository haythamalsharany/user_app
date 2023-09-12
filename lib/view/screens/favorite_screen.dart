import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/controller/favorite_controller.dart';
import 'package:my_ecommerce/core/class/handlingdataview.dart';
import 'package:my_ecommerce/view/widgets/favorite/custom_list_item_fav.dart';

import '../../core/shared/custom_appbar.dart';
import 'home_page.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteControllerImp());

    return Scaffold(
        body: Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GetBuilder<FavoriteControllerImp>(
        builder: (controller) => ListView(
          children: [
            CustomAppBar(
              title: '43'.tr,
              onPressedSearchIcon: () {
                controller.onSearchPresed();
              },
              myController: controller.search,
              onChange: (val) {
                controller.checkSearch(val);
              },
            ),
            HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: !controller.isSearched
                  ? GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 0.67),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.data.length,
                      itemBuilder: (context, index) {
                        return CustomListItemsFav(
                            favModel: controller.data[index]);
                      },
                    )
                  : SearchDataList(listData: controller.searchData),
            ),
          ],
        ),
      ),
    ));
  }
}
