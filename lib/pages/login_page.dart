import 'package:flutter/material.dart';
import 'package:to_do/constants/colors.dart';
import 'package:to_do/constants/dimens.dart';
import 'package:to_do/constants/strings.dart';
import 'package:to_do/view_items/login_button_view.dart';
import 'package:to_do/widgets/easy_text_widget.dart';
import 'package:to_do/widgets/text_form_field_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      body: Form(
        key: _key,
        child: Center(
          child: Card(
            margin: const EdgeInsets.all(30),
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// welcome
                const Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Center(
                    child: EasyTextWidget(
                        text: kWelcomeText,
                        fontSize: kWelcomeFontSize,
                        fontWeight: kWelcomeFontWeight,
                        color: kBlack87Color),
                  ),
                ),

                /// Username
                const Padding(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: TextFormFieldWidget(
                    maxLines: 1,
                    icon: kAccountCircleIcon,
                    hintText: 'Enter Username or Gmail',
                    requiredDigit: 1,
                    invalidText: 'Username or gmail is empty',
                  ),
                ),

                /// Password
                const Padding(
                    padding: EdgeInsets.only(
                      left: 15,
                      right: 15,
                      top: 20,
                    ),
                    child: TextFormFieldWidget(
                      maxLines: 1,
                      icon: kLockIcon,
                      hintText: 'Enter Password',
                      requiredDigit: 4,
                      invalidText: 'Password must be at least six character',
                    )),

                /// Login key
                LoginButtonView(
                  globalKey: _key,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
