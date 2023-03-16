import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do/constants/colors.dart';
import 'package:to_do/constants/dimens.dart';
import 'package:to_do/constants/strings.dart';
import 'package:to_do/widgets/note_and_description_column_widget.dart';

class ToDoArrangePage extends StatefulWidget {
  const ToDoArrangePage({Key? key}) : super(key: key);

  @override
  State<ToDoArrangePage> createState() => _ToDoArrangePageState();
}

class _ToDoArrangePageState extends State<ToDoArrangePage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  DateTime currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.blueGrey,
        title: const Text(kArrangeTitle),
      ),

      body: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Title
            const NoteAndDescriptionWidget(
              titleText: 'TEXT',
              maxLines: 1,
              hintText: '  Enter title',
              invalidText: 'There is no empty',
            ),

            const SizedBox(
              height: kSP20x,
            ),

            /// Description
            const NoteAndDescriptionWidget(
                titleText: 'DESCRIPTION',
                maxLines: 3,
                hintText: '  Enter description',
                invalidText: 'Your description is empty'),

            const SizedBox(
              height: kSP20x,
            ),

            /// Notes
            const NoteAndDescriptionWidget(
              titleText: 'NOTES',
              hintText: '  Enter your note',
              maxLines: 5,
              invalidText: 'Your notes is empty.Please, enter your note',
            ),

            const SizedBox(
              height: kSP20x,
            ),

            /// Date button
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 30, right: 40),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  /// month, day and year
                  ElevatedButton(

                    style: ElevatedButton.styleFrom(
                      backgroundColor: kMainColor,
                    ),

                    onPressed: () async {
                      final DateTime? date = await pickDate();
                      if (date == null) return;

                      final newDateTime = DateTime(date.year, date.month,
                          date.day, currentDate.hour, currentDate.minute);

                      setState(() => currentDate = newDateTime);
                    },
                    child: Text(DateFormat('MMMM-d-y').format(currentDate)),
                  ),

                  /// time
                  ElevatedButton(

                    style: ElevatedButton.styleFrom(
                      backgroundColor: kMainColor,
                    ),

                    onPressed: () async {
                      final TimeOfDay? time = await pickTime();
                      if (time == null) return;

                      final newDateAndTime = DateTime(
                          currentDate.year,
                          currentDate.month,
                          currentDate.day,
                          time.hour,
                          time.minute);
                      setState(() => currentDate = newDateAndTime);
                    },
                    child: Text(DateFormat('jm').format(currentDate)),
                  )
                ],
              ),
            ),

            const SizedBox(
              height: kSP30x,
            ),

            /// Save Button
            Center(
              child: ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    backgroundColor: kMainColor,
                  ),

                  onPressed: (){

                  },
                  child: Text('Save'.toUpperCase())),
            )
          ],
        ),
      ),
    );
  }



  Future<DateTime?> pickDate() => showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100),
      );

  Future<TimeOfDay?> pickTime() => showTimePicker(
      context: context,
      initialTime:
          TimeOfDay(hour: currentDate.hour, minute: currentDate.minute));
}
