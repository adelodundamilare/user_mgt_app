import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ryalize/utils/base_widget.dart';
import 'package:ryalize/utils/constants.dart';
import 'package:ryalize/utils/project_logger.dart';
import 'package:ryalize/widgets/project_text.dart';

class UiUtils {
  static showSnackbar(String message) => GetSnackBar(
        message: message,
        margin: const EdgeInsets.all(8),
        //dismissDirection: SnackDismissDirection.HORIZONTAL,
        borderRadius: 8,
        isDismissible: true,
        animationDuration: const Duration(milliseconds: 500),
        duration: const Duration(seconds: 2),
      )..show();

  static showErrorNotification(
          {String title = 'no_title', String message = 'no_message'}) =>
      Get.snackbar(title, message,
          backgroundColor: kColorRed,
          borderRadius: kSpacingSmall,
          colorText: kColorWhite);

  static showDialog(
      {required Widget widget, Color? bgColor, required String title}) {
    return Get.dialog(AlertDialog(
      contentPadding: EdgeInsets.zero,
      backgroundColor: bgColor,
      scrollable: true,
      content: Builder(builder: (context) {
        return SizedBox(
            width: kWidthFull(context),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    ProjectTextTitle(
                      title,
                      centerText: true,
                      textSize: kFontSizeBig,
                    ).expand(),
                    Icon(
                      EvaIcons.close,
                      color: kColorBlack.withOpacity(0.3),
                    ).onTap(() => UiUtils.goBack())
                  ],
                ),
                widget.paddingTop(kSpacingMedium),
              ],
            ));
      }).paddingAll(kSpacingMedium),
    ));
  }

  static showSimpleDialog(
          {required String title, message, required Function()? onOkPressed}) =>
      Get.dialog(AlertDialog(
        titlePadding:
            const EdgeInsets.only(top: kSpacingMedium, left: kSpacingMedium),
        contentPadding: kPaddingAllMedium,
        backgroundColor: kColorWhite,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        title: ProjectTextTitle(
          title,
          textSize: kFontSizeMedium,
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ProjectText(
              message,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const ProjectText(
                  "Ok",
                  textColor: kColorPrimary,
                ).onTap(onOkPressed)
              ],
            ).paddingTop(kSpacingMedium)
          ],
        ),
        buttonPadding: EdgeInsets.zero,
      ));

  static showBottomSheetModal(
          {required BuildContext context, required Widget widget}) =>
      showModalBottomSheet(
          context: context,
          backgroundColor: kColorWhite,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.vertical(top: Radius.circular(kSpacingSmall))),
          builder: (BuildContext context) {
            return SingleChildScrollView(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  widget,
                ],
              ),
            );
          });

  static showBottomSheet({required Widget widget}) =>
      Get.bottomSheet<BaseWidget>(widget,
          backgroundColor: kColorWhite,
          shape: const RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.vertical(top: Radius.circular(kSpacingSmall))));

  static goto(String pageRoute, {dynamic arguments}) {
    getLogger("ui_utils.dart").w('goto: route:$pageRoute arguments:$arguments');
    return Get.toNamed(pageRoute, arguments: arguments);
  }

  static gotoDisableBack(String pageRoute, {dynamic arguments}) {
    getLogger("ui_utils.dart").w('goto: route:$pageRoute arguments:$arguments');
    return Get.offAllNamed(pageRoute, arguments: arguments);
  }

  static gotoDisableThisBack(String pageRoute, {dynamic arguments}) {
    getLogger("ui_utils.dart").w('goto: route:$pageRoute arguments:$arguments');
    return Get.offNamed(pageRoute, arguments: arguments);
  }

  static goToWidget(Widget widget) {
    getLogger("ui_utils.dart").w('goToWidget: widget:$widget');
    return Get.to(() => widget);
  }

  static goToWidgetDisableThisBack(Widget widget) {
    getLogger("ui_utils.dart").w('goToWidgetDisableThisBack: widget:$widget');
    return Get.offAll(() => widget);
  }

  static goBack([dynamic result]) => Get.back(result: result);

  static navigatorKey() => Get.key;

  static DecorationImage projectNetworkImageProvider(String? image) =>
      DecorationImage(
          fit: BoxFit.cover,
          image: CachedNetworkImageProvider(image ?? kImagesRemotePlaceholder));

  static Widget projectNetworkImageWithContainer(String? networkImage,
      {double? size, double? borderRadius}) {
    if (kDebugMode) {
      print('networkImage: $networkImage');
    }
    return SizedBox(
      width: size,
      height: size,
      child: CachedNetworkImage(
        imageUrl: networkImage != null && networkImage.isNotEmpty
            ? networkImage
            : kImagesRemotePlaceholder,
        imageBuilder: (context, imageProvider) => Container(
          width: size ?? MediaQuery.of(context).size.width,
          height: size ?? MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        placeholder: (context, url) =>
            const CircularProgressIndicator().center(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    ).cornerRadiusWithClipRRect(borderRadius ?? 1);
  }

  static List<Widget> projectDynamicWidget(
      {required List<dynamic> items,
      required Widget Function(int position) builder}) {
    return items
        .asMap()
        .map((int position, _) => MapEntry(position, builder(position)))
        .values
        .toList();
  }

  static List<BottomNavigationBarItem> projectCustomDynamicWidget(
      {required List<dynamic> items,
      required BottomNavigationBarItem Function(int position) builder}) {
    return items
        .asMap()
        .map((int position, _) => MapEntry(position, builder(position)))
        .values
        .toList();
  }
}
