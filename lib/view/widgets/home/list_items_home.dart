import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/controller/home_controller.dart';

import '../../../core/constants/api_link.dart';
import '../../../core/constants/color.dart';
import '../../../core/functions/translate_database.dart';
import '../../../data/models/item_model.dart';

class ListItemsHome extends GetView<HomeControllerImp> {
  const ListItemsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.items.length,
          itemBuilder: (context, index) => InkWell(
                onTap: () {
                  controller.goToItemDetails(
                      ItemModel.fromJson(controller.items[index]!));
                },
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(30),
                      child: Image.network(
                        '${ApiLink.itemsImageUrl}/${ItemModel.fromJson(controller.items[index]).itemsImage}',
                        fit: BoxFit.fill,
                        width: 150,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColor.black.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(20)),
                      height: 140,
                      width: 200,
                    ),
                    Positioned(
                        left: 10,
                        child: Text(
                          translateDatabase(
                              arText:
                                  ItemModel.fromJson(controller.items[index])
                                      .itemsNameAr,
                              enText:
                                  ItemModel.fromJson(controller.items[index])
                                      .itemsName),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 17),
                        ))
                  ],
                ),
              )),
    );
  }
}
