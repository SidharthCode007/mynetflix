// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mynetflix/presentation/downloads/screen_downloads.dart';
import 'package:mynetflix/presentation/fast_laugh/screen_fast_laugh.dart';
import 'package:mynetflix/presentation/home/screen_home.dart';
import 'package:mynetflix/presentation/main_page/widget/bottom_nav.dart';
import 'package:mynetflix/presentation/new_and_hot/screen_new_and_hot.dart';
import 'package:mynetflix/presentation/search/screen_search.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({Key? key}) : super(key: key);

  final _pages = [
    ScreenHome(),
    ScreenNewAndHot(),
    ScreenFastLaugh(),
    ScreenSearch(),
    ScreenDownloads()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexchange,
          builder: (BuildContext context, int index, Widget? child) {
            return _pages[index];
          },
        ),
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}
