
import 'package:campus_camaraderie_web/common_widgets/button.dart';
import 'package:campus_camaraderie_web/common_widgets/text.dart';
import 'package:campus_camaraderie_web/constants/app_string_constants.dart';
import 'package:campus_camaraderie_web/constants/color_constants.dart';
import 'package:campus_camaraderie_web/constants/image_constants.dart';
import 'package:campus_camaraderie_web/pages/login/component/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class AuthenticatorOTPComponent extends StatelessWidget {
 // const AuthenticatorOTPComponent({super.key});
  final LoginController controller = Get.put(LoginController());

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
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.security, size: 48, color: Colors.purple),
                        SizedBox(height: getHeight(20)),

                        TextWidget(alignmentType: 'center',text: CS.enter2FACode,fontSize: 20,fontWeight: FontWeight.w700,textColor: ColorConstants.textFontBlue),

                        SizedBox(height: getHeight(8)),

                        TextWidget(alignmentType: 'center',text: CS.enterTheCodeGeneratedWithYourAuthenticatorApp,fontSize: 14,fontWeight: FontWeight.w400,textColor: ColorConstants.textDescription),

                        SizedBox(height: getHeight(30)),


                        PinCodeTextField(
                          controller: controller.verifyCode,
                          cursorColor: ColorConstants.primaryColor,
                          animationType: AnimationType.none,
                          showCursor: true,
                          blinkWhenObscuring: true,
                          length: 6,
                          textStyle: const TextStyle(fontSize: 22,fontWeight: FontWeight.w500),
                          appContext: context,
                          onEditingComplete: () async {
                            if (controller.verifyCode.text.length >= 6){
                              //await controller.verifyOTP(context,controller.verifyCode.text);
                            }else{
                             /* SnackBarWidget(
                                  text: "OTP is invalid. Please enter correct OTP",
                                  snackType: 0);*/
                            }
                          },
                          onChanged: (val) async {
                            //print("onChanged===>${controller.verifyCode.text.length}");
                            //controller.enableResend.refresh();
                          },
                          pinTheme: PinTheme(
                            borderWidth: 0.2,
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(6),
                            fieldHeight: 50,
                            fieldWidth: 50,
                            activeFillColor: Colors.white,
                            activeColor: ColorConstants.primaryColor,
                            selectedColor: ColorConstants.primaryColor,
                            inactiveColor: ColorConstants.textHintColor,
                            inactiveFillColor: ColorConstants.textHintColor,
                          ),
                          hintCharacter: "O",
                          hintStyle: TextStyle(fontSize: 24,fontWeight: FontWeight.w700,color: ColorConstants.textHintColor),
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          keyboardType: TextInputType.number,
                        ),



                        SizedBox(height: getHeight(30)),

                        ButtonWidget(
                            onpressed: () {
                              //Get.delete<>(force: true);

                            },
                            buttonText: CS.submit,
                            isWeb: true,
                            width: double.infinity,
                            height: getHeight(46),
                            isLoading: false),

                        SizedBox(height: getHeight(20)),

                        GestureDetector(
                          onTap: (){
                            Get.back();
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.arrow_back_rounded,color: ColorConstants.textFontBlue),
                              SizedBox(width: getWidth(12)),
                              TextWidget(text: CS.backToLogin,fontSize: 15,fontWeight: FontWeight.w500,textColor: ColorConstants.textFontBlue),

                            ],
                          ),
                        )


                      ],
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

