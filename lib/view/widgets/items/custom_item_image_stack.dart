import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/data/models/item_model.dart';

import '../../../core/constants/api_link.dart';
import '../../../core/constants/color.dart';

class CustomItemImageStack extends StatelessWidget {
  final ItemModel itemModel;
  const CustomItemImageStack({super.key, required this.itemModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          color: AppColor.secondColor,
          height: 180,
        ),
        Positioned(
            top: 30,
            left: Get.width / 8,
            right: Get.width / 5,
            child: Hero(
              tag: "${itemModel.itemsId}",
              child: CachedNetworkImage(
                  height: 250,
                  width: 200,
                  fit: BoxFit.fill,
                  imageUrl: '${ApiLink.itemsImageUrl}/${itemModel.itemsImage}'),
            ))
      ],
    );
  }
}
