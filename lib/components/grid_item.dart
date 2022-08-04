import 'package:cached_network_image/cached_network_image.dart';
import 'package:dicoding_flutter_submission/components/error_icon.dart';
import 'package:dicoding_flutter_submission/constant.dart';
import 'package:dicoding_flutter_submission/models/animal.dart';
import 'package:dicoding_flutter_submission/screens/detail_screen.dart';
import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  final Animal animal;
  const GridItem({Key? key, required this.animal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double gridHeight =
        screenWidth > 600 ? screenHeight / 1.5 : screenHeight / 1.5;
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPage(
                      animal: animal,
                    )));
      },
      child: GridTile(
        footer: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.8),
              borderRadius:
                  const BorderRadius.all(Radius.circular(defaultBorderRadius)),
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(height: defaultPadding / 2),
              Text(
                '${animal.name}',
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 18),
              ),
              const SizedBox(height: defaultPadding / 2),
              Text(
                "${animal.animalType}, ${animal.activeTime}",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(fontSize: 14),
              ),
            ]),
          ),
        ),
        child: Container(
          height: gridHeight,
          padding: const EdgeInsets.all(defaultPadding / 2),
          decoration: BoxDecoration(
            color: Theme.of(context).bottomAppBarTheme.color,
            borderRadius:
                const BorderRadius.all(Radius.circular(defaultBorderRadius)),
          ),
          child: Container(
            width: double.infinity,
            height: gridHeight * 0.6,
            decoration: const BoxDecoration(
              borderRadius:
                  BorderRadius.all(Radius.circular(defaultBorderRadius)),
            ),
            child: animal.imageLink != null
                ? ClipRRect(
                    borderRadius: const BorderRadius.all(
                        Radius.circular(defaultBorderRadius)),
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(defaultBorderRadius),
                      child: Image(
                        image: CachedNetworkImageProvider(animal.imageLink),
                        fit: BoxFit.cover,
                        errorBuilder: (context, objext, stackTrace) {
                          return const ErrorIcon();
                        },
                      ),
                    ),
                  )
                : const Icon(Icons.broken_image),
          ),
        ),
      ),
    );
  }
}
