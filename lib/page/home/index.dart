import 'package:flutter/widgets.dart';
import 'package:focus_now_mobile/page/home/home/home.dart';
import 'package:focus_now_mobile/page/home/note/note.dart';
import 'package:focus_now_mobile/page/home/statistics/statisics.dart';

enum HomePageIndex {
  home,
  note,
  statistics,
}
class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.activeIndex});

  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    switch(activeIndex)  {
      case 0:
        return const HomeWidget();
      case 1:
        return const NoteWidget();
      case 2:
        return const StatisticsWidget();
      default:
        throw ErrorDescription("unknown home page index $activeIndex");
    }
  }
}