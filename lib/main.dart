import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynetflix/application/Downloads/downloads_bloc.dart';
import 'package:mynetflix/application/FastLaugh/fast_laugh_bloc.dart';
import 'package:mynetflix/application/Home/home_bloc.dart';
import 'package:mynetflix/application/NewandHot/new_and_hot_bloc.dart';
import 'package:mynetflix/application/Search/search_bloc.dart';
import 'package:mynetflix/core/colors.dart';
import 'package:mynetflix/infrastructure/Home/homeRepo.dart';
import 'package:mynetflix/infrastructure/downloads/downloads_repository.dart';
import 'package:mynetflix/infrastructure/new_and_hot/new_and_hot_repo.dart';
import 'package:mynetflix/infrastructure/search/search_repo.dart';
import 'package:mynetflix/presentation/main_page/screen_main_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final iDownloadsRepo = DownloadsRepository();
  final searchService = SearchRepo();
  final newhotrepo = NewAndHotImpl();
  final homerepo = HomeRepo();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (ctx) => SearchBloc(iDownloadsRepo, searchService)),
        BlocProvider(create: (ctx) => HomeBloc(homerepo)),
        BlocProvider(create: (ctx) => FastLaughBloc(iDownloadsRepo)),
        BlocProvider(create: (ctx) => DownloadsBloc(iDownloadsRepo)),
        BlocProvider(create: (ctx) => NewAndHotBloc(newhotrepo)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: bgcolor,
          fontFamily: GoogleFonts.montserrat().fontFamily,
          textTheme: const TextTheme(
              displayLarge: TextStyle(color: Colors.white),
              bodyMedium: TextStyle(color: Colors.white)),
        ),
        home: ScreenMainPage(),
      ),
    );
  }
}
