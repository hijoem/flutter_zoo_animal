import 'package:cached_network_image/cached_network_image.dart';
import 'package:dicoding_flutter_submission/components/error_icon.dart';
import 'package:dicoding_flutter_submission/constant.dart';
import 'package:dicoding_flutter_submission/models/animal.dart';
import 'package:dicoding_flutter_submission/screens/image_view.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Animal animal;
  const DetailPage({Key? key, required this.animal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    var heightImage = screenHeight * 0.5;
    // TextStyle head = Theme.of(context).textTheme.bodyLarge!.copyWith(
    //       fontWeight: FontWeight.bold,
    //     );
    TextStyle body = Theme.of(context).textTheme.bodyLarge!.copyWith();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black12,
        foregroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0.0,
        title: Text(animal.name),
      ),
      body: Stack(children: [
        SizedBox(
          height: heightImage,
          width: double.infinity,
          child: GestureDetector(
            child: Image(
              image: CachedNetworkImageProvider(animal.imageLink),
              fit: BoxFit.cover,
              errorBuilder: (context, objext, stackTrace) {
                return const ErrorIcon();
              },
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ImageViewPage(
                            name: animal.name,
                            url: animal.imageLink,
                          )));
            },
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            height: screenHeight * 0.6,
            width: double.infinity,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color:
                    Theme.of(context).scaffoldBackgroundColor.withOpacity(0.8),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(defaultBorderRadius * 3),
                  topRight: Radius.circular(defaultBorderRadius * 3),
                ),
              ),
              child: SingleChildScrollView(
                  child: SizedBox(
                      width: screenWidth,
                      child: Padding(
                        padding: const EdgeInsets.all(defaultPadding * 2),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // Flexible(
                            //   child: Column(
                            //     crossAxisAlignment: CrossAxisAlignment.start,
                            //     children: [
                            //       const SizedBox(height: defaultPadding),
                            //       Text('Name', style: head),
                            //       Text('Latin', style: head),
                            //       Text('Lifespan', style: head),
                            //       Text('Weight', style: head),
                            //       Text('Length', style: head),
                            //       Text('Type', style: head),
                            //       Text('Active Time', style: head),
                            //       Text('Diet', style: head),
                            //       Text('Habitat', style: head),
                            //       Text('Geo Range', style: head),
                            //     ],
                            //   ),
                            // ),
                            Flexible(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: defaultPadding),
                                  Text('Name: ${animal.name}', style: body),
                                  const SizedBox(height: defaultPadding / 4),
                                  Text('Latin Name: ${animal.latinName}',
                                      style: body),
                                  const SizedBox(height: defaultPadding / 4),
                                  Text('Lifespan: ${animal.lifespan} years',
                                      style: body),
                                  const SizedBox(height: defaultPadding / 4),
                                  Text(
                                      'Weight: ${animal.weightMin} - ${animal.weightMax} pounds',
                                      style: body),
                                  const SizedBox(height: defaultPadding / 4),
                                  Text(
                                      'Length: ${animal.lengthMin} - ${animal.lengthMax} feet',
                                      style: body),
                                  const SizedBox(height: defaultPadding / 4),
                                  Text('Type: ${animal.animalType}',
                                      style: body),
                                  const SizedBox(height: defaultPadding / 4),
                                  Text('Active time: ${animal.activeTime}',
                                      style: body),
                                  const SizedBox(height: defaultPadding / 4),
                                  Text('Diet: ${animal.diet}',
                                      style: body, softWrap: true),
                                  const SizedBox(height: defaultPadding / 4),
                                  Text('Habitat: ${animal.habitat}',
                                      style: body),
                                  const SizedBox(height: defaultPadding / 4),
                                  Text('Geo Range: ${animal.geoRange}',
                                      style: body),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ))),
            ),
          ),
        ),
      ]),
    );
  }
}
