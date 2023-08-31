import 'package:flutter/material.dart';

class Category {
  const Category({
    required this.iconData,
    required this.title,
    required this.color,
    required this.url, // Add the URL property
  });

  final IconData iconData;
  final String title;
  final Color color;
  final String url; // Include the URL property
}

