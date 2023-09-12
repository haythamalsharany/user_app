import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/controller/items/item_details_controller.dart';
import 'package:my_ecommerce/core/class/handlingdataview.dart';
import 'package:my_ecommerce/data/models/item_model.dart';

import '../../../core/constants/color.dart';

class CustomItemColorOptions extends StatelessWidget {
  final ItemModel itemModel;
  const CustomItemColorOptions({super.key, required this.itemModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GetBuilder<ItemDetailsControllerImp>(builder: (controllr) {
        return HandlingDataView(
            statusRequest: controllr.statusRequest,
            widget: Row(
              children: [
                ...List.generate(
                  controllr.colors.length,
                  (index) {
                    return InkWell(
                      onTap: () {
                        controllr.onSelectColor(index);
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(bottom: 5),
                        height: 60,
                        width: 90,
                        decoration: BoxDecoration(
                            color: index == controllr.activeColor
                                ? AppColor.fourthColor
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppColor.fourthColor)),
                        child: Text(controllr.colors[index].colorName!,
                            style: TextStyle(
                                color: index != controllr.activeColor
                                    ? AppColor.fourthColor
                                    : Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                    );
                  },
                )
              ],
            ));
      }),
    );
  }
}
