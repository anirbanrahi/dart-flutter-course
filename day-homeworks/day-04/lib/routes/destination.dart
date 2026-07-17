import 'package:flutter/material.dart';

class Destination {
  const Destination({required this.label, required this.icon});
  final String label;
  final IconData icon;
}

const destinations = [
  Destination(label: "হোম", icon: Icons.home_outlined),
  Destination(label: "সংরক্ষিত তথ্য", icon: Icons.dataset_outlined),
  Destination(label: "প্রোফাইল", icon: Icons.account_circle_outlined),
];
