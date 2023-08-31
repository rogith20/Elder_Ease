import 'package:flutter/material.dart';
import 'package:elder_ease/models/category.dart';

const availableCategories = [
  Category(
    iconData: Icons.medical_services,
    title: 'Medicines',
    color: Colors.purple,
    url: 'https://www.apollopharmacy.in/',
  ),
  Category(
    iconData: Icons.local_taxi,
    title: 'Transportation',
    color: Colors.red,
    url: 'https://www.olacabs.com/',
  ),
  Category(
    iconData: Icons.local_hospital,
    title: 'Healthcare',
    color: Colors.orange,
    url: 'https://www.apollohospitals.com/',
  ),
  Category(
    iconData: Icons.directions_walk,
    title: 'Exercise',
    color: Colors.teal,
    url: 'https://www.healthline.com/health/everyday-fitness/senior-workouts',
  ),
  Category(
    iconData: Icons.phone,
    title: 'Emergency Contacts',
    color: Colors.blue,
    url: '',
  ),
  Category(
    iconData: Icons.accessibility,
    title: 'Assistive Devices',
    color: Colors.green,
    url: '',
  ),
];
