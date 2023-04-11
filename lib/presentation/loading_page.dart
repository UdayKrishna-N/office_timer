import 'package:flutter/material.dart';
import 'package:office_timer/constants.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage>
    with SingleTickerProviderStateMixin {
  final int count = 7;
  final double minHeight = 10;
  final double maxHeight = 30;
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1050))
      ..repeat();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              double t = controller.value;
              int current = (count * t).floor();
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    count,
                        (index) => AnimatedContainer(
                      margin: index == (count - 1)
                          ? EdgeInsets.zero
                          : const EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                        color: Constants.primaryColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      duration: const Duration(milliseconds: 150),
                      width: 5,
                      height: index == current ? maxHeight : minHeight,
                    )),
              );
            }),
      ),
    );
  }
}
