import 'package:flutter/material.dart';

class Profile {
  final String name;
  final String avatar;
  final String account;

  const Profile({
    @required this.name,
    @required this.avatar,
    @required this.account,
  });
}

const Profile me = Profile(
  name: 'ellery',
  avatar: 'assets/images/default_nor_avatar.png',
  account: 'test'
);