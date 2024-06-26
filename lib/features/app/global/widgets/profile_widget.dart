import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/features/app/theme/style.dart';
import 'package:flutter/material.dart';

Widget profileWidget({String? imageUrl, File? image}) {
  if (image == null) {
    if (imageUrl == null || image == "") {
      return Image.asset(
        'assets/profile_default.png',
        fit: BoxFit.cover,
      );
    } else {
      return CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        progressIndicatorBuilder: (context, url, progress) {
          return const CircularProgressIndicator(
            color: tabColor,
          );
        },
        errorWidget: (context, url, error) => Image.asset(
          'assets/profile_default.png',
          fit: BoxFit.cover,
        ),
      );
    }
  } else {
    return Image.file(
      image,
      fit: BoxFit.cover,
    );
  }
}
