import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:yyets/api/api.dart';
import 'package:yyets/models/menu.dart';
import 'package:yyets/pages/lib_filt.dart';
import 'package:yyets/pages/search.dart';
import 'package:yyets/pages/video.dart';
import 'package:yyets/redux/states/main.dart';
import 'package:yyets/redux/view_models/lib.dart';
import 'package:yyets/widgets/main.dart';

class LibPage extends StatefulWidget {
  @override
  _LibPageState createState() => _LibPageState();
}

class _LibPageState extends State<LibPage> {
  @override
  void initState() {
    Networking.fetchLibIndexResources();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: GestureDetector(
          child: SearchBar(
            enabled: false,
          ),
          onTap: () {
            Navigator
                .of(context)
                .push(MaterialPageRoute(builder: (context) => SearchPage()));
          },
        ),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            GridMenuView(
              callback: (Menu menu) {
                Networking.fetchLibResources(
                    channel: menu.channel, area: menu.area);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => LibFiltPage(
                          menu: menu,
                        )));
              },
            ),
            SortBar(
              onUpdate: (Sort v) {
                Networking.fetchLibIndexResources(sort: v.key);
              },
            ),
            StoreConnector<ReduxState, LibViewModel>(
                converter: (store) => LibViewModel(store),
                builder: (context, vm) {
                  return vm.isLoading
                      ? Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemCount: vm.resources.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (conext) => VideoPage(
                                          id: vm.resources[index].id,
                                          poster: vm.resources[index].poster ??
                                              "https://images.unsplash.com/photo-1503249023995-51b0f3778ccf?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=9df0dd21ec52afa496c963a48da2d287&auto=format&fit=crop&w=800&q=60",
                                          title: vm.resources[index].cnname,
                                        )));
                              },
                              child: VideoListTile(
                                resource: vm.resources[index],
                              ),
                            );
                          },
                        );
                }),
          ],
        ),
      ),
    );
  }
}
