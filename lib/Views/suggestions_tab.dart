import 'package:flutter/material.dart';
import 'package:youtubeclone/Models/colors.dart';
import 'package:youtubeclone/Models/textstyles.dart';

class SuggestionsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView(
        padding: EdgeInsets.only(left: 5),
        scrollDirection: Axis.horizontal,
        shrinkWrap: false,
        children: getTags(),
      ),
    );
  }

  List<Widget> getTags() {
    List<Widget> tags = [];
    for (int i = 0; i < 7; i++) {
      tags.add(
        Container(
          margin: EdgeInsets.only(left: 10),
          child: TextButton(
            style: TextButton.styleFrom(
              foregroundColor: buttonUnselectedIconsColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: tabBarUnselectedIconsColor, width: 0.5),
              ),
            ),
            onPressed: () {},
            child: Text(tagList[i], style: videoTitleStyle),
          ),
        ),
      );
    }
    return tags;
  }

  final List<String> tagList = [
    "All",
    "Today",
    "Continue watiching",
    "Unwathced",
    "Trending",
    "Programming",
    "Python",
  ];

  const SuggestionsTab({super.key});
}
