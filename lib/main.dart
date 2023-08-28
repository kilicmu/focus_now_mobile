import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:focus_now_mobile/page/home/index.dart';

import 'generated/l10n.dart';

void main() {
  runApp(const FlowNowApp());
}

class FlowNowApp extends StatelessWidget {
  const FlowNowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            brightness: Brightness.dark,
            seedColor: const Color.fromRGBO(0xfb, 0x5d, 0x5d, 1),
            primary: const Color.fromRGBO(0xfb, 0x5d, 0x5d, 1),
            secondary: const Color.fromRGBO(0x6d, 0x8e, 0xa0, 0.2),
            secondaryContainer: const Color.fromRGBO(0xcf, 0xfd, 0xf8, 0.9)),
        scaffoldBackgroundColor: const Color.fromRGBO(0x38, 0x38, 0x38, 1),
        buttonTheme: const ButtonThemeData(
            buttonColor: Color.fromRGBO(0xfb, 0x5d, 0x5d, 1)),
        drawerTheme: const DrawerThemeData(
            backgroundColor: Color.fromRGBO(0x38, 0x38, 0x38, 1),
            surfaceTintColor: Colors.transparent),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      // 讲zh设置为第一项,没有适配语言时，英语为首选项
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale.fromSubtags(languageCode: "en"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int activePageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0,
        leading: Container(),
        scrolledUnderElevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Row(
          children: [
            Text(
              S.of(context).app_name,
            ),
            Spacer(),
            Builder(builder: (context) {
              return GestureDetector(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: CircleAvatar(),
              );
            })
          ],
        ),
      ),
      drawer: Drawer(child: Text("hello")),
      drawerEnableOpenDragGesture: false,
      body: HomePage(activeIndex: activePageIndex),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.white38,
              blurRadius: 1.2,
              spreadRadius: 0.5,
              blurStyle: BlurStyle.outer)
        ]),
        child: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.home_outlined),
                label: S.of(context).app_bottom_bar_icon_home_name,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.account_balance_wallet_outlined),
                label: S.of(context).app_bottom_bar_icon_note_name,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.account_tree_outlined),
                label: S.of(context).app_bottom_bar_icon_statistics_name,
              ),
            ],
            type: BottomNavigationBarType.fixed,
            currentIndex: activePageIndex,
            onTap: (idx) {
              setState(() {
                activePageIndex = idx;
              });
            },
            enableFeedback: false,
            useLegacyColorScheme: false,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            selectedItemColor: Theme.of(context).colorScheme.primary),
      ),
    );
  }
}
