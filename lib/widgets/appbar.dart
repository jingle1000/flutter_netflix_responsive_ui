import 'package:flutter/material.dart';

import '../assets.dart';

class HomeAppBar extends StatelessWidget {
  final double scrollOffset;

  const HomeAppBar({
    Key key,
    this.scrollOffset = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(scrollOffset);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      color: Colors.red
          .withOpacity((this.scrollOffset / 350.0).clamp(0, 1).toDouble()),
      child: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              Assets.flagsLogo,
            ),
            Wrap(
              children: [
                GestureDetector(
                    onTap: () => print("Search"),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    )),
                GestureDetector(
                  onTap: () => print("Settings"),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                    child: Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
