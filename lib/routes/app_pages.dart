
import 'package:campus_camaraderie_web/pages/login/component/authenticator_otp_component.dart';
import 'package:campus_camaraderie_web/pages/login/component/login_component.dart';
import 'package:get/get.dart';

part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: '/',
      page: () => LoginComponent(),
    ),
    GetPage(
        name: Routes.login,
        page: () => LoginComponent(),
        transitionDuration: Duration(milliseconds: 0)),
    GetPage(
        name: Routes.authenticatorOTP,
        page: () => AuthenticatorOTPComponent(),
        transitionDuration: Duration(milliseconds: 0)),



  ];
}
