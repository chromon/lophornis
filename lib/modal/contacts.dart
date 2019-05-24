import 'package:flutter/material.dart';

// 联系人
class Contact {
  final String avatar;
  final String name;
  final String nameIndex;

  const Contact({
    @required this.avatar,
    @required this.name,
    @required this.nameIndex
  });
}

// 联系人数据
class ContactsPageData {
  final List<Contact> contacts = [
    const Contact(
      avatar: 'assets/images/default_nor_avatar.png',
      name: 'Maurice Sutton',
      nameIndex: 'M',
    ),
    const Contact(
      avatar: 'assets/images/default_nor_avatar.png',
      name: 'Jerry',
      nameIndex: 'J',
    ),
    const Contact(
      avatar: 'assets/images/default_nor_avatar.png',
      name: 'Dangdang',
      nameIndex: 'D',
    ),
    const Contact(
      avatar: 'assets/images/default_nor_avatar.png',
      name: 'Teddy',
      nameIndex: 'T',
    ),
    const Contact(
      avatar: 'assets/images/default_nor_avatar.png',
      name: 'Steave',
      nameIndex: 'S',
    ),
    const Contact(
      avatar: 'assets/images/default_nor_avatar.png',
      name: 'Vivian',
      nameIndex: 'V',
    ),
    const Contact(
      avatar: 'assets/images/default_nor_avatar.png',
      name: 'Mary',
      nameIndex: 'M',
    ),
    const Contact(
      avatar: 'assets/images/default_nor_avatar.png',
      name: 'David',
      nameIndex: 'D',
    ),
    const Contact(
      avatar: 'assets/images/default_nor_avatar.png',
      name: 'Bob',
      nameIndex: 'B',
    ),
    const Contact(
      avatar: 'assets/images/default_nor_avatar.png',
      name: 'Jeff Green',
      nameIndex: 'J',
    ),
    const Contact(
      avatar: 'assets/images/default_nor_avatar.png',
      name: 'Adam',
      nameIndex: 'A',
    ),
    const Contact(
      avatar: 'assets/images/default_nor_avatar.png',
      name: 'Michel',
      nameIndex: 'M',
    ),
    const Contact(
      avatar: 'assets/images/default_nor_avatar.png',
      name: 'Green',
      nameIndex: 'G',
    ),
    const Contact(
      avatar: 'assets/images/default_nor_avatar.png',
      name: 'Jack Ma',
      nameIndex: 'J',
    ),
    const Contact(
      avatar: 'assets/images/default_nor_avatar.png',
      name: 'Tom',
      nameIndex: 'T',
    ),
    const Contact(
      avatar: 'assets/images/default_nor_avatar.png',
      name: '张伟',
      nameIndex: 'Z',
    ),
    const Contact(
      avatar: 'assets/images/default_nor_avatar.png',
      name: '张益达',
      nameIndex: 'Z',
    ),
  ];

  static ContactsPageData mock() {
    return ContactsPageData();
  }
}