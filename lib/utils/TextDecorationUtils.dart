import 'package:flutter/material.dart';
import 'package:flutter_generic_structure/utils/ViewUtils.dart';
import 'package:get/get.dart';

class TextDecorationUtils {
  static getInputDecoration(
      {String? hintText,
      String? labelText,
      bool? isFilled,
      Color? fillColor,
      Widget? prefixIcon,
      Widget? suffixIcon,
      EdgeInsetsGeometry? contentPadding,
      InputBorder? border,
      bool? isUnderLineBorder}) {
    return InputDecoration(
        border: InputBorder.none,
        isDense: true,
        labelStyle: Get.textTheme.titleSmall,
        hintStyle: Get.textTheme.subtitle1!
            .copyWith(color: Get.textTheme.caption!.color!.withOpacity(.6)),
        hintText: hintText,
//        labelText: labelText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        counterText: "",
        errorBorder: (isUnderLineBorder ?? false)
            ? underlineInputBorder()
            : borderDeco(),
        focusedBorder: (isUnderLineBorder ?? false)
            ? underlineInputBorder()
            : borderDeco(),
        enabledBorder: (isUnderLineBorder ?? false)
            ? underlineInputBorder()
            : borderDeco(),
        contentPadding: contentPadding ?? const EdgeInsets.symmetric(vertical: 12, horizontal: 8));
  }

  static OutlineInputBorder borderDeco() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(ViewUtils.radius),
      borderSide: BorderSide(color: Get.context!.iconColor!,width: .5),
    );
  }

  static UnderlineInputBorder underlineInputBorder() {
    return UnderlineInputBorder(
      borderSide: BorderSide(color: Get.iconColor ?? const Color(0xff),width: .5),
      borderRadius: BorderRadius.circular(ViewUtils.radius),
    );
  }

  static get getDynamicWidgetsTitleStyle =>
      Get.context!.textTheme.labelMedium!.copyWith(
        fontWeight: FontWeight.w400,
      );
}
