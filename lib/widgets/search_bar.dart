import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final String placeholder;
  final bool enabled;
  final Function onSubmitted;

  const SearchBar(
      {Key key, this.placeholder = "搜索美剧/日剧/电影", this.enabled = true, this.onSubmitted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5.0)),
      child: TextField(
        enabled: enabled,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          hintText: placeholder,
          border: InputBorder.none,
        ),
        onSubmitted: onSubmitted,
      ),
    );
  }
}
