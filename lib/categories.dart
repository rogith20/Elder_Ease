import 'package:elder_ease/data/dummy_data.dart';
import 'package:elder_ease/emergency_contacts.dart';
import 'package:elder_ease/health_details.dart';
import 'package:elder_ease/models/category.dart';
import 'package:elder_ease/widgets/grid_item.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Categories extends StatelessWidget {
  const Categories({super.key,});


  void _selectCategory(BuildContext context, Category category) {
    if (category.url.isNotEmpty) {
      // Launch the specified URL in the default web browser
      _launchURL(category.url);
    } else {
      // Navigate to a different screen based on the category
      switch (category.title) {
        case 'Assistive Devices':
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => Health()));
          break;
        case 'Emergency Contacts':
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => EmergencyContacts()));
          break;
      // Add more cases for other categories you want to navigate to
        default:
        // Handle unknown categories or cases with no action
          print('No action defined for category: ${category.title}');
      }
    }
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      // Handle errors, e.g., URL can't be launched
      print('Could not launch $url');
    }
  }


  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.3,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      children: [
        for (final category in availableCategories)
          GridItem(
            category: category,
            onSelectCategory: () {
              _selectCategory(context, category);
            },
          )
      ],
    );
  }
}
