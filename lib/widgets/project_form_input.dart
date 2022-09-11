import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ryalize/utils/base_model.dart';
import 'package:ryalize/utils/base_widget.dart';
import 'package:ryalize/utils/constants.dart';
import 'package:ryalize/utils/validators.dart';

enum EnumKeyboardType { email, number, multiline }

class ProjectFormInput extends StatelessWidget {
  final String? placeholder, initialValue, label;
  final Key? key;
  final Widget? prefixIcon;
  final bool? password;
  final bool lastFormItem;
  final bool isMultiline;
  final bool withNoBorder, isDesignTwo;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  void Function(String)? onChange;
  final Function(String)? onFieldSubmitted;
  final EnumKeyboardType? keyboardType;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;

  ProjectFormInput({
    this.key,
    this.placeholder,
    this.prefixIcon,
    this.controller,
    this.password = false,
    this.lastFormItem = false,
    this.withNoBorder = false,
    this.focusNode,
    this.onChange,
    this.isDesignTwo = false,
    this.initialValue,
    this.label,
    this.isMultiline = false,
    this.validator,
    this.onSaved,
    this.keyboardType,
    this.onFieldSubmitted,
    this.inputFormatters,
  }) : super(key: key);

  FilteringTextInputFormatter? numberFormatter;

  TextInputType _computeInputType(EnumKeyboardType? type) {
    switch (type) {
      case EnumKeyboardType.email:
        return TextInputType.emailAddress;
      case EnumKeyboardType.multiline:
        return TextInputType.multiline;
      case EnumKeyboardType.number:
        numberFormatter = FilteringTextInputFormatter(
          RegExp(r'^\d+\.?\d{0,2}'),
          allow: true,
        );
        return TextInputType.phone;
      default:
        return TextInputType.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget<_InputFieldVM>(
        model: _InputFieldVM(),
        builder: (context, model, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ProjectTextTitle(
              //   placeholder ?? '',
              //   textSize: kFontSizeMedium,
              // ).paddingBottom(kSpacingSmall).visible(label is String),
              TextFormField(
                  controller: controller,
                  key: key,
                  obscureText:
                      password is bool && password == true && model.show
                          ? true
                          : false,
                  validator: validator,
                  focusNode: focusNode,
                  onChanged: onChange,
                  initialValue: initialValue,
                  maxLines: isMultiline ? null : 1,
                  textInputAction: lastFormItem
                      ? TextInputAction.done
                      : TextInputAction.next,
                  keyboardType: _computeInputType(keyboardType),
                  onSaved: onSaved,
                  onFieldSubmitted: onSaved,
                  inputFormatters: inputFormatters ??
                      ((numberFormatter != null) ? [numberFormatter!] : null),
                  style: const TextStyle(
                      color: kColorBlack,
                      fontSize: kFontSizeMedium,
                      fontFamily: kFontFamilyBold),
                  decoration: isDesignTwo
                      ? type2(
                          label: label,
                          placeholder: placeholder,
                          password: password,
                          model: model,
                          prefixIcon: prefixIcon,
                          withNoBorder: withNoBorder)
                      : type1(
                          label: label,
                          placeholder: placeholder,
                          password: password,
                          model: model,
                          prefixIcon: prefixIcon,
                          withNoBorder: withNoBorder)),
            ],
          );
        });
  }
}

InputDecoration type1(
        {bool withNoBorder = false,
        required _InputFieldVM model,
        String? placeholder,
        String? label,
        Widget? prefixIcon,
        bool? password = false}) =>
    InputDecoration(
        enabledBorder: withNoBorder
            ? InputBorder.none
            : const OutlineInputBorder(
                borderSide: BorderSide(color: kColorGrey, width: 1),
                borderRadius: kBorderRadius,
              ),
        errorStyle: const TextStyle(
          fontFamily: kFontFamilyRegular,
        ),
        border: withNoBorder
            ? InputBorder.none
            : const OutlineInputBorder(
                borderSide: BorderSide(
                    color: kColorGrey, style: BorderStyle.none, width: 2),
                borderRadius: kBorderRadius,
              ),
        hintText: placeholder,
        labelText: label,
        prefixIcon: prefixIcon,
        labelStyle: const TextStyle(
            color: kColorDarkGrey,
            fontSize: kFontSizeMedium,
            letterSpacing: 0,
            fontFamily: kFontFamilyBold),
        suffixIcon: password is bool && password == true
            ? InkWell(
                onTap: () => model.show = !model.show,
                child: _ShowPasswordWidget(
                  show: model.show,
                ),
              )
            : null,
        hintStyle: const TextStyle(fontSize: kFontSizeMedium));

InputDecoration type2(
        {bool withNoBorder = false,
        required _InputFieldVM model,
        String? placeholder,
        String? label,
        Widget? prefixIcon,
        bool? password = false}) =>
    InputDecoration(
        hintText: placeholder,
        hintStyle: TextStyle(
            color: kColorBlack.withOpacity(0.3), fontSize: kFontSizeNormal),
        fillColor: kColorWhite,
        suffixIcon: password is bool && password == true
            ? InkWell(
                onTap: () => model.show = !model.show,
                child: _ShowPasswordWidget(
                  show: model.show,
                ),
              )
            : null,
        filled: true,
        prefixIcon: prefixIcon,
        contentPadding: const EdgeInsets.symmetric(
            horizontal: kSpacingMedium, vertical: kSpacingSmall),
        border: OutlineInputBorder(
          borderSide: BorderSide(
              color: kColorPrimaryText.withOpacity(0.4),
              style: BorderStyle.none,
              width: 2),
          borderRadius: BorderRadius.circular(5),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: kColorPrimaryText.withOpacity(0.4),
              style: BorderStyle.none,
              width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        errorStyle:
            const TextStyle(color: kColorWhite, fontFamily: kFontFamilyRegular),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: kColorPrimaryText.withOpacity(0.4),
              style: BorderStyle.none,
              width: 2),
          borderRadius: BorderRadius.circular(12),
        ));

class _InputFieldVM extends BaseModel {
  // show
  bool _show = true;
  bool get show => _show;
  set show(bool value) {
    _show = value;
    notifyListeners();
  }
}

class _ShowPasswordWidget extends StatelessWidget {
  final bool show;
  _ShowPasswordWidget({this.show = false});
  @override
  Widget build(BuildContext context) {
    return Center(
      widthFactor: 2,
      child: Icon(
        show ? EvaIcons.eyeOutline : EvaIcons.eyeOffOutline,
      ),
    );
  }
}

class _FormItemOTPVM extends BaseModel {
  String _pin = "";
  String get pin => _pin;
  set pin(String value) {
    _pin = value;
    print('**************************');
    print(value);
    notifyListeners();
  }
}

class FormItemOTP extends StatelessWidget {
  final Function(String) callback;
  final int _length = 6;

  const FormItemOTP({
    Key? key,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<_FormItemOTPVM>(
        model: _FormItemOTPVM(),
        builder: (context, model, child) {
          return Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                bottom: -20,
                left: 0,
                right: 0,
                child: SizedBox(
                  // width: 1,
                  child: ProjectFormInput(
                    initialValue: model._pin,
                    withNoBorder: true,
                    validator: (_) => Validators.validateOtp(model.pin),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp("r'^([0-9]){1}"))
                    ],
                    onSaved: (_) => callback(model.pin),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
