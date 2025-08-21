import 'package:flutter/cupertino.dart';

class DestinationDetailViewModel extends ChangeNotifier {
  final Map<String, String> countryFlags = {
    "Brazil": "🇧🇷",
    "France": "🇫🇷",
    "Italy": "🇮🇹",
    "Japan": "🇯🇵",
    "USA": "🇺🇸",
  };

  String getFlagEmoji(String countryName) {
    return countryFlags[countryName] ?? '';
  }
}
