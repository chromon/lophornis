
import 'package:flutter/material.dart';

class Moment {

  final String avatar;

  final String nickname;

  final String content;

  final String address;

  final String datetime;

  final bool isSelf;

  final String videoUrl;

  final List<String> images;

  const Moment({
    @required this.avatar,
    @required this.nickname,
    this.content,
    @required this.address,
    @required this.datetime,
    @required this.isSelf,
    this.videoUrl,
    this.images
  });
}