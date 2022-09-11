import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ryalize/utils/constants.dart';
import 'package:ryalize/widgets/project_text.dart';

class LayoutWithBack extends StatelessWidget {
  final Widget body;
  final String title;
  final double? elevation;
  final Color? bgColor;
  final bool isLoading, isFullHeight;
  const LayoutWithBack(
      {Key? key,
      required this.body,
      required this.title,
      this.elevation,
      this.bgColor,
      this.isFullHeight = false,
      this.isLoading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: bgColor,
        appBar: AppBar(
          backgroundColor: kColorWhite,
          elevation: elevation ?? 0,
          centerTitle: true,
          iconTheme: const IconThemeData(color: kColorBlack),
          title: ProjectTextTitle(
            title,
            textSize: kFontSizeMedium,
          ),
        ),
        body: Stack(
          children: [
            isFullHeight
                ? body
                : SingleChildScrollView(
                    child: body,
                  ),
            Container(
              color: kColorWhite.withOpacity(0.8),
              width: kWidthFull(context),
              height: kHeightFull(context),
              child: const CircularProgressIndicator().center(),
            ).visible(isLoading),
          ],
        ),
      ),
    );
  }
}
