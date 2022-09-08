
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget gmAvatar(String url,{double width=30,double? height,BoxFit? fit,BorderRadius? borderRadius}){
  var placeholder = Image.asset(
      "images/ic_no_data.png", //头像占位图
      width: width,
      height: height
  );
  return ClipRRect(
    borderRadius: borderRadius?? BorderRadius.circular(2),
    ///CachedNetworkImage 是cached_network_image包中提供的一个Widge
    child: CachedNetworkImage(
      imageUrl: url,
      width: width,
      height: height,
      fit: fit,
      placeholder: (context,url) => placeholder,
      errorWidget: (context,url,error) => placeholder,
    ),
  );
}