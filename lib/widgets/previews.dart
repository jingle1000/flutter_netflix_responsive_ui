import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/models/content_model.dart';

class Previews extends StatelessWidget {
  final String title;
  final List<Content> content;

  const Previews({Key key, this.title, this.content}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 165.0,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 8.0,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: content.length,
            itemBuilder: (BuildContext context, int index) {
              final Content c = content[index];
              return GestureDetector(
                onTap: () => print(c.name),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16.0),
                      height: 130.0,
                      width: 130.0,
                      decoration: BoxDecoration(
                        border: Border.all(color: c.color, width: 4.0),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(c.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    //gradient overlay on the preview images
                    Container(
                      height: 130.0,
                      width: 130.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black45,
                              Colors.black,
                            ],
                            stops: [
                              0,
                              .25,
                              1
                            ]),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: SizedBox(
                          child: Image.asset(c.titleImageUrl),
                        ))
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
