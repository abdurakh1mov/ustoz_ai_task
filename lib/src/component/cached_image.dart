import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ustoz_ai_task/src/core/theme/app_colors.dart';

class CachedImage extends StatelessWidget {
  const CachedImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.isCircle = false, // add flag
    this.borderRadius,
  });

  final String imageUrl;
  final double? width;
  final double? height;
  final bool isCircle;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    final image = CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => Center(
        child: CircularProgressIndicator.adaptive(
          backgroundColor: context.appColors.white,
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      fit: BoxFit.cover,
      height: height,
      width: width,
    );

    return isCircle
        ? ClipOval(child: image)
        : ClipRRect(
            borderRadius: borderRadius ?? BorderRadius.zero,
            child: image,
          );
  }
}
