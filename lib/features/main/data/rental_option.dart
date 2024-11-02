// TODO: add each detsad separately
import 'package:flutter/material.dart';
import 'package:ud_mobile_app/l10n/l10n.dart';

enum RentalType {
  kiyal,
  vityaz,
  vzmore,
  hunting_farm,
  kindergarden,
  ds144,
  ds172,
  alarcha,
}

class RentalOption {
  RentalOption({
    required this.title,
    required this.description,
    required this.typeName,
    required this.imagePath,
    required this.type,
  });

  final String title;
  final String description;
  final String typeName;
  final String imagePath;
  final RentalType type;
}

String getLocalizedRentalType(BuildContext context, RentalType type) {
  final l10n = context.l10n;
  switch (type) {
    case RentalType.kiyal:
      return l10n.kiyal;
    case RentalType.vityaz:
      return l10n.vityaz;
    case RentalType.vzmore:
      return l10n.vzmore;
    case RentalType.hunting_farm:
      return l10n.hunting_farm;
    case RentalType.kindergarden:
      return l10n.kindergarden;
    case RentalType.ds144:
      return l10n.ds + ' №144';
    case RentalType.ds172:
      return l10n.ds + ' №172';
    case RentalType.alarcha:
      return l10n.alarcha;
  }
}

String getLocalizedRentalTypeByName(BuildContext context, String? typeName) {
  final l10n = context.l10n;
  switch (typeName) {
    case 'kiyal':
      return l10n.kiyal;
    case 'vityaz':
      return l10n.vityaz;
    case 'vzmore':
      return l10n.vzmore;
    case 'hunting_farm':
      return l10n.hunting_farm;
    case 'kindergarden':
      return l10n.kindergarden;
    case 'ds144':
      return l10n.ds + ' №144';
    case 'ds172':
      return l10n.ds + ' №172';
    case 'alarcha':
      return l10n.alarcha;
    default:
      return '';
  }
}
