import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/items/items_controller.dart';
import '../../../core/constants/color.dart';
import '../../../core/functions/translate_database.dart';

class CategoriesItems extends StatelessWidget {
  const CategoriesItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemsControllerImpl>(
        builder: (controller) => SizedBox(
              height: 50,
              child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                        width: 10,
                      ),
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.zero,
                  itemCount: controller.categoriesList.length,
                  itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          controller.changeCat(index);
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 80,
                              decoration: controller.selectedCat == index
                                  ? const BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: AppColor.primaryColor,
                                              width: 3)),
                                    )
                                  : const BoxDecoration(),
                              child: Text(
                                  translateDatabase(
                                      arText: controller.categoriesList[index]
                                          .categoriesNameAr,
                                      enText: controller.categoriesList[index]
                                          .categoriesName),
                                  style: const TextStyle(
                                      color: AppColor.grey, fontSize: 20)),
                            ),
                          ],
                        ),
                      )),
            ));
  }
}
