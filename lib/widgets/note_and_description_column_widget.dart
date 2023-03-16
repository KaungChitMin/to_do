import 'package:flutter/material.dart';
import 'package:to_do/constants/dimens.dart';
import 'package:to_do/widgets/easy_text_widget.dart';

class NoteAndDescriptionWidget extends StatelessWidget {
  const NoteAndDescriptionWidget(
      {Key? key,
      required this.titleText,
      required this.maxLines,
      required this.hintText,
      required this.invalidText})
      : super(key: key);

  final String titleText;
  final int maxLines;
  final String hintText;
  final String invalidText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Note
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 20),
          child: EasyTextWidget(
            text: titleText,
            fontSize: kNoteAndDescriptionFontSize,
            fontWeight: kNoteAndDescriptionFontWeight,
          ),
        ),

        /// Text Field
        Padding(
          padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
          child: TextFormField(
            maxLines: maxLines,
            decoration: InputDecoration(
                hintText: hintText,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15))),
            validator: (text) {
              if (text?.isEmpty ?? false) {
                return invalidText;
              }
              return null;
            },
          ),
        )
      ],
    );
  }
}
