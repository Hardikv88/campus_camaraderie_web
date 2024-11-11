

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> loginGlobalKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  RxBool isLoading = false.obs;
  RxBool showPassword = false.obs;
  RxString emailValidation = 'Email'.obs;
  RxString phoneValidation = 'Number'.obs;

  TextEditingController verifyCode = TextEditingController();

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Future<void> onInit() async {

    super.onInit();
  }

  @override
  onReady() async {
    super.onReady();
  }

}