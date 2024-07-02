import 'package:get/get.dart';

class CurrentUser extends GetxController {
  RxMap<String, dynamic> user = <String, dynamic>{}.obs;

  void setUser(Map<String, dynamic> userData) {
    user.value = userData;
  }

  void clearUser() {
    user.clear();
  }

  static CurrentUser get to => Get.find();

  @override
  void onInit() {
    super.onInit();
  }
}
