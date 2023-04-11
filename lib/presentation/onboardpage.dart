import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:office_timer/constants.dart';
import 'package:office_timer/presentation/homepage.dart';
import 'package:office_timer/widgets/custom_button.dart';
import 'package:office_timer/widgets/custom_field.dart';

import '../provider/data_provider.dart';

final dataProvider = ChangeNotifierProvider<DataProvider>((ref) {
  return DataProvider();
});

class OnboardPage extends ConsumerStatefulWidget {
  OnboardPage({Key? key}) : super(key: key);

  @override
  ConsumerState<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends ConsumerState<OnboardPage> {
  final TextEditingController _hoursController = TextEditingController();
  final TextEditingController _minutesController = TextEditingController();

  @override
  void dispose() {
    _hoursController.dispose();
    _minutesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 100,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Enter the Total Working Hours:',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Constants.primaryColor,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
            ),
            SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomField(
                    first: true, last: false, controller: _hoursController),
                SizedBox(
                  width: 5,
                ),
                Text(
                  ':',
                  style: TextStyle(
                    color: Constants.primaryColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                CustomField(
                    first: false, last: true, controller: _minutesController),
              ],
            ),
            Spacer(),
            CustomButton(
              onTap: () {
                ref.read(dataProvider).updateWorkTime(
                      hours: int.parse(_hoursController.text),
                      minutes: int.parse(_minutesController.text),
                    );
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(
                      startTime: ref
                          .read(dataProvider)
                          .startTime
                          .millisecondsSinceEpoch,
                    ),
                  ),
                );
              },
              text: "Let's Work",
            ),
          ],
        ),
      ),
    );
  }
}
