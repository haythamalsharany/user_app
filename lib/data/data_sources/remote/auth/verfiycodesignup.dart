import '../../../../core/class/crud.dart';
import '../../../../core/constants/api_link.dart';

class VerfiyCodeSignUpData {
  Crud crud;
  VerfiyCodeSignUpData(this.crud);
  postdata(String email, String verifycode) async {
    var response = await crud.postData(
        ApiLink.verifySignup, {"email": email, "verifycode": verifycode});
    return response.fold((l) => l, (r) => r);
  }

  resendData(String email) async {
    var response = await crud.postData(ApiLink.resend, {"email": email});
    return response.fold((l) => l, (r) => r);
  }
}
