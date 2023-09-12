import '../../../core/class/crud.dart';
import '../../../core/constants/api_link.dart';

class NotifictionsData {
  final Crud apiOperations;

  NotifictionsData(this.apiOperations);

  getData(String userId) async {
    var response = await apiOperations
        .postData(ApiLink.notifictionsView, {'userId': userId});
    return response.fold((l) => l, (r) => r);
  }
}
