import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ud_mobile_app/core/io_ui.dart';
import 'package:ud_mobile_app/l10n/l10n.dart';

part 'language_selection_drop_down.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final homeLoadedState =
    //     context.select((HomeCubit cubit) => cubit.state) as HomeLoaded;
    final l10n = context.l10n;
    return Container(
      color: AppColors.white,
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: SafeArea(
        bottom: false,
        child: SizedBox(
          height: 36,
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    // Navigator.push(context, HomeSearchScreen.route());
                    // showCustomSearchScreen(
                    //   context: context,
                    //   delegate: HomeSearchDelegate(type: null),
                    // );
                  },
                  child: TextFormField(
                    onTap: () {},
                    enabled: false,
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: l10n.search,
                      hintStyle: AppTextStyle.s17W400.copyWith(
                        color: AppColors.gray4,
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(
                          color: AppColors.inputBorderColor,
                        ),
                      ),
                      alignLabelWithHint: true,
                      contentPadding: EdgeInsets.zero,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.fromLTRB(13, 6, 13, 6),
                        child: SvgPicture.asset(
                          AppIcon.search,
                          // color: AppColors.gray5,
                          colorFilter: const ColorFilter.mode(
                            AppColors.darkBlue,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              const LanguageSelectionDropDown(),
              const SizedBox(
                width: 12,
              ),
              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   AppInfoScreen.route(),
                  // );
                },
                child: SvgPicture.asset(
                  AppIcon.info,
                  height: 24,
                  width: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
