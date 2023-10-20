import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynetflix/Domain/downloads/model/downloads.dart';
import 'package:mynetflix/application/Search/search_bloc.dart';
import 'package:mynetflix/core/colors.dart';
import 'package:mynetflix/core/constants.dart';
import 'package:mynetflix/core/url.dart';
import 'package:mynetflix/presentation/Widgets/main_title.dart';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) { 
      BlocProvider.of<SearchBloc>(context).add(SearchInitialEvent());
    });
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const mainTitle(
            title: 'Top Searches',
          ),
          SbHeight20,
          Expanded(
            child: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state is SearchInitialSuccessState) {
                  if (state.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return _buildTopSearchList(state.trending);
                  }
                }
                /* if (state is SearchInitialSuccessState) {
                  if (state.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state.trending.isEmpty) {
                    return const Center(child: Text('The List is Empty'));
                  }
                  return ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final movie = state.trending[index];
                        return TopSearch(
                          title: movie.originalTitle ?? 'Name is not avilable',
                          imageUrl: '$imgBaseUrl${movie.backdropPath}',
                        );
                      },
                      separatorBuilder: (context, index) => SbHeight20,
                      itemCount: state.trending.length);
                } */
                return Container(color: Colors.amber,);
              },
            ),
          )
        ],
      ),
    );
  }
    Widget _buildTopSearchList(List<Downloads> trending) {
    if (trending.isEmpty) {
      return const Center(child: Text('The List is Empty'));
    }
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final movie = trending[index];
        return TopSearch(
          title: movie.originalTitle ?? 'Name is not available',
          imageUrl: '$imgBaseUrl${movie.backdropPath}',
        );
      },
      separatorBuilder: (context, index) => SbHeight20,
      itemCount: trending.length,
    );
  }
}






class TopSearch extends StatelessWidget {
  final String title;
  final String imageUrl;
  const TopSearch({
    Key? key,
    required this.title,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
          width: size.width * 0.3,
          height: 70,
          decoration: BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(imageUrl),
          )),
        ),
        SbWidth10,
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Icon(
          CupertinoIcons.play_circle,
          size: 50,
          color: whiteclr,
        )
      ],
    );
  }
}
