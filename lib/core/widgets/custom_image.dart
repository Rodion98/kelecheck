import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    this.height,
    this.width,
    this.fit,
    this.color,
    required this.imagePath,
    required this.placeHolder,
  });

  final double? height;
  final double? width;
  final BoxFit? fit;
  final Color? color;
  final String? imagePath;
  final String placeHolder;

  @override
  Widget build(BuildContext context) {
    if (imagePath != null) {
      switch (ImageTypes.getImageType(imagePath!)) {
        case ImageType.svg:
          return _buildSvg();
        case ImageType.file:
          return _buildImageFromFile();
        case ImageType.network:
          return _buildCachedNetworkImage();
        case ImageType.png:
          return _buildPngImage();
        case ImageType.svgNetwork:
          return _buildSvgNetworkPicture();
        default:
          return const SizedBox();
      }
    }
    return const SizedBox();
  }

  SizedBox _buildSvgNetworkPicture() {
    return SizedBox(
      height: height,
      width: width,
      child: SvgPicture.network(
        imagePath!,
        height: height,
        width: width,
        fit: fit ?? BoxFit.contain,
        colorFilter: color != null
            ? ColorFilter.mode(
                color!,
                BlendMode.srcIn,
              )
            : null,
      ),
    );
  }

  Image _buildPngImage() {
    return Image.asset(
      imagePath!,
      height: height,
      width: width,
      fit: fit ?? BoxFit.contain,
      color: color,
    );
  }

  CachedNetworkImage _buildCachedNetworkImage() {
    return CachedNetworkImage(
      height: height,
      width: width,
      fit: fit ?? BoxFit.contain,
      imageUrl: imagePath!,
      color: color,
      placeholder: (context, url) => SizedBox(
        height: 30,
        width: 30,
        child: LinearProgressIndicator(
          color: Colors.grey.shade200,
          backgroundColor: Colors.grey.shade100,
        ),
      ),
      errorWidget: (context, url, error) => Image.asset(
        placeHolder,
        height: height,
        width: width,
        fit: fit ?? BoxFit.contain,
      ),
    );
  }

  Image _buildImageFromFile() {
    return Image.file(
      File(imagePath!),
      height: height,
      width: width,
      fit: fit ?? BoxFit.contain,
      color: color,
    );
  }

  SizedBox _buildSvg() {
    return SizedBox(
      height: height,
      width: width,
      child: SvgPicture.asset(
        imagePath!,
        height: height,
        width: width,
        fit: fit ?? BoxFit.contain,
        colorFilter: color != null
            ? ColorFilter.mode(
                color!,
                BlendMode.srcIn,
              )
            : null,
      ),
    );
  }
}

enum ImageType { svg, png, network, file, svgNetwork, unknown }

abstract class ImageTypes {
  static ImageType getImageType(String url) {
    if (url.startsWith('http') || url.startsWith('https')) {
      if (url.endsWith('.svg')) {
        return ImageType.svgNetwork;
      }
      return ImageType.network;
    } else if (url.endsWith('.svg')) {
      return ImageType.svg;
    } else if (url.startsWith('file://')) {
      return ImageType.file;
    } else {
      return ImageType.png;
    }
  }
}
