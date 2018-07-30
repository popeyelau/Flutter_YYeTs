import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:yyets/api/api.dart';
import 'package:yyets/models/menu.dart';
import 'package:yyets/pages/search.dart';
import 'package:yyets/pages/video.dart';
import 'package:yyets/redux/states/main.dart';
import 'package:yyets/redux/view_models/lib.dart';
import 'package:yyets/widgets/main.dart';

class LibFiltPage extends StatefulWidget {
  final Menu menu;

  const LibFiltPage({Key key, this.menu}) : super(key: key);
  @override
  _LibFiltPageState createState() => _LibFiltPageState();
}

class _LibFiltPageState extends State<LibFiltPage> {
  @override
  void initState() {
    Networking.fetchResourceCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.menu.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator
                  .of(context)
                  .push(MaterialPageRoute(builder: (context) => SearchPage()));
            },
          )
        ],
      ),
      body: Container(
        child: StoreConnector<ReduxState, LibViewModel>(
            converter: (store) => LibViewModel(store),
            builder: (context, vm) {
              vm.area = widget.menu.area;
              return vm.categories.length == 1
                  ? Container()
                  : ListView(
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                LibFiltGroup(
                                    group: "类型",
                                    children: vm.categories,
                                    callback: (category) {
                                      vm.selectedCategory = category;
                                      vm.refresResources();
                                    }),
                                LibFiltGroup(
                                    group: "年份",
                                    children: vm.years,
                                    callback: (year) {
                                      vm.selectedYear = year;
                                      vm.refresResources();
                                    }),
                                LibFiltGroup(
                                    group: "电视台",
                                    children: vm.tvs,
                                    callback: (tv) {
                                      vm.selectedTv = tv;
                                      vm.refresResources();
                                    }),
                              ],
                            )),
                        SortBar(
                          onUpdate: (Sort v) {
                            vm.sort = v.key;
                            vm.refresResources();
                          },
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemCount: vm.filtedResources.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => VideoPage(
                                          id: vm.filtedResources[index].id,
                                          poster:
                                              vm.filtedResources[index].poster,
                                          title:
                                              vm.filtedResources[index].cnname,
                                        )));
                              },
                              child: VideoListTile(
                                resource: vm.filtedResources[index],
                              ),
                            );
                          },
                        )
                      ],
                    );
            }),
      ),
    );
  }
}

class LibFiltGroup extends StatefulWidget {
  final String group;
  final List<String> children;
  final Function callback;

  LibFiltGroup({Key key, this.group, this.children, this.callback})
      : super(key: key);

  @override
  LibFiltGroupState createState() {
    return new LibFiltGroupState();
  }
}

class LibFiltGroupState extends State<LibFiltGroup> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40.0,
        alignment: Alignment.center,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 5.0),
              child: Text(
                widget.group,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: widget.children.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final textStyle = selected == index
                        ? TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue)
                        : null;
                    return GestureDetector(
                      onTap: () {
                        if (selected == index) {
                          return;
                        }
                        setState(() {
                          selected = index;
                        });
                        widget.callback(widget.children[index]);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          widget.children[index],
                          style: textStyle,
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ));
  }
}
