import 'package:flutter/material.dart';

class RateStars extends StatelessWidget {
  final double rate;

  const RateStars({Key key, this.rate}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: _buildStart(),
      ),
    );
  }

  List<Widget> _buildStart() {
    final fullstars = (rate / 2).floor();
    final left = rate % 2;

    List<Widget> starts = [];
    for (var i = 0; i < fullstars; i++) {
      starts.add(Icon(
        Icons.star,
        color: Colors.orangeAccent,
      ));
    }
    if (left > 1.0) {
      starts.add(Icon(
        Icons.star_half,
        color: Colors.orangeAccent,
      ));
    }
    final append = 5 - starts.length;
    if (append > 0) {
      for (var i = 0; i < append; i++) {
        starts.add(Icon(
          Icons.star_border,
          color: Colors.orangeAccent,
        ));
      }
    }
    return starts;
  }
}
