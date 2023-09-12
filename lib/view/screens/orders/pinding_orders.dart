import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/controller/orders/pindings_orders_controller.dart';
// ignore: unused_import
import 'package:my_ecommerce/data/models/orders_model.dart';

import '../../../core/class/handlingdataview.dart';
import '../../widgets/orders/orders_list_card.dart';

class PindingOrders extends StatelessWidget {
  const PindingOrders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PindingsOrdersController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      body: GetBuilder<PindingsOrdersController>(
        builder: (controller) {
          return HandlingDataView(statusRequest: controller.statusRequest, widget: ListView.builder(
              itemCount: controller.pindingsOrders.length,
              itemBuilder: (context, index) {
               
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child:  OrdersListCard(ordersModel: controller.pindingsOrders[index],controller: controller,),
                );
              }),);
        }
      ),
    );
  }
}
