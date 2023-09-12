import 'package:get/get.dart';
import 'package:my_ecommerce/data/models/categories_model.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constants/routes.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/data_sources/remote/items/items_data.dart';
import '../../data/models/item_model.dart';
import '../home_controller.dart';

abstract class ItemsController extends SearchMixController {
  initial();
  changeCat(int catIndex);
  getItems();
  getCatId();
  goToItemDetails(ItemModel itemModel);
  goToFavorite();
  addFavorite();
  removeFavorite();
}

class ItemsControllerImpl extends ItemsController {
  List categories = [];
  List<CategoriesModel> categoriesList = [];
  int? selectedCat;
  String? catId;
  MyServices myServices = Get.find();
  ItemsData itemsData = ItemsData(Get.find());

  List items = [];



  @override
  initial() {
    categories = Get.arguments['categories'];
    categoriesList =
        categories.map((e) => CategoriesModel.fromJson(e)).toList();
    selectedCat = Get.arguments['selectedCat'];
    getCatId();
  }

  @override
  void onInit() {
    super.onInit();
    initial();
    getItems();
  }

  @override
  changeCat(int catIndex) {
    selectedCat = catIndex;
    update();
    getCatId();
    getItems();
  }

  @override
  getItems() async {
    items.clear();
    statusRequest = StatusRequest.loading;

    var response = await itemsData.getData(
        catId!, myServices.sharedPreferences.getString('id')!);

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        items.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  @override
  getCatId() {
    catId = categories[selectedCat ?? 1]['categories_id'];
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

  @override
  addFavorite() {}

  @override
  removeFavorite() {}
}
