import 'package:flutter/material.dart';
import 'package:mynetflix/core/colors.dart';
import 'package:mynetflix/core/constants.dart';
import 'package:mynetflix/presentation/Widgets/video_widget.dart';
import 'package:mynetflix/presentation/home/screen_home.dart';

class EveryonesWatchingContent extends StatelessWidget {
  final String posterPath;
  final String movieName;
  final String description;
  const EveryonesWatchingContent({
    Key? key,
    required this.posterPath,
    required this.movieName,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SbHeight10,
        Text(movieName,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
        SbHeight10,
        Text(
          description,
          style: const TextStyle(color: greyclr),
        ),
        SbHeight50,
        VideoWidget(
          url: posterPath,
        ),
        SbHeight10,
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButtonHome(
              icon: Icons.share,
              icontxt: 'Share',
              iconSize: 35,
              textSize: 12,
            ),
            SbWidth20,
            CustomButtonHome(
              icon: Icons.add,
              icontxt: 'My List',
              iconSize: 35,
              textSize: 12,
            ),
            SbWidth20,
            CustomButtonHome(
              icon: Icons.play_arrow_rounded,
              icontxt: 'Play',
              iconSize: 35,
              textSize: 12,
            ),
            SbWidth10
          ],
        )
      ],
    );
  }
}
