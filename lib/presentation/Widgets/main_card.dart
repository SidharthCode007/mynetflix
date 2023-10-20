import 'package:flutter/material.dart';
import 'package:mynetflix/core/constants.dart';
import 'package:mynetflix/core/url.dart';

class MainCard extends StatelessWidget {
  final String? imgUrl;
  const MainCard({Key? key, required this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      width: 120,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: borderRad10,
        image: DecorationImage(
          image: NetworkImage('$imgBaseUrl${imgUrl.toString()}'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
