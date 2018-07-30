import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:yyets/models/comment.dart';

class ResourceTile extends StatelessWidget {
  final ResourceInfo resource;

  const ResourceTile({Key key, this.resource}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: ListTile(
        leading: Hero(
          tag: resource.poster,
          child: Image(
            image: CachedNetworkImageProvider(resource.posterS),
            fit: BoxFit.cover,
            width: 50.0,
            height: 50.0,
          ),
        ),
        title: Text(resource.cnname),
        subtitle: Text(resource.itemupdate),
      ),
    );
  }
}
