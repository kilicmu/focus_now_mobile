import 'package:flutter/material.dart';

TextStyle createSummaryTextStyleByColor(Color color) {
  return TextStyle(color: color, fontWeight: FontWeight.w800, fontSize: 16);
}

class SummaryOfChartMessage extends StatefulWidget {
  const SummaryOfChartMessage({super.key});

  @override
  State<SummaryOfChartMessage> createState() => _SummaryOfChartMessageState();
}

class _SummaryOfChartMessageState extends State<SummaryOfChartMessage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      child: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "8/16 任务完成",
            style: createSummaryTextStyleByColor(Colors.redAccent),
          ),
          Text(
            "1:22/1:00 专注时间",
            style: createSummaryTextStyleByColor(Colors.blue),
          ),
          Text(
            "8/10 专注周期",
            style: createSummaryTextStyleByColor(Colors.greenAccent),
          ),
        ],
      ),
    );
  }
}

class SummaryTodayMessageWidget extends StatefulWidget {
  const SummaryTodayMessageWidget({super.key});

  @override
  State<SummaryTodayMessageWidget> createState() =>
      _SummaryTodayMessageWidgetState();
}

class ColorBlock extends StatelessWidget {
  const ColorBlock({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: color), width: 12, height: 16);
  }
}

class _SummaryTodayMessageWidgetState extends State<SummaryTodayMessageWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Container(child: SummaryOfChartMessage()), flex: 3),
        Expanded(
            child: Align(
                alignment: Alignment.centerRight,
                child: Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "日同比: ",
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      "+18%",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.green,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                )),
            flex: 1)
      ],
    );
  }
}
