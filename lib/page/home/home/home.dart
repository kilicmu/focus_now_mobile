import 'package:flutter/material.dart';
import 'package:focus_now_mobile/widgets/progress.dart';

import 'SummaryTodayMessageWidget.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Theme.of(context).colorScheme.secondary,
              border: Border.all(
                  color: Theme.of(context).colorScheme.secondaryContainer),
            ),
            width: double.infinity,
            height: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              child: Row(
                children: [
                  Expanded(
                      flex: 11,
                      child: ConstrainedBox(
                        constraints: const BoxConstraints.expand(),
                        child: const Stack(
                          alignment: Alignment.center,
                          children: [
                            ProgressWidget(size: Size(140, 140)),
                            ProgressWidget(
                                size: Size(
                                    140.0 - 12.0 * 2 - 1, 140.0 - 12.0 * 2 - 1))
                          ],
                        ),
                      )),
                  const Spacer(flex: 2),
                  const Expanded(flex: 11, child: SummaryTodayMessageWidget())
                ],
              ),
            )));
  }
}
