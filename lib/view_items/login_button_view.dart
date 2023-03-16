import 'package:flutter/material.dart';
import 'package:to_do/constants/colors.dart';
import 'package:to_do/constants/dimens.dart';
import 'package:to_do/constants/strings.dart';
import 'package:to_do/pages/home_page.dart';
import 'package:to_do/widgets/easy_text_widget.dart';

class LoginButtonView extends StatefulWidget {
  const LoginButtonView({
    Key? key,
    required this.globalKey,
  }) : super(key: key);

  final GlobalKey<FormState> globalKey;

  @override
  State<LoginButtonView> createState() => _LoginButtonViewState();
}

class _LoginButtonViewState extends State<LoginButtonView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Center(
        /// login button
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: kMainColor,
            ),
            onPressed: () {
              if (widget.globalKey.currentState?.validate() ?? false) {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const HomePage();
                }));
              }
            },

            /// login Text
            child: const EasyTextWidget(
              text: kLoginText,
              fontSize: kLoginFontSize,
              fontWeight: kLoginFontWeight,
              color: kWhiteColor,
            )),
      ),
    );
  }
}
