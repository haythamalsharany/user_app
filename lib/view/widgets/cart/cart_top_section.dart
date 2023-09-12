import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/color.dart';

class CartTopSection extends StatelessWidget {
  final int itemCount;
  const CartTopSection({super.key, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: AppColor.thirdColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        '${'59'.tr} $itemCount  ${'60'.tr}',
        style: const TextStyle(fontSize: 16, color: AppColor.secondColor),
      ),
    );
  }
}
