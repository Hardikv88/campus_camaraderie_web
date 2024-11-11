import 'package:campus_camaraderie_web/constants/color_constants.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final double? fontSize;
  final String? alignmentType;
  final Color? textColor;
  final FontWeight? fontWeight;
  final VoidCallback? onpressed;
  final int? maxLine;

  TextWidget({
    required this.text,
    this.fontSize,
    this.alignmentType,
    this.textColor,
    this.fontWeight,
    this.onpressed,
    this.maxLine,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignmentType == "center"
          ? Alignment.center
          : alignmentType == "right"
              ? Alignment.centerRight
              : Alignment.centerLeft,
      child: GestureDetector(
        onTap: onpressed,
        child: Text(
          text,
          maxLines: maxLine,
          style: TextStyle(
              fontSize: fontSize,
              decoration: TextDecoration.none,
              fontFamily: "Inter",
              fontWeight: fontWeight != null ? fontWeight : FontWeight.normal,
              color: textColor != null
                  ? textColor
                  : ColorConstants.textBlack),

        ),
      ),
    );
  }
}
//textScaleFactor: MediaQuery.of(context).textScaleFactor,