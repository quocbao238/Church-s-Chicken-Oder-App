import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'loading_widget.dart';

class CacheNetworkImage extends StatelessWidget {
  final String imageUrl;
  CacheNetworkImage({this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.fill
          ),
        ),
      ),
      placeholder: (context, url) => LoadingWidget(),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
