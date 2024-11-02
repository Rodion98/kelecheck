import 'package:flutter/material.dart';
import 'package:ud_mobile_app/features/main/data/rental_option.dart';
import 'package:ud_mobile_app/l10n/l10n.dart';

import '../../../core/io_ui.dart';

List<RentalOption> rentalTypes(BuildContext context) => [
      RentalOption(
        // ignore: avoid_dynamic_calls
        title: context.l10n.kiyal,
        description: context.l10n.kiyal_description,
        typeName: context.l10n.available_premesis,
        imagePath: AppIcon.kiyalIllust,
        type: RentalType.kiyal,
      ),
      RentalOption(
        title: context.l10n.vzmore,
        description: context.l10n.vzmore_description,
        typeName: context.l10n.available_numbers,
        imagePath: AppIcon.vzmoreIllust,
        type: RentalType.vzmore,
      ),
      RentalOption(
        title: context.l10n.vityaz,
        description: context.l10n.vityaz_description,
        typeName: context.l10n.available_numbers,
        imagePath: AppIcon.vityazIllust,
        type: RentalType.vityaz,
      ),
      RentalOption(
        title: context.l10n.hunting_farm,
        description: context.l10n.hunting_farm_description,
        typeName: context.l10n.available_kotedge,
        imagePath: AppIcon.huntingFarmIllust,
        type: RentalType.hunting_farm,
      ),
      RentalOption(
        title: context.l10n.kindergarden,
        description: context.l10n.kinder_garden_description,
        typeName: context.l10n.available_groups,
        imagePath: AppIcon.kindergardenIllust,
        type: RentalType.kindergarden,
      ),

      // TODO: temporary for ds144 and other detsads
      RentalOption(
        title: context.l10n.ds + ' 144',
        description: context.l10n.ds_desc + ' 144',
        typeName: context.l10n.available_groups,
        imagePath: AppIcon.dsIllust,
        type: RentalType.ds144,
      ),
      RentalOption(
        title: context.l10n.ds + ' 172',
        description: context.l10n.ds_desc + ' 172',
        typeName: context.l10n.available_groups,
        imagePath: AppIcon.dsIllust,
        type: RentalType.ds172,
      ),

      RentalOption(
        title: context.l10n.alarcha,
        description: context.l10n.alarcha_desc,
        typeName: context.l10n.available_numbers,
        imagePath: AppIcon.alarchaIllust,
        type: RentalType.alarcha,
      ),
    ];
