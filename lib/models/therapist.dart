import 'package:flutter/material.dart';

class Therapist {
  final String name;
  final String imageUrl;
  final String title;
  final String details;
  final String email;
  final String phone;
  final List<String> specialities;

  Therapist({
    required this.name,
    required this.imageUrl,
    required this.specialities,
    required this.title,
    required this.details,
    required this.email,
    required this.phone,
  });
}
