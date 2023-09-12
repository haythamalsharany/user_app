import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/data/models/my_favorite.dart';

import '../../../controller/favorite_controller.dart';
import '../../../core/constants/api_link.dart';
import '../../../core/constants/color.dart';
import '../../../core/functions/translate_database.dart';

class CustomListItemsFav extends StatelessWidget {
  final MyFavoriteModel favModel;
  const CustomListItemsFav({super.key, required this.favModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //controller.goToItemDetails(favModel);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: "${favModel.itemId}",
                child: CachedNetworkImage(
                    imageUrl: '${ApiLink.itemsImageUrl}/${favModel.itemImage}',
                    fit: BoxFit.fill),
              ),
              Text(
                translateDatabase(
                    arText: favModel.itemNameAr, enText: favModel.itemName),
                style: const TextStyle(color: AppColor.black, fontSize: 16),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '${favModel.itemPrice} \$',
                    style: const TextStyle(
                        color: AppColor.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  GetBuilder<FavoriteControllerImp>(builder: (favController) {
                    return IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: AppColor.primaryColor,
                        ),
                        onPressed: () {
                          favController.setFavorite(favModel.itemId, '0');
                        });
                  })
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
