import 'package:flutter/material.dart';
import 'package:rickymorty_app/models/models.dart';

class ImageGridTile extends StatelessWidget {
  final Character character;
  const ImageGridTile({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/characterDetail',
          arguments: character,
        );
      },
      child: Stack(alignment: Alignment.bottomLeft, children: [
        Image.network(
          character.image,
          width: double.infinity,
        ),
        Container(
          height: 50,
          width: double.infinity,
          padding: const EdgeInsets.all(5),
          color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(character.name, overflow: TextOverflow.ellipsis),
                Text(character.species.toString(),
                    overflow: TextOverflow.ellipsis),
              ]),
        ),
      ]),
    );
    ;
  }
}
