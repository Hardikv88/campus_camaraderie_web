import 'package:campus_camaraderie_web/constants/color_constants.dart';
import 'package:campus_camaraderie_web/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RoundedTextBoxWidget extends StatelessWidget {
  final String hintText;
  final bool? isPassword;
  final bool? isRequired;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final TextEditingController? controller;
  TextInputType? keyboardtype;
  final FocusNode? textFocusNode;
  final String? validate;
  final bool? showPassword;
  final VoidCallback? onShow;
  final TextEditingController? actualPassword;
  final bool? isLocation;
  final Widget? suffixWidget;
  final Widget? prefixIcon;
  final bool? isRoundedBorder;
  final bool readOnly;
  final TextCapitalization txtFormat;
  final bool isWeb;
  final Color hintColor;
  final TextInputAction textInputAction;
  final VoidCallback? onEditingComplete;
  final List<TextInputFormatter>? inputFormatters;

  RoundedTextBoxWidget({
    required this.hintText,
    this.onChanged,
    this.isRequired,
    this.controller,
    this.keyboardtype,
    this.isPassword,
    this.validate,
    this.showPassword = false,
    this.onShow,
    this.actualPassword,
    this.isLocation,
    this.suffixWidget,
    this.prefixIcon,
    this.textFocusNode,
    this.isRoundedBorder,
    this.readOnly = false,
    this.isWeb = false,
    this.hintColor = ColorConstants.buttonHintColor,
    this.txtFormat = TextCapitalization.none,
    this.textInputAction = TextInputAction.none,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.inputFormatters,
  });
  @override
  Widget build(BuildContext context) {
    // debugPrint("showPassword ${showPassword}");
    return Container(
      //height: ThemeConstants.height_80,
      // color: SizeColorConstants.GreyColor,
      child: TextFormField(
          // inputFormatters: <TextInputFormatter>[
          //       UpperCaseTextFormatter()
          // ],
          // textCapitalization: TextCapitalization.characters,
          inputFormatters: inputFormatters,
          readOnly: readOnly,
          onEditingComplete: onEditingComplete,
          onFieldSubmitted: onFieldSubmitted,
          obscureText: isPassword == true && showPassword == false
              ? true
              : isPassword == true && showPassword == true
                  ? false
                  : false,
          onChanged: onChanged,
          textInputAction: textInputAction,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          textAlignVertical: TextAlignVertical.center,
          cursorColor: ColorConstants.primaryColor,
          keyboardType: this.keyboardtype,
          focusNode: this.textFocusNode,
          style: TextStyle(
              // fontFamily: ThemeConstants.FONT_FAMILY,
              // backgroundColor: SizeColorConstants.GreyColor,
              color: ColorConstants.blackColor,
              fontSize: isWeb == true ? getFont(4) : getFont(16),
              //  height: ThemeConstants.height_1,
              fontWeight: FontWeight.w500),
          decoration: InputDecoration(
            // focusColor: SizeColorConstants.GreyColor,
            suffixIcon: isPassword == true
                ? GestureDetector(
                    child: Icon(showPassword == true
                        ? Icons.remove_red_eye
                        : Icons.visibility_off),
                    onTap: onShow)
                : isLocation == true
                    ? GestureDetector(
                        child: Icon(
                          Icons.location_on_outlined,
                        ),
                        onTap: onShow)
                    : suffixWidget != null
                        ? suffixWidget
                        : SizedBox(),
            contentPadding: EdgeInsets.symmetric(
                vertical: isWeb == true ? getPadding(8) : getPadding(16),
                horizontal: isWeb == true ? getPadding(8) : getPadding(16)),
            fillColor: ColorConstants.whiteColor,
            prefixIcon: prefixIcon,
            filled: true,
            hintText: hintText,
            errorMaxLines: 2,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorConstants.greyColor),
                borderRadius: BorderRadius.all(
                    Radius.circular(isRoundedBorder == true ? 60 : 8))),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorConstants.primaryColor),
                borderRadius: BorderRadius.all(
                    Radius.circular(isRoundedBorder == true ? 60 : 8))),
            hintStyle: TextStyle(
              color: hintColor == '' ? ColorConstants.textHintColor : hintColor,
              fontSize: isWeb == true ? getFont(4) : getFont(16),
              fontWeight: FontWeight.w500,
            ),
            isDense: true,
            errorStyle: TextStyle(
              // fontFamily: ThemeConstants.FONT_FAMILY,
              color: ColorConstants.redColor,
              fontSize: isWeb == true ? getFont(4) : getFont(16),
            ),
            focusColor: ColorConstants.blackColor,
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorConstants.redColor),
                borderRadius: BorderRadius.all(
                    Radius.circular(isRoundedBorder == true ? 60 : 8))),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorConstants.redColor),
                borderRadius: BorderRadius.all(
                    Radius.circular(isRoundedBorder == true ? 60 : 8))),
          ),
          controller: controller,
          validator: (value) {
            // print(value);
            if (actualPassword != null) {
              return checkValidation(
                  validate, value, this.actualPassword!.value);
            } else {
              return checkValidation(
                  validate != null
                      ? validate
                      : isRequired == true && value == null
                          ? "isRequired"
                          : '',
                  value,
                  '');
            }
            // Validations().email(value, isRequired, "Email");
          }),
    );
  }

  checkValidation(validate, val, val1) {
    // print('checkValidation ${controller!.text}');
    // String commentMark(int mark) {
    switch (validate) {
      case "Email": // Enter this block if mark == 0
        return Validations.instance.email(val, isRequired, "Email");
      case "Password":
        return Validations.instance.password(val, isRequired, "Password");
      case "isRequired":
        return "Field is required";
      case "ConfirmPassword":
        return Validations.instance.confirmPassword(val, val1);
      case "Name":
        return Validations.instance.isValidName(val, isRequired, hintText);
      case "Number":
        return Validations.instance.number(val, isRequired, hintText);
      // case 2:
      // case 3: // Enter this block if mark == 1 or mark == 2 or mark == 3
      //   return "mark is either 1, 2 or 3";
      // // etc.
      // default:
      //   return "mark is not 0, 1, 2 or 3";
    }
  }

  // }
}
