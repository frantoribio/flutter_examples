import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    super.key,
    this.height,
    this.width,
    this.fit,
    required this.url,
  });

  final String url;
  final double? height;
  final double? width;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      height: height,
      width: width,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return SizedBox(
          height: height,
          width: width,
          child: const Center(
            child: CircularProgressIndicator.adaptive(
                // Descomentar si quieres que el spiner muestre el progreso de la carga
                // value: loadingProgress.expectedTotalBytes != null
                //     ? loadingProgress.cumulativeBytesLoaded /
                //         loadingProgress.expectedTotalBytes!
                //     : null,
                ),
          ),
        );
      },
      errorBuilder: (context, exception, stackTrace) {
        return SizedBox(
            height: height,
            width: width,
            child:
                const Center(child: Icon(Icons.image_not_supported_outlined)));
      },
    );
  }
}
