import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/controller/home_controller.dart';
import 'package:my_ecommerce/data/models/categories_model.dart';

import '../../../core/constants/api_link.dart';
import '../../../core/constants/color.dart';

class CategoriesHome extends GetView<HomeControllerImp> {
  const CategoriesHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
          scrollDirection: Axis.horizontal,

          itemCount: controller.categories.length,
          itemBuilder: (context, index) => InkWell(
                onTap: () {
                  controller.goToItems(controller.categories, index);
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                      color: AppColor.thirdColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: SvgPicture.network(
                      color: AppColor.secondColor,
                      '${ApiLink.categoriesImageUrl}/${CategoriesModel.fromJson(controller.categories[index]).categoriesImage}'),
                ),
              )),
    );
  }
}
