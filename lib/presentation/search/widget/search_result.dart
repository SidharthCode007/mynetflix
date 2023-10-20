import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynetflix/Domain/search/model/search/search.dart';
import 'package:mynetflix/application/Search/search_bloc.dart';
import 'package:mynetflix/core/constants.dart';
import 'package:mynetflix/presentation/Widgets/main_card.dart';
import 'package:mynetflix/presentation/Widgets/main_title.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 4),
            child: mainTitle(title: 'Movies & TV'),
          ),
          SbHeight20,
          Expanded(child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state is SearchSuccessState) {
                  if (state.isLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return _buildSearchResultsList(state.searchResults);
                }
              /* if (state is SearchSuccessState) {
                if (state.isLoading == true) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state.searchResults.isNotEmpty) {
                  return GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 1 / 1.5,
                    children: List.generate(20, (index) {
                      final movie = state.searchResults[index];
                      return MainCard(
                        imgUrl: movie.posterPath ?? '',
                      );
                    }),
                  );
                }
              } */
              return SizedBox();
            },
          ))
        ],
      ),
    );
  }
    Widget _buildSearchResultsList(List<Search> searchResults) {
    if (searchResults.isEmpty) {
      return Center(child: Text('No search results available.'));
    }
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      childAspectRatio: 1 / 1.5,
      children: searchResults.map((movie) {
        return MainCard(
          imgUrl: movie.posterPath ?? '',
        );
      }).toList(),
    );
  }
}

