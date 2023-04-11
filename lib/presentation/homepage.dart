import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:office_timer/constants.dart';
import 'package:office_timer/presentation/onboardpage.dart';
import 'package:office_timer/provider/timer_provider.dart';
import 'package:office_timer/widgets/custom_button.dart';

final timeProvider = ChangeNotifierProvider<TimeProvider>((ref) {
  var data = ref.read(dataProvider);
  return TimeProvider(data.workTimeInMinutes);
});

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    ref.read(timeProvider).startClock();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Text(
                    "Completed Hours",
                    style: TextStyle(
                      color: Constants.primaryColor,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Consumer(builder: (context, ref, child) {
                        var hours = ref.watch(timeProvider).hours;
                        return Text(
                          hours < 10 ? "0$hours" : hours.toString(),
                          style: TextStyle(
                            color: Constants.primaryColor,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      }),
                      SizedBox(
                        width: 5,
                      ),
                      //hrs text
                      Text(
                        "hrs",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Constants.primaryColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      // :
                      Text(
                        ":",
                        style: TextStyle(
                          color: Constants.primaryColor,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Consumer(builder: (context, ref, child) {
                        var minutes = ref.watch(timeProvider).minutes;
                        return Text(
                          minutes < 10 ? "0$minutes" : minutes.toString(),
                          style: TextStyle(
                            color: Constants.primaryColor,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      }),
                      // mins text
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "mins",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Constants.primaryColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: CustomButton(
                    onTap: () {
                      ref.read(timeProvider).stopClock();
                    },
                    text: "Let's move out!",
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
