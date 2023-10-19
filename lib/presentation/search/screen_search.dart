import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynetflix/Domain/core/debounce/debounce.dart';
import 'package:mynetflix/application/Search/search_bloc.dart';
import 'package:mynetflix/core/colors.dart';
import 'package:mynetflix/core/constants.dart';
import 'package:mynetflix/presentation/search/widget/search-idle.dart';
import 'package:mynetflix/presentation/search/widget/search_result.dart';

class ScreenSearch extends StatelessWidget {
  ScreenSearch({Key? key}) : super(key: key);

  final _debouncer = Debouncer(milliseconds: 1000);
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<SearchBloc>(context).add(SearchInitialEvent());
    });
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CupertinoSearchTextField(
              controller: searchController,
              backgroundColor: Colors.grey[800],
              prefixIcon: const Padding(
                padding: EdgeInsets.only(top: 4, left: 3, right: 3),
                child: Icon(
                  CupertinoIcons.search,
                  color: Colors.grey,
                ),
              ),
              suffixIcon: const Icon(CupertinoIcons.xmark_circle_fill,
                  color: Colors.grey),
              style: const TextStyle(color: whiteclr),
              onChanged: (value) {
                _debouncer.run(() {
                  BlocProvider.of<SearchBloc>(context)
                      .add(SearchMovieEvent(movieName: value));
                });
              },
            ),
            SbHeight10,
            Expanded(child: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state is SearchSuccessState) {
                  return const SearchResults();
                }
             else {
                  return const SearchIdleWidget();
                }
                
              },
            )),
          ],
        ),
      )),
    );
  }
}
