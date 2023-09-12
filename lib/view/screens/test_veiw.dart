/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestView extends StatelessWidget {
  const TestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ());
    Get.lazyPut(() => TestController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('all users'),
        ),
        body: GetBuilder<TestController>(
          builder: (controller) {
         //   return HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) =>
                      Center(child: Text("${controller.data}"))),
            );
          },
        ));
  }
}
*/
