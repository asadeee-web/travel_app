import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier {
  final List<String> regions = [
    "Asia",
    "Europe",
    "South America",
    "North America",
    "Africa",
    "Oceania",
  ];

  final List<Map<String, dynamic>> destinations = [
    {
      "country": "Brazil",
      "city": "Rio de Janeiro",
      "image":
          "https://images.unsplash.com/photo-1507608616759-54f48f0af0ee?w=500&auto=format&fit=crop&q=60",
      "rating": "5.0",
      "reviews": "143 reviews",
    },
    {
      "country": "France",
      "city": "Paris",
      "image":
          "https://images.unsplash.com/photo-1502602898657-3e91760cbb34?w=500&auto=format&fit=crop&q=60",
      "rating": "4.8",
      "reviews": "210 reviews",
    },
    {
      "country": "Italy",
      "city": "Venice",
      "image":
          "https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=500&auto=format&fit=crop&q=60",
      "rating": "4.7",
      "reviews": "178 reviews",
    },
    {
      "country": "Japan",
      "city": "Tokyo",
      "image":
          "https://images.unsplash.com/photo-1549693578-d683be217e58?w=500&auto=format&fit=crop&q=60",
      "rating": "4.9",
      "reviews": "320 reviews",
    },
    {
      "country": "USA",
      "city": "New York",
      "image":
          "https://images.unsplash.com/photo-1505761671935-60b3a7427bad?w=500&auto=format&fit=crop&q=60",
      "rating": "4.6",
      "reviews": "500 reviews",
    },
  ];

  int selectedIndex = 0;

  void setSelectedIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
