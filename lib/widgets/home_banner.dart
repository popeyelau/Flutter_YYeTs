import 'dart:async';
import 'package:flutter/material.dart';
import 'package:yyets/models/ad.dart';
import 'package:yyets/pages/video.dart';
import 'package:yyets/widgets/slider_indicator.dart';

class HomeBanner extends StatefulWidget {
  final List<Ad> banners;

  const HomeBanner({Key key, this.banners}) : super(key: key);

  @override
  _HomeBannerState createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  int sliderIndex = 0;
  bool runing = false;
  PageController controller;

  @override
  void initState() {
    controller = new PageController();
    super.initState();
    run();
  }

  void run() async {
    this.runing = true;
    while (this.runing) {
      await Future.delayed(new Duration(seconds: 5));
      if (mounted) {
        this.setState(() {
          this.sliderIndex = this.sliderIndex == widget.banners.length - 1
              ? 0
              : this.sliderIndex + 1;
          this.controller.animateToPage(
                this.sliderIndex,
                duration: new Duration(milliseconds: 600),
                curve: Curves.easeInOut,
              );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Card(
          margin: EdgeInsets.zero,
          elevation: 0.0,
          child: AspectRatio(
            aspectRatio: 9.0 / 5.0,
            child: PageView(
                controller: controller,
                onPageChanged: (index) {
                  setState(() {
                    sliderIndex = index;
                  });
                },
                children: widget.banners
                    .map((ad) => GestureDetector(
                          onTap: () {
                            final id =
                                Uri.parse(ad.click).queryParameters["id"];
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => VideoPage(
                                      id: id,
                                      poster: ad.pic,
                                    )));
                          },
                          child: Image(
                            image: NetworkImage(ad.pic),
                          ),
                        ))
                    .toList()),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child:
              SliderIndicator(count: widget.banners.length, index: sliderIndex),
        )
      ],
    );
  }
}
