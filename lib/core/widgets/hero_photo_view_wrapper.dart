import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HeroPhotoViewWrapper extends StatefulWidget {
  const HeroPhotoViewWrapper({
    required this.galleryItems,
    this.backgroundDecoration,
    this.initialIndex,
    this.scrollDirection = Axis.horizontal,
    this.onPageChanged,
    this.height,
    this.width,
    this.fit,
    this.color,
    required this.placeHolder,
    this.floor,
    this.floorTag,
  });

  final List<String> galleryItems;
  final BoxDecoration? backgroundDecoration;
  final int? initialIndex;
  final Axis scrollDirection;
  final Function(int)? onPageChanged;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final Color? color;
  final String placeHolder;
  final Widget? floor;
  final String? floorTag;

  @override
  State<HeroPhotoViewWrapper> createState() => _HeroPhotoViewWrapperState();
}

class _HeroPhotoViewWrapperState extends State<HeroPhotoViewWrapper> {
  late int currentIndex;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex ?? 0;
    pageController = PageController(initialPage: currentIndex);
  }

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
    widget.onPageChanged?.call(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(
          height: MediaQuery.of(context).size.height,
        ),
        child: Stack(
          children: [
            // PhotoViewGallery.builder(
            //   scrollPhysics: const BouncingScrollPhysics(),
            //   builder: _buildItem,
            //   itemCount:
            //       widget.galleryItems.length + (widget.floor != null ? 1 : 0),
            //   loadingBuilder: (context, event) => Center(
            //     child: Container(
            //       width: 20.0,
            //       height: 20.0,
            //       child: CircularProgressIndicator(
            //         value: event == null
            //             ? 0
            //             : event.cumulativeBytesLoaded /
            //                 event.expectedTotalBytes!,
            //       ),
            //     ),
            //   ),
            //   backgroundDecoration: widget.backgroundDecoration,
            //   pageController: pageController,
            //   onPageChanged: onPageChanged,
            //   scrollDirection: widget.scrollDirection,
            // ),
            // Positioned(
            //   top: 0,
            //   right: 0,
            //   left: 0,
            //   child: AppBar(
            //     backgroundColor: Colors.transparent,
            //     systemOverlayStyle: SystemUiOverlayStyle(
            //       statusBarColor: Colors.transparent,
            //       statusBarIconBrightness: Brightness.dark,
            //       statusBarBrightness: Brightness.light,
            //     ),
            //     leading: AppBackButton(),
            //   ),
            // ),
            Positioned(
              top: 38,
              right: MediaQuery.of(context).size.width / 2 - 30,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 3,
                  horizontal: 12,
                ),
                decoration: BoxDecoration(
                  // color: AppColors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(40),
                  ),
                  boxShadow: [
                    BoxShadow(
                      // color: AppColors.gray4.withOpacity(0.5),
                      spreadRadius: 1.0,
                      blurRadius: 1,
                      offset: const Offset(0, 1.5),
                    ),
                  ],
                ),
                child: Text(
                  '${currentIndex + 1} / ${widget.galleryItems.length + (widget.floor != null ? 1 : 0)}',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      // color: AppColors.blueGray,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // PhotoViewGalleryPageOptions _buildItem(BuildContext context, int index) {
  //   Widget? child;
  //   String tag = '';
  //   if (index < widget.galleryItems.length) {
  //     final String item = widget.galleryItems[index];
  //     tag = item;
  //     child = CustomImage(
  //       color: widget.color,
  //       fit: widget.fit,
  //       height: widget.height,
  //       imagePath: item,
  //       placeHolder: widget.placeHolder,
  //       width: widget.width,
  //     );
  //   } else if (widget.floor != null) {
  //     tag = widget.floorTag ?? '';
  //     child = widget.floor;
  //   }

  //   return PhotoViewGalleryPageOptions.customChild(
  //     child: child,
  //     initialScale: PhotoViewComputedScale.contained,
  //     minScale: PhotoViewComputedScale.contained * 0.8,
  //     maxScale: PhotoViewComputedScale.covered * 8,
  //     heroAttributes: PhotoViewHeroAttributes(tag: tag),
  //   );
  // }
}
