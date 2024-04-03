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
  "homeScreen": {
    "noFavoris": "You have no favoris crypto."
  },
  "notificationScreen": {
    "titleAppBar": "My Notifications",
    "noNotification": "No notification."
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
  "chooseAlertScreen": {
    "titleAppBar": "Set an alert for {}",
    "subtitle": "Receive notifications for price changes and more.",
    "price": "You'll be notified if the price moves above or below the value of your choice.",
    "percentageIncrease": "You'll be notified when the price increase by the percentage of your choice.",
    "percentageDecrease": "You'll be notified when the price decrease by the percentage of your choice.",
    "calendar": "You'll be notified of the stock's current price at specific times every day."
  },
  "setAlertScreen": {
    "titleAppBar": "Price Alert",
    "indicatePrice": "Last update price: {} of {}",
    "alertFor": "Alert will set for {} {}",
    "priceUnderZero": "Target price cannot be less than zero dollars.",
    "priceTooHigh": "Target price is too high",
    "dailyAlertFor": "When would you like to receive daily {} alerts ?",
    "marketOpen": "Market open",
    "marketOpenDesc": "You'll be notified daily at 9:00 am",
    "midDay": "Mid-day",
    "midDayDesc": "You'll be notified daily at 12:00 pm",
    "marketClose": "Market close",
    "marketCloseDesc": "You'll be notified daily at 4:00 pm"
  },
  "notification": {
    "priceCrosses": "Price crosses",
    "down": "Down {}",
    "up": "Up {}",
    "scheduled": "Every day at",
    "increase": "{}, a price increase of  {} {}",
    "decrease": "{}, a price decrease of {} {}",
    "reached": "{} reached the price of {}",
    "titlePrice": "{} price",
    "increaseTitle": "{} increase",
    "decreaseTitle": "{} decrease",
    "titleAlert": "{} alert"
  },
  "price": "Price",
  "percentageIncrease": "Percentage increase",
  "percentageDecrease": "Percentage decrease",
  "calendar": "Calendar",
  "alertBtn": "Create Alert",
  "updateBtn": "Uppdate Alert",
  "nextBtn": "Next",
  "dismissBtn": "Dismiss",
  "billion": "{billion}B",
  "million": "{million}M",
  "kilo": "{kilo}k",
  "noInternet": "Not internet connection."
};
static const Map<String,dynamic> fr = {
  "startScreen": {
    "button": "Demarrer",
    "helloMsg1": "Gérez",
    "helloMsg2": "vos actifs crypto",
    "helloMsg3": "en toute simplicité"
  },
  "homeScreen": {
    "noFavoris": "Vous avez aucun favoris crypto"
  },
  "notificationScreen": {
    "titleAppBar": "Mes Notifications",
    "noNotification": "Pas de notification."
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
  "chooseAlertScreen": {
    "titleAppBar": "Créer une alert pour {}",
    "subtitle": "Recevoir des notifications en cas de changement de prix et plus encore.",
    "price": "Vous serez informé si le prix évolue au-dessus ou au-dessous de la valeur de votre choix.",
    "percentageIncrease": "Vous serez averti lorsque le prix augmentera du pourcentage de votre choix.",
    "percentageDecrease": "Vous serez averti lorsque le prix diminuera du pourcentage de votre choix.",
    "calendar": "Vous serez informé du cours actuel de l'action à des heures précises chaque jour."
  },
  "setAlertScreen": {
    "titleAppBar": "Alerte prix",
    "indicatePrice": "Dernière mise à jour du prix: {} à {}",
    "alertFor": "L'alerte sera déclenchée pour {} {}",
    "priceUnderZero": "Le prix cible ne peut être inférieur à zéro dollar.",
    "priceTooHigh": "Le prix cible est trop élevé",
    "dailyAlertFor": "Quand souhaitez-vous recevoir des alertes quotidiennes sur les {} ?",
    "marketOpen": "Ouverture des marchés",
    "marketOpenDesc": "Vous serez informé tous les jours à 9h00",
    "midDay": "A la mi-journée",
    "midDayDesc": "Vous serez informé chaque jour à 12 heures",
    "marketClose": "Clôture du marché",
    "marketCloseDesc": "Vous serez informé chaque jour à 16 heures"
  },
  "notification": {
    "priceCrosses": "Croisement du prix",
    "down": "En baisse de {}",
    "up": "En hausse de {}",
    "scheduled": "Every day at",
    "increase": "{}, une hausse du prix de {} {}",
    "decrease": "{}, une baisse du prix de {} {}",
    "reached": "{} a atteint le prix de {}",
    "titlePrice": "{} prix",
    "increaseTitle": "{} hausse",
    "decreaseTitle": "{} baisse",
    "titleAlert": "{} alerte"
  },
  "price": "Prix",
  "percentageIncrease": "Pourcentage de hausse",
  "percentageDecrease": "Pourcentage de baisse",
  "calendar": "Calendrier",
  "alertBtn": "Créer une alerte",
  "updateBtn": "Alerte mise à jour",
  "nextBtn": "Suivant",
  "dismissBtn": "Annuler",
  "billion": "{billion}Md",
  "million": "{million}M",
  "kilo": "{kilo}k",
  "noInternet": "Pas de connexion internet"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "fr": fr};
}
