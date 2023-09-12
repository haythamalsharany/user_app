import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/address/address_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/shared/custombutton.dart';
import '../../widgets/auth/customtextformauth.dart';

class AddressEdit extends StatelessWidget {
  const AddressEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit address'),
      ),
      body: Container(
          padding: const EdgeInsets.all(15),
          child: GetBuilder<AddressController>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView(children: [
                  CustomTextFormAuth(
                      hinttext: "city",
                      labeltext: "city",
                      iconData: Icons.location_city,
                      mycontroller: controller.city,
                      valid: (val) {
                        return null;
                      },
                      isNumber: false),
                  CustomTextFormAuth(
                      hinttext: "street",
                      labeltext: "street",
                      iconData: Icons.streetview,
                      mycontroller: controller.street,
                      valid: (val) {
                        return null;
                      },
                      isNumber: false),
                  CustomTextFormAuth(
                      hinttext: "name",
                      labeltext: "name",
                      iconData: Icons.near_me,
                      mycontroller: controller.name,
                      valid: (val) {
                        return null;
                      },
                      isNumber: false),
                  CustomButton(
                    text: "Save",
                    onPressed: () {
                      controller.editAddress();
                    },
                  )
                ])),
          )),
    );
  }
}
