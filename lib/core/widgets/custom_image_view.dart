import 'package:flutter/material.dart';
import 'package:ud_mobile_app/core/io_ui.dart';
import 'package:ud_mobile_app/core/widgets/custom_image.dart';
import 'package:ud_mobile_app/core/widgets/hero_photo_view_wrapper.dart';

class CustomImageView extends StatelessWidget {
  const CustomImageView({
    super.key,
    this.imagePath,
    this.height,
    this.width,
    this.color,
    this.fit,
    this.alignment,
    this.onTap,
    this.radius,
    this.margin,
    this.border,
    this.placeHolder = 'assets/applogo.png',
    this.isPhotoView = false,
    this.hasHero = false,
    this.initialIndex = 0,
    this.images,
    this.pageController,
  });
  final String? imagePath;
  final double? height;
  final Color? color;
  final BoxFit? fit;
  final double? width;
  final String placeHolder;
  final Alignment? alignment;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? radius;
  final BoxBorder? border;
  final bool isPhotoView;
  final bool hasHero;
  final int initialIndex;
  final List<String>? images;
  final PageController? pageController;

  @override
  Widget build(BuildContext context) {
    Widget child = _buildWidget(context);
    if (alignment != null) {
      child = Align(alignment: alignment!, child: child);
    }
    return child;
  }

  Widget _buildWidget(BuildContext context) {
    Widget child = _buildCircleImage();
    if (hasHero) {
      child = Hero(
        tag: imagePath ?? this.hashCode.toString(),
        child: child,
      );
    }

    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: InkWell(
        onTap: isPhotoView
            ? () {
                _onPhotoViewTap(context: context);
              }
            : onTap,
        child: child,
      ),
    );
  }

  ///build the image with border radius
  Widget _buildCircleImage() {
    Widget child = _buildImageWithBorder();
    if (radius != null) {
      child = ClipRRect(
        borderRadius: radius ?? BorderRadius.zero,
        child: child,
      );
    }

    return ClipRRect(
      borderRadius: radius ?? BorderRadius.zero,
      child: child,
    );
  }

  ///build the image with border and border radius style
  Widget _buildImageWithBorder() {
    return Container(
      decoration: border == null
          ? null
          : BoxDecoration(
              border: border,
              borderRadius: radius,
            ),
      child: CustomImage(
        height: height,
        width: width,
        fit: fit,
        color: color,
        imagePath: imagePath,
        placeHolder: placeHolder,
      ),
    );
  }

  void _onPhotoViewTap({
    required BuildContext context,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HeroPhotoViewWrapper(
          galleryItems: images ?? [],
          backgroundDecoration: const BoxDecoration(color: AppColors.white),
          initialIndex: initialIndex,
          scrollDirection: Axis.horizontal,
          onPageChanged: (index) {
            pageController?.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
          height: height,
          width: width,
          fit: fit,
          color: color,
          placeHolder: placeHolder,
        ),
      ),
    );
  }
}
