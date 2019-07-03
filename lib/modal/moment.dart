
import 'package:flutter/material.dart';

class Moment {

  final String avatar;

  final String nickname;

  final String content;

  final String address;

  final String time;

  final bool isSelf;

  final String from;

  final VideoModal video;

  final List<String> images;

  final LinkModal linkModal;

  const Moment({
    @required this.avatar,
    @required this.nickname,
    this.content,
    @required this.address,
    @required this.time,
    @required this.isSelf,
    this.from,
    this.video,
    this.images,
    this.linkModal
  });
}

class VideoModal {

  final String videoUrl;

  final String videoImage;

  const VideoModal(
    this.videoUrl,
    this.videoImage
  );
}

class LinkModal {

  final String linkAvatar;

  final String linkTitle;

  final String linkUrl;

  const LinkModal(
    this.linkAvatar,
    this.linkTitle,
    this.linkUrl,
  );
}

class MomentData {

  final List<Moment> moments;

  const MomentData({
    this.moments
  });

  static mock() {
    return MomentData(moments: momentList);
  }

  static List<Moment> momentList = [
    const Moment(
      avatar: 'assets/images/default_nor_avatar.png',
      nickname: 'Ellery',
      content: '测试内容',
      address: '北京',
      time: '12:38',
      isSelf: true,
      from: '测试来源',
      images: [
        'assets/images/ic_splash.png',
        'assets/images/ic_splash.png',
        'assets/images/ic_splash.png',
        'assets/images/ic_splash.png',
        'assets/images/ic_splash.png',
      ],
      video: null,
      linkModal: null,
    ),
    const Moment(
      avatar: 'assets/images/default_nor_avatar.png',
      nickname: 'Ellery',
      content: '测试内容',
      address: '北京',
      time: '12:38',
      isSelf: true,
      images: [
        // 'assets/images/ic_splash.png',
        // 'assets/images/ic_splash.png',
        // 'assets/images/ic_splash.png',
        // 'assets/images/ic_splash.png',
        // 'assets/images/ic_splash.png'
      ],
      video: VideoModal('assets/images/ic_splash.png', 'assets/images/ic_splash.png'),
      linkModal: null,
    ),
    const Moment(
      avatar: 'assets/images/default_nor_avatar.png',
      nickname: 'Ellery',
      content: '测试内容',
      address: '北京',
      time: '12:38',
      isSelf: true,
      from: '测试来源',
      images: [],
      video: null,
      linkModal: LinkModal('assets/images/default_nor_avatar.png', '测试链接', 'xxx')
    ),
  ];
}