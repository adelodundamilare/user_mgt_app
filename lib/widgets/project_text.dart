import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ryalize/utils/constants.dart';
import 'package:ryalize/extensions/ryalize_color_scheme.dart';

class ProjectText extends StatelessWidget {
  final String text;
  final double? textSize;
  final bool centerText;
  final TextAlign? textAlign;
  final Color? textColor;
  final TextOverflow? overflow;
  final double? height;
  final bool isActive;
  final int? maxLines;
  final bool? isBoldFont;
  final bool? uppercase;
  final bool withCurrency;
  final bool isLineThrough, isItalic;
  final double? letterSpacing;

  const ProjectText(this.text,
      {Key? key,
      this.textSize,
      this.textColor,
      this.maxLines,
      this.overflow,
      this.centerText = false,
      this.textAlign = TextAlign.left,
      this.isLineThrough = false,
      this.letterSpacing,
      this.withCurrency = false,
      this.isActive = true,
      this.isItalic = false,
      this.uppercase = false,
      this.height,
      this.isBoldFont = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _text = Text(
      // this not clean_code but we'll name it like that
      text is String
          ? uppercase!
              ? text.toUpperCase()
              : text
          : 'no_text',
      // uppercase ? text.toUpperCase() : text,
      textAlign: centerText ? TextAlign.center : textAlign,
      overflow: overflow ?? TextOverflow.visible,
      maxLines: maxLines ?? 100,
      style: Theme.of(context).textTheme.bodyText1!.copyWith(
            letterSpacing: letterSpacing ?? 0,
            color: textColor ?? Theme.of(context).colorScheme.textColor,
            fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
            decoration: isLineThrough
                ? TextDecoration.lineThrough
                : TextDecoration.none,
            fontFamily: isBoldFont! ? kFontFamilyBold : kFontFamilyRegular,
            fontSize: textSize ?? kFontSizeNormal,
            height: height ?? 1.2,
          ),
    );
    return withCurrency
        ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '₦', //@todo: remove N hack
                style: TextStyle(
                  letterSpacing: letterSpacing ?? 0,
                  color: textColor ?? kColorPrimaryText,
                  fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
                  decoration: isLineThrough
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  fontSize: textSize ?? kFontSizeNormal,
                  height: height ?? 1.2,
                ),
              ).visible(withCurrency),
              _text,
            ],
          )
        : _text;
  }
}

class ProjectTextTitle extends StatelessWidget {
  final String text;
  final Color? textColor;
  final int? maxLines;
  final bool centerText;
  final bool withCurrency;
  final TextOverflow? overflow;
  final bool isLightFont, isUpperCase;
  final double? textSize, letterSpacing;
  const ProjectTextTitle(
    this.text, {
    Key? key,
    this.textColor,
    this.textSize,
    this.maxLines,
    this.centerText = false,
    this.overflow,
    this.withCurrency = false,
    this.isLightFont = false,
    this.isUpperCase = false,
    this.letterSpacing,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ProjectText(
      text,
      uppercase: isUpperCase,
      maxLines: maxLines,
      overflow: overflow,
      centerText: centerText,
      withCurrency: withCurrency,
      isBoldFont: isLightFont ? false : true,
      textSize: textSize ?? kFontSizeBig,
      letterSpacing: letterSpacing ?? 0,
      textColor: textColor ?? Theme.of(context).textTheme.headline1?.color,
    );
  }
}
