import '../../../../core/class/crud.dart';
import '../../../../core/constants/api_link.dart';

class OffersData {
  final Crud apiOperations;

  OffersData(this.apiOperations);

  getData() async {
    var response = await apiOperations.postData(ApiLink.offers, {});
    return response.fold((l) => l, (r) => r);
  }
}
