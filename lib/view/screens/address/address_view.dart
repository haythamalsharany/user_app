import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/controller/address/address_controller.dart';
import 'package:my_ecommerce/core/class/handlingdataview.dart';
import 'package:my_ecommerce/core/constants/color.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    AddressController addressController = Get.put(AddressController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Addresses',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColor.primaryColor,
      ),
      body: GetBuilder<AddressController>(builder: (controller) {
        return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (contex, index) => Card(
                child: ListTile(
                  onTap: () => controller.goToEdite(controller.data[index]),
                  title: Text(controller.data[index].addressName!),
                  subtitle: Text(
                      '${controller.data[index].addressCity!} / ${controller.data[index].addressStreet!}'),
                  trailing: IconButton(
                      onPressed: () {
                        controller
                            .deleteAddress(controller.data[index].addressId!);
                      },
                      icon: const Icon(Icons.delete_outline)),
                ),
              ),
            ));
      }),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add_location),
          onPressed: () {
            addressController.goTOAddressDetailAdd();
          }),
    );
  }
}
