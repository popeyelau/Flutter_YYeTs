import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:yyets/models/video_info.dart';
import 'package:yyets/widgets/rate_view.dart';

class VideoCover extends StatelessWidget {
  final ResourceInfo resource;
  final String poster;

  const VideoCover({Key key, this.resource, this.poster = ""})
      : super(key: key);

  @override
  Widget build(context) {
    return Container(
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          child: Container(
            alignment: Alignment.center,
            child: Stack(
              children: <Widget>[
                Positioned(
                    top: 70.0,
                    left: 8.0,
                    right: 8.0,
                    bottom: 80.0,
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          Hero(
                            tag: poster,
                            child: Card(
                              color: Colors.white.withAlpha(100),
                              elevation: 5.0,
                              child: AspectRatio(
                                  aspectRatio: 3 / 4,
                                  child: Image.network(
                                    poster == "" ? resource.poster : poster,
                                    fit: BoxFit.cover,
                                  )),
                            ),
                          ),
                          SizedBox(
                            width: 16.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                resource.cnname ?? "",
                                style: TextStyle(
                                    fontSize: 16.0, color: Colors.white),
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(resource.category ?? ""),
                                    Text(resource.playStatus ?? ""),
                                    Text(resource.premiere ?? ""),
                                  ],
                                ),
                              ),
                              RateView(
                                score: resource.score ?? "0.0",
                              ),
                            ],
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ),
          decoration: BoxDecoration(color: Colors.white.withOpacity(0.25)),
        ),
      ),
    );
  }
}
