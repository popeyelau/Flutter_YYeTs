import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:yyets/api/api.dart';
import 'package:yyets/pages/video.dart';
import 'package:yyets/redux/actions/search.dart';
import 'package:yyets/redux/states/main.dart';
import 'package:yyets/redux/view_models/main.dart';
import 'package:yyets/redux/view_models/search.dart';
import 'package:yyets/widgets/search_bar.dart';
import 'package:yyets/widgets/video_listtile.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    Networking.fetchHotSearchKeywords();
    super.initState();
  }

  @override
  void dispose() {
    StoreContainer.global.dispatch(UpdateSearchResults(payload: []));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SearchBar(
          onSubmitted: (String keyword) {
            if (keyword.isEmpty) {
              return;
            }
            Networking.searchResrouces(keyword: keyword);
          },
        ),
      ),
      body: StoreConnector<ReduxState, SearchViewModel>(
          converter: (store) => SearchViewModel(store),
          builder: (context, vm) {
            return ListView(
              children: <Widget>[
                vm.results.isEmpty
                    ? Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  Text("热门搜索"),
                                  Divider(),
                                  Wrap(
                                    spacing: 5.0,
                                    runSpacing: 5.0,
                                    children: vm.keywords
                                        .map((v) => GestureDetector(
                                            child: Chip(
                                              label: Text(v),
                                            ),
                                            onTap: () =>
                                                vm.searchResrouces(keyword: v)))
                                        .toList(),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemCount: vm.results.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => VideoPage(
                                          id: vm.results[index].id,
                                          poster: vm.results[index].poster,
                                          title: vm.results[index].cnname,
                                        )));
                              },
                              child: VideoListTile(
                                resource: vm.results[index],
                              ),
                            );
                          },
                        ),
                      )
              ],
            );
          }),
    );
  }
}
