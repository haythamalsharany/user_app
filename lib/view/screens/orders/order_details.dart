import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/core/class/handlingdataview.dart';
import 'package:my_ecommerce/core/shared/custom_title.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

import '../../../controller/orders/orders_details_controller.dart';
import '../../../core/constants/color.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersDetailsController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Order Details'),
        ),
        body: GetBuilder<OrdersDetailsController>(
          builder: (controller) {
            return HandlingDataView(statusRequest: controller.statusRequest, widget: ListView(
              children: [
                Card(
                  child: Column(
                    children: [
                      Table(
                        children: [
                          const TableRow(children: [
                            Text(
                              'Item',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColor.primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'QIY',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColor.primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Price',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColor.primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ]),
                          ...List.generate(controller.data.length, (index) {
                            return TableRow(children: [
                              Text(
                                controller.data[index].itemsName!,
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                controller.data[index].itemCount!,
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                '${controller.data[index].itemPrice!}\$',
                                textAlign: TextAlign.center,
                              )
                            ]);
                          })
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Text(
                          'Total Price : ${controller.ordersModel.ordersTotalprice}!\$',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                Card(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomTitle(
                            title: 'Shipping Address',
                          ),
                          Text(
                              'City : ${controller.ordersModel.addressCity!} '),
                          Text(
                              'Street :  ${controller.ordersModel.addressStreet!}  '),
                          Text('Name: ${controller.ordersModel.addressName!}  ')
                        ],
                      )),
                ),
                Card(
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        height: 300,
                        width: double.infinity,
                        child: OpenStreetMapSearchAndPick(
                            center:  LatLong(double.parse(controller.ordersModel.addressLat!),double.parse(controller.ordersModel.addressLong!)),
                            buttonHeight: 1,
                            buttonText: '',
                            buttonColor: Colors.transparent,
                            onPicked: (pickedData) {})))
              ],
            ));
          },
        ));
  }
}
