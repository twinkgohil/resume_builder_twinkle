import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputTextField extends StatelessWidget {
  final String? initialValue;
  final String? labelText;
  final String? hintText;
  final String? Function(String?)? validator;
  final Function(String)? onFieldSubmitted;
  final Color? textColor;
  final TextEditingController controller;
  final TextInputType? textInputType;
  final int? errorMaxLines;
  final int maxLines;
  final int? minLines;
  final EdgeInsets? contentPadding;
  final Function()? onTap;
  final TextInputAction textInputAction;
  final String? errorText;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization? textCapitalization;
  final String? prefixText;
  final int? maxLength;

  const InputTextField({
    Key? key,
    this.initialValue,
    this.labelText,
    this.hintText,
    this.validator,
    this.textColor,
    required this.controller,
    this.textInputType,
    this.errorMaxLines,
    this.maxLines = 1,
    this.contentPadding,
    this.onTap,
    this.textInputAction = TextInputAction.next,
    this.errorText,
    this.onChanged,
    this.inputFormatters,
    this.prefixText,
    this.maxLength,
    this.minLines,
    this.onFieldSubmitted,
    this.textCapitalization,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildStackContainer();
  }

  _buildStackContainer() {
    return Stack(
      children: [
        TextFormField(
          inputFormatters: inputFormatters,
          initialValue: initialValue,
          maxLength: maxLength,
          controller: controller,
          onTap: onTap,
          cursorColor: Colors.black,
          textAlignVertical: TextAlignVertical.center,
          keyboardType: textInputType ?? TextInputType.text,
          maxLines: maxLines,
          minLines: minLines ?? 1,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          textInputAction: textInputAction,
          onChanged: onChanged,
          style: TextStyle(
            debugLabel: labelText,
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontFamily: "Inter",
          ),
          decoration: InputDecoration(
              labelText: labelText,
              errorText: errorText,
              counterText: "",
              focusColor: Colors.white,
              contentPadding: contentPadding ??
                  const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
              hintText: hintText,
              fillColor: Colors.white,
              errorMaxLines: errorMaxLines ?? 1,
              filled: true,
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide:
              BorderSide( color:Colors.grey, width: 1.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
              BorderSide(color:Colors.grey, width: 2.0),
            ),
             labelStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.5,
                  fontFamily: "Inter",
                  color: textColor ?? Colors.grey),
              alignLabelWithHint: true,
              hintStyle: const TextStyle(
                fontFamily: "Inter",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.5,
                color: Colors.grey,
              ),
            ),
          onFieldSubmitted: onFieldSubmitted,
          validator: validator,
          textCapitalization: textCapitalization ?? TextCapitalization.none,
        ),
      ],
    );
  }
}
