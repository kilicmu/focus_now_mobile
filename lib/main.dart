import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:focus_now_mobile/page/home/index.dart';

import 'generated/l10n.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(0x21, 0x65, 0x83, 1)),
        backgroundColor: const Color.fromRGBO(0x38, 0x38, 0x38, 1),
        buttonTheme: const ButtonThemeData(buttonColor: Color.fromRGBO(0xfb, 0x5d, 0x5d, 1)),
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
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _tabIdx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Theme.of(context).backgroundColor,
        foregroundColor: Colors.transparent,
        title: Row(children: [
          Spacer(),
          Builder(builder: (context) {
            return GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: CircleAvatar(),
            );
          })
        ],),
      ),
      drawer: Drawer(child: Text("hello")),
      drawerEnableOpenDragGesture: false,
      body: HomePage(activeIndex: _tabIdx),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: const Icon(Icons.home_outlined), label: S.of(context).app_bottom_bar_icon_home_name,),
        BottomNavigationBarItem(icon: const Icon(Icons.account_balance_wallet_outlined), label: S.of(context).app_bottom_bar_icon_note_name,),
        BottomNavigationBarItem(icon: const Icon(Icons.account_tree_outlined), label: S.of(context).app_bottom_bar_icon_statistics_name,),
      ], currentIndex: _tabIdx, onTap: (idx) {
        setState(() {
          _tabIdx = idx;
        });
        }, backgroundColor: Theme.of(context).backgroundColor, unselectedItemColor: Theme.of(context).dividerColor, selectedItemColor: Theme.of(context).primaryColorLight),
    );
  }
}
