import 'package:flutter/material.dart';
import 'package:my_ecommerce/core/constants/color.dart';

class AddressCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isActive;
  const AddressCard(
      {super.key,
      required this.title,
      required this.subtitle, required this.isActive,
      });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isActive?AppColor.secondColor:null,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(color: isActive?Colors.white:null, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(color:isActive?Colors.white:null, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
