import 'package:flutter/material.dart';
import 'package:focus_now_mobile/generated/l10n.dart';
import 'package:focus_now_mobile/widgets/gap.dart';
import 'package:focus_now_mobile/widgets/progress.dart';

import 'SummaryTodayMessageWidget.dart';

const double ONE_STACK_WIDTH = 14.0;
const double CHART_SCOPE_SIZE = 140.0;

const double SUMARRY_CARD_HEIGHT = 174.0;

class TodayProgressWidget extends StatefulWidget {
  const TodayProgressWidget({super.key});

  @override
  State<TodayProgressWidget> createState() => _TodayProgressWidgetState();
}

class _TodayProgressWidgetState extends State<TodayProgressWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: SUMARRY_CARD_HEIGHT,
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
                              endColor: Colors.redAccent.withAlpha(186),
                              percent: 1,
                            ),
                            ProgressWidget(
                              size: const Size(
                                  CHART_SCOPE_SIZE - ONE_STACK_WIDTH * 2,
                                  CHART_SCOPE_SIZE - ONE_STACK_WIDTH * 2),
                              beginColor: Colors.blue,
                              endColor: Colors.blue.withAlpha(186),
                              percent: 0.5,
                            ),
                            ProgressWidget(
                              size: const Size(
                                  CHART_SCOPE_SIZE - ONE_STACK_WIDTH * 4,
                                  CHART_SCOPE_SIZE - ONE_STACK_WIDTH * 4),
                              beginColor: Colors.greenAccent,
                              endColor: Colors.greenAccent.withAlpha(186),
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

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Column(
            children: [
          const Row(children: [Expanded(child: TodayProgressWidget())]),
          Row(
            children: [
              Expanded(
                  child: FilledButton(
                      onPressed: () {
                        print("hello");
                      },
                      child: Text(
                        S.of(context).home_my_today_button,
                        style: Theme.of(context).textTheme.titleMedium,
                      )))
            ],
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [],
            ),
          ))
        ].fold<List<Widget>>(
                [],
                (previousValue, element) => previousValue.isEmpty
                    ? [element]
                    : [
                        ...previousValue,
                        const Gap(size: Size.fromHeight(14.0)),
                        element
                      ])));
  }
}
