import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/models/models.dart';

class ContentList extends StatelessWidget {
  final String headerText;
  final List<Content> contentList;
  final bool isOriginals;

  const ContentList({
    Key key,
    this.headerText,
    this.contentList,
    this.isOriginals = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              headerText,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: isOriginals ? 500.0 : 170.0,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 5.0,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: contentList.length,
              itemBuilder: (BuildContext context, int index) {
                final Content c = contentList[index];
                return GestureDetector(
                  onTap: () => print(c.name),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16.0),
                        height: isOriginals ? 400.0 : 300.0,
                        width: isOriginals ? 200.0 : 130.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                            image: AssetImage(c.imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
