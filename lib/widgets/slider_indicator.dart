import 'package:flutter/material.dart';

class SliderIndicator extends StatelessWidget {
  final int count;
  final int index;

  const SliderIndicator({Key key, this.count, this.index = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: dots,
    );
  }

  List<Widget> get dots {
    return List.generate(count, (i) {
      final double size = i == index ? 12.0 : 10.0;
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 4.0),
        width: size,
        height: size,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2.0),
          shape: BoxShape.circle,
          color: i == index ? Colors.white : null,
        ),
      );
    });
  }
}
