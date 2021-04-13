import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  final String image;
  CircleImage({@required this.image});
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      imageBuilder: (context, imageProvider) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          ),
        );
      },
      placeholder: (context, url) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
      errorWidget: (context, url, error) {
        return Icon(Icons.error);
      },
    );
  }
}
