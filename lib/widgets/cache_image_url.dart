import 'package:burmese_guiter/uitils/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget cacheImage(String url,double width,height,[Color? color]) {
  return CachedNetworkImage(
    width: width,
    height: height,
    imageUrl:
        url,
    fit: BoxFit.cover,
    color: color,
    placeholder: (context, url) => CupertinoActivityIndicator(animating: true,color: kSecondaryColor,),
    errorWidget: (context, url, error) => const Icon(Icons.error),
  );
}
