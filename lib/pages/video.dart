import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:yyets/api/api.dart';
import 'package:yyets/models/article.dart';
import 'package:yyets/models/video_info.dart';
import 'package:yyets/pages/payer.dart';
import 'package:yyets/redux/actions/dynamic.dart';
import 'package:yyets/redux/reducers/video.dart';
import 'package:yyets/widgets/main.dart';

class VideoPage extends StatefulWidget {
  final String id;
  final String title;
  final String poster;

  const VideoPage({Key key, this.id, this.title = "", this.poster})
      : super(key: key);

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage>
    with SingleTickerProviderStateMixin {
  TabController controller;

  Store<VideoState> store;

  @override
  void initState() {
    controller = TabController(length: 6, vsync: this);
    store = Store<VideoState>(videoReducer,
        initialState: VideoState.initialState());
    super.initState();

    Networking
        .fetchVideoInfo(id: widget.id)
        .then((v) => store.dispatch(UpdateVideoInfo(payload: v)));

    Networking
        .fetchVideoComments(videoId: widget.id)
        .then((v) => store.dispatch(UpdateVideoComments(payload: v)));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverOverlapAbsorber(
                    handle: NestedScrollView
                        .sliverOverlapAbsorberHandleFor(context),
                    child: StoreConnector<VideoState, VideoViewModel>(
                        converter: (store) => VideoViewModel(store),
                        builder: (context, vm) {
                          return SliverAppBar(
                            title: Text(vm.videoInfo.resourceInfo.cnname),
                            flexibleSpace: FlexibleSpaceBar(
                              background: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: (widget.poster == "")
                                            ? AssetImage(
                                                "assets/images/cover.jpg")
                                            : NetworkImage(widget.poster))),
                                child: VideoCover(
                                  resource: vm.videoInfo.resourceInfo,
                                  poster: widget.poster,
                                ),
                              ),
                            ),
                            expandedHeight: 300.0,
                            pinned: true,
                            bottom: _buildTabBar(),
                          );
                        }),
                  ),
                ];
              },
              body: _buildTabBarView()),
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return PreferredSize(
      preferredSize: Size(double.infinity, 40.0),
      child: Container(
        color: Colors.white,
        child: TabBar(
          controller: controller,
          labelColor: Colors.black,
          indicatorColor: Colors.black87,
          indicatorSize: TabBarIndicatorSize.label,
          isScrollable: false,
          tabs: <Widget>[
            Tab(
              text: "剧集",
            ),
            Tab(
              text: "简介",
            ),
            Tab(
              text: "求助",
            ),
            Tab(
              text: "评论",
            ),
            Tab(
              text: "影片",
            ),
            Tab(
              text: "资讯",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabBarView() {
    return TabBarView(
      controller: controller,
      children: [
        SliverTabViewWrap(
          children: <Widget>[
            StoreConnector<VideoState, VideoViewModel>(
                converter: (store) => VideoViewModel(store),
                builder: (context, vm) {
                  return vm.videoInfo.resourceInfo.channel == "tv"
                      ? Column(
                          children: vm.seasons
                              .map((v) => SeriesListView(
                                  season: v,
                                  callback: (EpisodeList e) {
                                    Navigator
                                        .of(context)
                                        .push(MaterialPageRoute(
                                            builder: (context) => PlayerPage(
                                                  title: "${vm.videoInfo
                                                      .resourceInfo.cnname} - ${e.episode.padLeft(2, '0')}",
                                                  cover: vm.videoInfo
                                                      .resourceInfo.poster,
                                                )));
                                  }))
                              .toList())
                      : Container(
                          height: 100.0,
                          child: Center(
                            child: RaisedButton(
                              color: Colors.blue,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 48.0),
                                child: Text(
                                  "播放资源",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        );
                }),
          ],
        ),
        SliverTabViewWrap(
          children: <Widget>[
            StoreConnector<VideoState, VideoViewModel>(
                converter: (store) => VideoViewModel(store),
                builder: (context, vm) {
                  return Text(
                    vm.videoInfo.resourceInfo.content ?? "",
                    style: TextStyle(height: 1.5),
                  );
                }),
          ],
        ),
        SliverTabViewWrap(
          children: <Widget>[
            StoreConnector<VideoState, VideoViewModel>(
                converter: (store) => VideoViewModel(store),
                builder: (context, vm) {
                  return vm.helps.length > 0
                      ? HelpListView(
                          helps: vm.videoInfo.helpList,
                        )
                      : EmptyView();
                })
          ],
        ),
        SliverTabViewWrap(
          children: <Widget>[
            StoreConnector<VideoState, VideoViewModel>(
                converter: (store) => VideoViewModel(store),
                builder: (context, vm) {
                  return CommentList(comments: vm.videoComments);
                })
          ],
        ),
        SliverTabViewWrap(
          children: <Widget>[
            StoreConnector<VideoState, VideoViewModel>(
                converter: (store) => VideoViewModel(store),
                builder: (context, vm) {
                  return VideoGridView(
                    resources: vm.videoInfo.similarList,
                  );
                }),
          ],
        ),
        SliverTabViewWrap(
          children: <Widget>[
            StoreConnector<VideoState, VideoViewModel>(
                converter: (store) => VideoViewModel(store),
                builder: (context, vm) {
                  return vm.videoInfo.articleList.length > 0
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemCount: vm.videoInfo.articleList.length,
                          itemBuilder: (context, index) {
                            return ArticleView(
                                vm: ArticleViewModel.fromVideoArticle(
                                    vm.videoInfo.articleList[index]));
                          },
                        )
                      : EmptyView();
                }),
          ],
        )
      ],
    );
  }
}
