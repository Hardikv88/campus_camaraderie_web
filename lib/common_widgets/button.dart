import 'package:campus_camaraderie_web/constants/color_constants.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String buttonText;
  final double width;
  final VoidCallback? onpressed;
  final bool isLoading;
  final bool? noBg;
  final double? height;
  final bool? largeRadius;
  final bool isWeb;

  ButtonWidget(
      {required this.buttonText,
      required this.width,
      this.onpressed,
      required this.isLoading,
      this.noBg,
      this.height,
      this.largeRadius,
      this.isWeb = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(
            // width: 2.0,
            color: noBg == true
                ? ColorConstants.buttonPrimaryColor
                : ColorConstants.buttonSecondaryColor),
        // boxShadow: [
        //   BoxShadow(color: Colors.black26, offset: Offset(1, 1), blurRadius: 0)
        // ],
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.0, 1.0],
          colors: [
            noBg == true
                ? ColorConstants.buttonSecondaryColor
                : ColorConstants.buttonPrimaryColor,
            // Colors.deepPurple.shade200,
            noBg == true
                ? ColorConstants.buttonSecondaryColor
                : ColorConstants.buttonPrimaryColor,
          ],
        ),
        // color: Colors.white,
        borderRadius: BorderRadius.circular(largeRadius == true ? 20 : 8),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          // minimumSize: MaterialStateProperty.all(Size(width, 50)),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          // elevation: MaterialStateProperty.all(3),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
        ),
        onPressed: onpressed,
        child: isLoading
            ? SizedBox(
                width: getWidth(25),
                height: getHeight(25),
                child: const CircularProgressIndicator(
                  color: ColorConstants.whiteColor,
                  strokeWidth: 2,
                ),
              )
            : Text(
                buttonText,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "Inter",
                  // fontWeight: FontWeight.w800,
                  // fontWeight: FontWeight.w700,
                  color: noBg == true
                      ? ColorConstants.buttonFontSecondaryColor
                      : ColorConstants.buttonFontPrimaryColor,//buttonFontSecondaryColor
                ),
              ),
      ),
    );
  }
}
