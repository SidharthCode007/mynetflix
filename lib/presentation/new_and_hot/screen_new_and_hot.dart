import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mynetflix/application/NewandHot/new_and_hot_bloc.dart';
import 'package:mynetflix/core/DateConverter.dart';
import 'package:mynetflix/core/colors.dart';
import 'package:mynetflix/core/constants.dart';
import 'package:mynetflix/core/url.dart';
import 'package:mynetflix/presentation/new_and_hot/widgets/coming_soon_content.dart';
import 'package:mynetflix/presentation/new_and_hot/widgets/ryones_watching_content.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('New & Hot',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              )),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.cast,
                  color: Colors.white,
                  size: 30,
                )),
            SbWidth10,
            Container(
              color: Colors.grey.withOpacity(0.5),
              height: 30,
              width: 30,
            ),
            SbWidth10
          ],
          bottom: TabBar(
              isScrollable: true,
              labelColor: bgcolor,
              labelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              unselectedLabelColor: whiteclr,
              indicator: BoxDecoration(
                color: whiteclr,
                borderRadius: borderRad30,
              ),
              tabs: const [
                Tab(
                  text: '🍿 Coming Soon',
                ),
                Tab(text: "👀 Everyone's Watching ")
              ]),
        ),
        body: const TabBarView(children: [
          ComingSoonPage(
            key: Key('coming_soon'),
          ),
          EveryoneWatchingPage(
            key: Key('everyone_watching'),
          ),
        ]),
      ),
    );
  }
}

class ComingSoonPage extends StatelessWidget {
  const ComingSoonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<NewAndHotBloc>(context).add(Upcominginitialevent());
    });
    return RefreshIndicator(
      color: Colors.black,
      onRefresh: () async {
        BlocProvider.of<NewAndHotBloc>(context).add(Upcominginitialevent());
      },
      child:
          BlocBuilder<NewAndHotBloc, NewAndHotState>(builder: (context, state) {
        if (state is UpcomingSuccessstate) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } 
          else if (state.upcomingMovies.isEmpty) {
            return const Center(child: Text('Coming soon List is empty'));
          } else if (state.upcomingMovies.isNotEmpty) {
            return ListView.builder(
              itemCount: state.upcomingMovies.length,
              itemBuilder: (BuildContext context, int index) {
                final movie = state.upcomingMovies[index];
                String date = movie.releaseDate.toString();
                final dateConvertor = DateConverter(dateString: date);
                if (movie.id == null) {
                  return const SizedBox();
                }

                return Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ComingSoonContent(
                    id: movie.id.toString(),
                    month: dateConvertor.monthInstring(),
                    day: dateConvertor.convertToString(),
                    posterPath: '$imgBaseUrl${movie.posterPath}',
                    movieName: movie.originalTitle ?? 'No Title',
                    description: movie.overview ?? 'No Description',
                  ),
                );
              },
            );
          }
        }
        return Container(color: Colors.amber,);
      }),
    );
  }
}

class EveryoneWatchingPage extends StatelessWidget {
  const EveryoneWatchingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<NewAndHotBloc>(context)
          .add(Everyonwwatchinginitialevent());
    });
    return RefreshIndicator(
      color: Colors.black,
      onRefresh: () async {
        BlocProvider.of<NewAndHotBloc>(context)
            .add(Everyonwwatchinginitialevent());
      },
      child:
          BlocBuilder<NewAndHotBloc, NewAndHotState>(builder: (context, state) {
        if (state is EveryoneWatchingSuccessstate) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else if (state.popularMovies.isEmpty) {
            return const Center(child: Text('List is empty'));
          } else if (state.popularMovies.isNotEmpty) {
            return ListView.builder(
              itemCount: state.popularMovies.length,
              itemBuilder: (BuildContext context, int index) {
                final movie = state.popularMovies[index];
                if (movie.id == null) {
                  return const SizedBox();
                }

                return Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: EveryonesWatchingContent(
                    posterPath: '$imgBaseUrl${movie.posterPath}',
                    movieName: movie.originalTitle ?? 'Title not available',
                    description: movie.overview ?? 'Description not available',
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text("Somethiong Went wrong"),
            );
          }
        }
        return SizedBox();
      }),
    );
  }
}
