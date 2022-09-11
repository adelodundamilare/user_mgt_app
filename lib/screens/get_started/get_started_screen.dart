import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ryalize/screens/get_started/get_started_vm.dart';
import 'package:ryalize/utils/base_widget.dart';
import 'package:ryalize/utils/constants.dart';
import 'package:ryalize/widgets/project_text.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<GetStartedVM>(

        /// redirect user from splash screen
        /// to either login or home screen
        onInitState: (model) => model.redirectUser(),
        model: GetStartedVM(),
        builder: (context, model, child) {
          return Scaffold(
              body: Container(
            width: kWidthFull(context),
            decoration: const BoxDecoration(
              color: kColorAccent,
              gradient: kPrimaryGradient,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  kImagesLogo,
                  width: 100,
                ),
                const ProjectTextTitle(
                  'Ryalize',
                  textColor: kColorWhite,
                ).paddingTop(kSpacingSmall)
              ],
            ),
          ));
        });
  }
}
