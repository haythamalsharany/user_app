import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constants/routes.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/data_sources/remote/items/offers_data.dart';
import '../../data/models/item_model.dart';
import '../home_controller.dart';

abstract class OffersController extends SearchMixController {
  initial();

  getOffersItems();

  goToItemDetails(ItemModel itemModel);
  goToFavorite();
}

class OffersControllerImpl extends OffersController {
  MyServices myServices = Get.find();
  final OffersData _offersData = OffersData(Get.find());

  List<ItemModel> items = [];

  @override
  initial() {
    getOffersItems();
  }

  @override
  void onInit() {
    initial();
    super.onInit();
  }

  @override
  getOffersItems() async {
    items.clear();
    statusRequest = StatusRequest.loading;

    var response = await _offersData.getData();

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List data = response['data'];
        items.addAll(data.map((e) => ItemModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  

  @override
  goToItemDetails(ItemModel itemModel) {
    Get.toNamed(AppRoute.itemdetails, arguments: {'item': itemModel});
  }

  @override
  goToFavorite() {
    Get.toNamed(
      AppRoute.myfavroite,
    );
  }
}
