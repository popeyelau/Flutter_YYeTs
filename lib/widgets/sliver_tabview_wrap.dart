import 'package:flutter/material.dart';

class SliverTabViewWrap extends StatelessWidget {
  final List<Widget> children;

  const SliverTabViewWrap({Key key, this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Builder(
        builder: (BuildContext context) {
          return CustomScrollView(
            slivers: <Widget>[
              SliverOverlapInjector(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(
                  vertical: 0.0,
                  horizontal: 8.0,
                ),
                sliver: SliverList(
                  delegate: SliverChildListDelegate(children),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
