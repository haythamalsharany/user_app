import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../../controller/items/item_details_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constants/color.dart';
import '../../../core/functions/alertexitapp.dart';
import '../../../core/shared/custom_title.dart';
import '../../../data/models/commet_model.dart';

class RatingItemSection extends GetView<ItemDetailsControllerImp> {
  const RatingItemSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              controller.onEdit('');
              alertRating(false);
            },
            child: GetBuilder<ItemDetailsControllerImp>(builder: (context) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                      5,
                      (index) => Icon(
                            index < double.parse(controller.rating).round()
                                ? Icons.star
                                : Icons.star_border_outlined,
                            size: 35,
                            color: AppColor.primaryColor,
                          ))
                ],
              );
            }),
          ),
          const SizedBox(
            height: 20,
          ),
           CustomTitle(
            title: '124'.tr,
          ),
          const SizedBox(
            height: 10,
          ),
          GetBuilder<ItemDetailsControllerImp>(builder: (logic) {
            return HandlingDataView(
                statusRequest: logic.statusRequest,
                widget: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      ...List.generate(logic.comments.length,
                          (index) => CommentListItem(logic.comments[index]))
                    ],
                  ),
                ));
          })
        ],
      ),
    );
  }
}

class CommentListItem extends GetView<ItemDetailsControllerImp> {
  final CommentRateModel comment;
  const CommentListItem(this.comment, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          border: Border.all(color: AppColor.grey)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                comment.commentRateuUserName!,
                style: const TextStyle(
                    color: AppColor.primaryColor, fontWeight: FontWeight.bold),
              ),
              if (controller.userId == comment.commentRateUserId!)
                PopupMenuButton(
                    icon: const Icon(Icons.more_horiz_outlined),
                    iconSize: 35,
                    itemBuilder: (contxt) {
                      return [
                        PopupMenuItem(
                            child: InkWell(
                                onTap: () {
                                  controller.onEdit(comment.commentRateComment!,
                                      id: comment.commentRateId!);
                                  alertRating(true);
                                },
                                child: const Icon(
                                  Icons.edit,
                                  color: AppColor.primaryColor,
                                ))),
                        PopupMenuItem(
                            child: InkWell(
                                onTap: () {
                                  deleteAlert(comment);
                                },
                                child: const Icon(
                                  Icons.delete_outlined,
                                  color: AppColor.secondColor,
                                )))
                      ];
                    }),
            ],
          ),
          Text(
            comment.commentRateComment!,
            style: const TextStyle(color: AppColor.fourthColor),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                Jiffy(
                  comment.commentRateDate,
                  "yyyy-MM-dd",
                ).fromNow().toString(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
