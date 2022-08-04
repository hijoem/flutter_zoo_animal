import 'package:cached_network_image/cached_network_image.dart';
import 'package:dicoding_flutter_submission/components/error_icon.dart';
import 'package:flutter/material.dart';

class ImageViewPage extends StatelessWidget {
  final String name;
  final String url;
  const ImageViewPage({Key? key, required this.url, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black26,
        foregroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0.0,
        title: Text(name),
      ),
      body: SafeArea(
        child: Center(
          child: Image(
            image: CachedNetworkImageProvider(url),
            fit: BoxFit.fitWidth,
            errorBuilder: (context, objext, stackTrace) {
              return const ErrorIcon();
            },
          ),
        ),
      ),
    );
  }
}
