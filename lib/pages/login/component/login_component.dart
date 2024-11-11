
import 'package:campus_camaraderie_web/common_widgets/button.dart';
import 'package:campus_camaraderie_web/common_widgets/rounded_textBox.dart';
import 'package:campus_camaraderie_web/common_widgets/text.dart';
import 'package:campus_camaraderie_web/constants/app_string_constants.dart';
import 'package:campus_camaraderie_web/constants/color_constants.dart';
import 'package:campus_camaraderie_web/constants/image_constants.dart';
import 'package:campus_camaraderie_web/pages/login/component/login_controller.dart';
import 'package:campus_camaraderie_web/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginComponent extends StatelessWidget {
  //const LoginComponent({super.key});
  final LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
          children: [
           Expanded(
             flex: 2,
        child: Image.asset(
          ImageConstants.loginBanner,
          fit: BoxFit.fill,//764
        ),
      ),
           Expanded(
                 flex: 2,
                child: Stack(
                  children: [
                    Center(
                      child: Form(
                        key: loginController.loginGlobalKey,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .11),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                             mainAxisSize: MainAxisSize.min,
                            children: [
                             SizedBox(
                                width: getWidth(160),
                                child: Container(
                                  decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                                  child: SvgPicture.asset(
                                    'assets/login_logo.svg',
                                    fit: BoxFit.fill,
                                      colorFilter: ColorFilter.mode(
                                        Colors.blue,  // Color to apply
                                        BlendMode.srcIn, // Blend mode for coloring
                                      )
                                  ),
                                ),
                              ),

                              SizedBox(height: getHeight(20)),
                              TextWidget(alignmentType: 'center',text: CS.welcomeBack,fontSize: 20,fontWeight: FontWeight.w700,textColor: ColorConstants.textFontBlue),
                              SizedBox(height: getHeight(8)),
                              TextWidget(alignmentType: 'center',text: CS.welcomeDetails,fontSize: 14,fontWeight: FontWeight.w500,textColor: ColorConstants.textDescription),

                              SizedBox(height: getHeight(30)),
                              TextWidget(text: CS.eMail,fontSize: 12,fontWeight: FontWeight.w500,textColor: ColorConstants.textFieldColors),
                              SizedBox(height: getHeight(8)),
                              Obx(() => RoundedTextBoxWidget(
                                isWeb: true,
                                hintText: CS.enterYourEmail,
                                keyboardtype: TextInputType.emailAddress,
                                controller: loginController.email,
                                isRequired: true,
                                validate: loginController.emailValidation.value,
                                onChanged: (val) {
                                  loginController.emailValidation.value =
                                  'Email';
                                  loginController.phoneValidation.value =
                                  '';
                                  if (val == '') {
                                    loginController.emailValidation.value = '';
                                  }
                                },
                                                           )),


                              SizedBox(height: getHeight(14)),
                              TextWidget(text: CS.password,fontSize: 12,fontWeight: FontWeight.w500,textColor: ColorConstants.textFieldColors),
                              SizedBox(height: getHeight(8)),
                              Obx(() => RoundedTextBoxWidget(
                                  hintText: CS.password,
                                  isPassword: true,
                                  isRequired: true,
                                  isWeb: true,
                                  controller: loginController.password,
                                  keyboardtype: TextInputType.visiblePassword,
                                  showPassword:
                                  loginController.showPassword.value,
                                  onShow: () {
                                    // debugPrint("print show");
                                    loginController.showPassword.value
                                        ? loginController.showPassword.value =
                                    false
                                        : loginController.showPassword.value =
                                    true;
                                  },
                                ),
                              ),
                              SizedBox(height: getHeight(20)),

                              TextWidget(text: CS.forgotPassword,fontSize: 13,fontWeight: FontWeight.w700,textColor: ColorConstants.textFontBlue),

                              SizedBox(height: getHeight(20)),

                              ButtonWidget(
                                  onpressed: () {
                                    Get.delete<LoginController>(force: true);
                                    Get.toNamed(Routes.authenticatorOTP, arguments: {
                                    });
                                  },
                                  buttonText: CS.login,
                                  isWeb: true,
                                  width: double.infinity,
                                  height: getHeight(46),
                                  isLoading: false),


                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0, // Positioning the text 10 pixels from the bottom
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 16.0),
                        child: TextWidget(text: CS.tagCampusCamaraderie,fontSize: 10,fontWeight: FontWeight.w500,textColor: ColorConstants.textFontBlue),
                      ),
                    )
                  ],
                ),
              ),
          ],
        ),
    );

  }
}




