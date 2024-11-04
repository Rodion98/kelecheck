import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ud_mobile_app/core/constants/app_images.dart';
import 'package:ud_mobile_app/core/constants/enums.dart';
import 'package:ud_mobile_app/core/widgets/custom_image.dart';
import 'package:ud_mobile_app/core/widgets/custom_image_view.dart';
import 'package:ud_mobile_app/features/main/data/rental_option.dart';

import '../../../../core/io_ui.dart';

class HomeServiceCardWidget extends StatefulWidget {
  const HomeServiceCardWidget({
    // required this.rentalOption,
    required this.overallCount,
    required this.availableCount,
    required this.status,
    required this.widgetToReplace,
    super.key,
    required this.rentalOption,
  });
  final RentalOption rentalOption;
  final int overallCount;
  final int availableCount;
  final MainStatus status;
  final Widget? widgetToReplace;

  @override
  State<HomeServiceCardWidget> createState() => _HomeServiceCardWidgetState();
}

class _HomeServiceCardWidgetState extends State<HomeServiceCardWidget> {
  bool _isTapped = false;
  bool _isWidgetToReplaceTapped = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {}
      //  () {
      //   if (widget.rentalOption.type == RentalType.kiyal ||
      //       widget.rentalOption.type == RentalType.kindergarden ||
      //       widget.rentalOption.type == RentalType.alarcha) {
      //     context.read<HomeCartCubit>().clear();
      //     context.read<MainAppCubit>().setRentalOption(widget.rentalOption);
      //     Navigator.pushAndRemoveUntil(
      //       context,
      //       MainAppScreen.route(
      //         widget.rentalOption,
      //       ),
      //       (route) => false,
      //     );
      //   } else if (widget.rentalOption.type == RentalType.ds144) {
      //     final ds144State = context.read<Ds144Cubit>().state;
      //     if (ds144State.status != MainStatus.loaded ||
      //         ds144State.productList.isEmpty) {
      //       return;
      //     }
      //     context.read<MainAppCubit>().changeIndex(0);
      //     context.read<HomeCartCubit>().clear();
      //     context.read<MainAppCubit>().setRentalOption(widget.rentalOption);
      //     Navigator.push(
      //       context,
      //       KinderGardenDetailsScreen.route(
      //         kindergardenMd: KindergardenMd.fromProductsListModel(
      //           data: ds144State.productList.first,
      //           currentLang: context.l10n,
      //           shortUrl: RentalType.ds144.name,
      //         ),
      //         hasParent: false,
      //       ),
      //     );
      //   } else if (widget.rentalOption.type == RentalType.ds172) {
      //     final ds172State = context.read<Ds172Cubit>().state;
      //     if (ds172State.status != MainStatus.loaded ||
      //         ds172State.productList.isEmpty) {
      //       return;
      //     }
      //     context.read<MainAppCubit>().changeIndex(0);
      //     context.read<HomeCartCubit>().clear();
      //     context.read<MainAppCubit>().setRentalOption(widget.rentalOption);
      //     Navigator.push(
      //       context,
      //       KinderGardenDetailsScreen.route(
      //         kindergardenMd: KindergardenMd.fromProductsListModel(
      //           data: ds172State.productList.first,
      //           currentLang: context.l10n,
      //           shortUrl: RentalType.ds172.name,
      //         ),
      //         hasParent: false,
      //       ),
      //     );
      //   } else {
      //     showCupertinoDialog(
      //       context: context,
      //       builder: (context) => CupertinoAlertDialog(
      //         title: Text(
      //           context.l10n.under_development,
      //         ),
      //         content: Text(
      //           context.l10n.under_development_info,
      //         ),
      //         actions: [
      //           CupertinoDialogAction(
      //             child: Text(
      //               context.l10n.confirm,
      //             ),
      //             textStyle: AppTextStyle.s17.copyWith(
      //               color: const Color(0xFF007aff),
      //             ),
      //             onPressed: () {
      //               Navigator.pop(context);
      //             },
      //           ),
      //         ],
      //       ),
      //     );
      //   }
      // }
      ,
      // onTapDown: (details) => setState(() {
      //   _isTapped = true;
      // }),
      // onTapUp: (details) => setState(() {
      //   _isTapped = false;
      // }),
      // onTapCancel: () => setState(() {
      //   _isTapped = false;
      // }),
      borderRadius: BorderRadius.circular(12),
      splashColor: AppColors.lightBlue,
      highlightColor: AppColors.lightBlue.withOpacity(0.5),
      child: Ink(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColors.gray4.withOpacity(0.5),
              spreadRadius: 1.0,
              blurRadius: 1,
              offset: const Offset(0, 1.5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    widget.rentalOption.title,
                    style: AppTextStyle.s19.copyWith(
                      fontWeight: FontWeight.w500,
                      color: _isTapped && !_isWidgetToReplaceTapped
                          ? AppColors.white
                          : AppColors.darkBlue,
                    ),
                  ),
                  const SizedBox(height: 13),
                  Text(
                    widget.rentalOption.description,
                    style: AppTextStyle.s10.copyWith(
                      color: _isTapped && !_isWidgetToReplaceTapped
                          ? AppColors.white
                          : AppColors.silverGray,
                    ),
                  ),
                  const SizedBox(height: 15),
                  if (widget.widgetToReplace == null) ...[
                    if (widget.status == MainStatus.loading)
                      CupertinoActivityIndicator(
                        radius: 11,
                      )
                    else
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '${widget.availableCount}/',
                              style: AppTextStyle.s19.copyWith(
                                color: _isTapped && !_isWidgetToReplaceTapped
                                    ? AppColors.white
                                    : AppColors.darkBlue,
                              ),
                            ),
                            TextSpan(
                              text: '${widget.overallCount} ',
                              style: AppTextStyle.s19.copyWith(
                                color: _isTapped && !_isWidgetToReplaceTapped
                                    ? AppColors.white
                                    : AppColors.silverGray,
                              ),
                            ),
                            TextSpan(
                              text: widget.rentalOption.typeName,
                              style: AppTextStyle.s10.copyWith(
                                color: _isTapped && !_isWidgetToReplaceTapped
                                    ? AppColors.white
                                    : AppColors.silverGray,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                    const SizedBox(height: 5),
                    SizedBox(
                      height: 5,
                      child: LinearProgressIndicator(
                        value: (widget.overallCount == 0)
                            ? 0
                            : widget.availableCount / widget.overallCount,
                        borderRadius: BorderRadius.circular(5),
                        backgroundColor: AppColors.DFDF,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Color(0xFF7AB24F),
                        ),
                      ),
                    ),
                  ] else
                    GestureDetector(
                      onTapDown: (details) => setState(() {
                        _isWidgetToReplaceTapped = true;
                      }),
                      onTapUp: (details) => setState(() {
                        _isWidgetToReplaceTapped = false;
                      }),
                      onTapCancel: () => setState(() {
                        _isWidgetToReplaceTapped = false;
                      }),
                      child: widget.widgetToReplace!,
                    ),
                ],
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            // Container(color: AppColors.A7A7A7,width: 40,height: 40),
            // SvgPicture.asset(AppImagePaths.kyalCard,height: 50,width: 50,),
            // CustomImage(imagePath: AppImagePaths.kyalCard,placeHolder: 'assets/applogo.png',color: ,)
          ],
        ),
      ),
    );
  }
}
