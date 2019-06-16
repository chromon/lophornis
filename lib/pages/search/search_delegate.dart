import 'package:flutter/material.dart';

import 'package:lophornis/constants/app_constants.dart';
import 'package:lophornis/constants/app_colors.dart';

const searchList = [
  "jiejie-1",
  "jiejie-2",
  "gege1-1",
  "gege2-2"
];

const recentSuggest = [
  "推荐-1",
  "推荐-2"
];

class GlobalSearchDelegate extends SearchDelegate<String> {

  @override
  List<Widget> buildActions(BuildContext context) {
    // 搜索内容删除按钮
    return [
      IconButton(
        icon: Image.asset(
          'assets/images/ic_close.png',
          height: AppConstants.ActionIconSize + 4.0,
          width: AppConstants.ActionIconSize + 4.0,
          color: const Color(AppColors.ActionIconColor),
        ),
        onPressed: () => query = "",
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // 搜索页返回按钮
    return IconButton(
      icon: Icon(
        IconData(
          0xe64c,
          fontFamily: AppConstants.IconFontFamily,
        ),
        size: AppConstants.ActionIconSize + 4.0,
        color: const Color(AppColors.ActionIconColor),
      ),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // 搜索结果
    return Container(
      width: 100.0,
      height: 100.0,
      child: Card(
        color: Colors.blueAccent,
        child: Center(
          child: Text(query),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // 搜索建议内容
    final suggestionList = query.isEmpty
      ? recentSuggest
      : searchList.where((input) => input.startsWith(query)).toList();
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) => ListTile(
        title: RichText(
          text: TextSpan(
            text: suggestionList[index].substring(0, query.length),
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: suggestionList[index].substring(query.length),
                style: TextStyle(color: Colors.grey)
              ),
            ],
          )
        ),
      ),
    );
  }
}