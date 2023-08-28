import 'package:flutter/material.dart';
import 'package:focus_now_mobile/widgets/progress.dart';

import 'SummaryTodayMessageWidget.dart';

const double ONE_STACK_WIDTH = 14.0;
const double CHART_SCOPE_SIZE = 140.0;

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
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            ProgressWidget(
                              size: const Size(
                                  CHART_SCOPE_SIZE, CHART_SCOPE_SIZE),
                              beginColor: Colors.redAccent,
                              endColor: Colors.redAccent.withAlpha(156),
                              percent: 1,
                            ),
                            ProgressWidget(
                              size: const Size(
                                  CHART_SCOPE_SIZE - ONE_STACK_WIDTH * 2,
                                  CHART_SCOPE_SIZE - ONE_STACK_WIDTH * 2),
                              beginColor: Colors.blue,
                              endColor: Colors.blue.withAlpha(156),
                              percent: 0.5,
                            ),
                            ProgressWidget(
                              size: const Size(
                                  CHART_SCOPE_SIZE - ONE_STACK_WIDTH * 4,
                                  CHART_SCOPE_SIZE - ONE_STACK_WIDTH * 4),
                              beginColor: Colors.greenAccent,
                              endColor: Colors.greenAccent.withAlpha(156),
                              percent: 1.7,
                            )
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
