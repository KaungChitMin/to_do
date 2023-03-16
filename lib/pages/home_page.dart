import 'package:flutter/material.dart';
import 'package:to_do/constants/colors.dart';
import 'package:to_do/constants/dimens.dart';
import 'package:to_do/constants/strings.dart';
import 'package:to_do/widgets/easy_text_widget.dart';
import 'to_do_arrange_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// App Bar
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(kToDoText),
        centerTitle: false,
      ),

      /// Text and Icon
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Center(
              child: EasyTextWidget(
                text: kHomePageText,
                fontSize: kHomePageFontSize,
                fontWeight: kHomePageFontWeight,
              ),
            ),

            const SizedBox(
              height: kSP30x,
            ),

            Center(
              child: ElevatedButton.icon(
                style:
                    ElevatedButton.styleFrom(backgroundColor: kMainColor),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const ToDoArrangePage();
                  }));
                },
                label: const Text(kAddWorkText),
                icon: kAddCircleIcon,
              ),
            )

          ],
        ),
      ),
    );
  }
}
