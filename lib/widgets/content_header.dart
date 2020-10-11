import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/models/content_model.dart';
import 'package:flutter_netflix_responsive_ui/widgets/vertical_icon_button.dart';

class ContentHeader extends StatelessWidget {
  final Content featuredContnent;

  const ContentHeader({
    Key key,
    @required this.featuredContnent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 500.0,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(featuredContnent.imageUrl),
            fit: BoxFit.cover,
          )),
        ),
        //the gradient overlay
        Container(
          height: 500.0,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.black, Colors.transparent, Colors.black],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter),
          ),
        ),
        //title
        Positioned(
          bottom: 100.0,
          child: SizedBox(
            width: 250.0,
            child: Image.asset(featuredContnent.titleImageUrl),
          ),
        ),
        //title icons/controls
        Positioned(
          left: 0,
          right: 0,
          bottom: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              VerticalIconButton(
                title: "List",
                icon: Icons.add,
                onTap: () => print("List"),
              ),
              _PlayButton(),
              VerticalIconButton(
                title: "Info",
                icon: Icons.info,
                onTap: () => print("Info"),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class _PlayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
      onPressed: () => print("Play"),
      icon: const Icon(Icons.play_arrow),
      color: Colors.white,
      label: const Text(
        "Play",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
