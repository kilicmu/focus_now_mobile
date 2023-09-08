import 'package:flutter/material.dart';
import 'package:focus_now_mobile/generated/l10n.dart';

TextStyle createSummaryTextStyleByColor(Color color) {
  return TextStyle(color: color, fontWeight: FontWeight.w700, fontSize: 14);
}

TextStyle createSummaryLabelStyleByColor(Color color) {
  return TextStyle(color: color, fontWeight: FontWeight.w700, fontSize: 18);
}

class ArticlePercentText extends StatelessWidget {
  const ArticlePercentText(
      {super.key,
      required this.text,
      required this.label,
      required this.color});

  final String text;
  final String label;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$label:",
          style: createSummaryTextStyleByColor(color),
        ),
        Container(width: 2),
        Text(
          text,
          style: createSummaryLabelStyleByColor(color),
        ),
      ],
    );
  }
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
          ArticlePercentText(
              text: '8/18',
              label: S.of(context).home_summary_completed_projects_count,
              color: Colors.redAccent),
          ArticlePercentText(
              text: '1:22/1:00',
              label: S.of(context).home_summary_focus_time,
              color: Colors.blue),
          ArticlePercentText(
              text: '8/10',
              label: S.of(context).home_summary_finished_concentration_cycles,
              color: Colors.greenAccent),
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
                      "${S.of(context).home_summary_daily_year_on_year} ",
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
