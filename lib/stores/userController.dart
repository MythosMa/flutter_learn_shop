import 'package:flutter_learn_shop/viewmodels/user.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  var user = UserInfo.fromJson({}).obs;

  updateUserInto(UserInfo newUser) {
    user.value = newUser;
  }
}
