import 'package:flutter/material.dart';

class AssetImageLoader extends StatelessWidget {
  final String imagePath;
  final Color? color;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final BlendMode? colorBlendMode;
  final Animation<double>? opacity;
  final FilterQuality filterQuality;

  const AssetImageLoader(
      {super.key,
      required this.imagePath,
      this.color,
      this.width,
      this.height,
      this.opacity,
      this.colorBlendMode,
      this.fit,
      this.filterQuality = FilterQuality.high});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      color: color,
      width: width,
      height: height,
      fit: fit,
      colorBlendMode: colorBlendMode,
      opacity: opacity,
      filterQuality: filterQuality,
    );
  }
}
