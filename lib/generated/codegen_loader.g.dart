// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "startScreen": {
    "button": "Get started",
    "helloMsg1": "Manage",
    "helloMsg2": "your crypto assets",
    "helloMsg3": "simply"
  },
  "cryptoAssetScreen": {
    "msg": "The data presented is for informational purposes only. It is provided by CoingecKo, and shown on an as is basis, without representation or warranty of any kind.",
    "frame1": "Day",
    "frame2": "Week",
    "frame3": "Month",
    "frame4": "Year",
    "price": "Price",
    "24high": "24h High",
    "24low": "24h Low",
    "rank": "Market Cap Rank",
    "marketCap": "Market Cap",
    "supply": "Circulating Supply",
    "totalSupply": "Total Supply",
    "allTimeHigh": "All-Time High",
    "allTimeLow": "All-Time Low",
    "alertTitle": "Alert",
    "alertMsg": "Receive a one-time notification for this stocks when your conditions are mets"
  },
  "notification": {
    "priceCrosses": "Price crosses",
    "down": "Down {}",
    "up": "Up {}",
    "scheduled": "Every day at"
  },
  "alertBtn": "Create Alert",
  "billion": "{billion}B",
  "million": "{million}M",
  "kilo": "{kilo}k"
};
static const Map<String,dynamic> fr = {
  "startScreen": {
    "button": "Demarrer",
    "helloMsg1": "Gérez",
    "helloMsg2": "vos actifs crypto",
    "helloMsg3": "en toute simplicité"
  },
  "cryptoAssetScreen": {
    "msg": "Les données présentées le sont à titre informatif uniquement. Elles sont fournies par CoingecKo et présentées en l'état, sans déclaration ni garantie d'aucune sorte.",
    "frame1": "Jour",
    "frame2": "Semaine",
    "frame3": "Mois",
    "frame4": "Année",
    "price": "Prix",
    "24high": "Hausse 24h",
    "24low": "Baisse 24h",
    "rank": "Rang",
    "marketCap": "Capitalisation",
    "supply": "Offre en circulation",
    "totalSupply": "Offre totale",
    "allTimeHigh": "Hausse historique",
    "allTimeLow": "Baisse historique",
    "alertTitle": "Alerte",
    "alertMsg": "Recevez une notification unique pour cette crypto-monnaie lorsque vos conditions sont remplies."
  },
  "notification": {
    "priceCrosses": "Croisement du prix",
    "down": "En baisse de {}",
    "up": "En hausse de {}",
    "scheduled": "Every day at"
  },
  "alertBtn": "Créer une alerte",
  "billion": "{billion}Md",
  "million": "{million}M",
  "kilo": "{kilo}k"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "fr": fr};
}
