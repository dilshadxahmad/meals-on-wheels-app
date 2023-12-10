import 'package:flutter/material.dart';
import 'package:meals_on_wheels/utils/my_colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final Color? labelTextColor;
  final double? labelTextSize;
  final TextInputType? inputType;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final int? inputLength;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final FocusNode? focusNode;
  final TextAlign? textAlign;
  final EdgeInsets? contentPadding;
  final bool readOnly;
  final bool obscureText;
  final void Function()? onTap;
  final String? Function(String?)? customValidator;
  final void Function(String value)? onChanged;
  const CustomTextField({
    super.key,
    this.labelText,
    this.labelTextColor,
    this.controller,
    this.labelTextSize,
    this.inputType,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.inputLength,
    this.suffixIcon,
    this.prefixIcon,
    this.focusNode,
    this.textAlign,
    this.contentPadding,
    this.readOnly = false,
    this.obscureText = false,
    this.onTap,
    this.customValidator,
    this.onChanged,
  });
  @override
  Widget build(BuildContext context) {
    var textField = TextFormField(
      obscureText: obscureText,
      readOnly: readOnly,
      textAlign: textAlign ?? TextAlign.start,
      focusNode: focusNode,
      onTap: onTap,
      onChanged: onChanged,
      controller: controller,
      keyboardType: inputType,
      maxLength: inputLength,
      validator: customValidator,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        counterText: '',
        contentPadding: contentPadding ?? const EdgeInsets.all(8),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: focusedBorderColor ?? MyColors.grey,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        hintText: labelText,
        hintStyle: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: labelTextSize ?? 14,
          color: labelTextColor ?? MyColors.lightGrey,
        ),
      ),
      maxLines: 1,
      style: const TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 16,
        color: MyColors.black,
      ),
    );
    return textField;
  }
}
