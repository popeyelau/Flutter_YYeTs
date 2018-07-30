import 'package:flutter/material.dart';
import 'package:yyets/widgets/rate_stars.dart';
import 'package:yyets/widgets/rr_rate.dart';

class RateView extends StatelessWidget {
  final String score;

  const RateView({Key key, this.score}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.white.withAlpha(100),
      ),
      child: Row(
        children: <Widget>[RRRate(score: score,), RateStars(rate: double.parse(score),)],
      ),
    );
  }
}
