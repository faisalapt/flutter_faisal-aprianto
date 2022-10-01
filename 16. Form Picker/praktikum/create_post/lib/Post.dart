import 'package:flutter/material.dart';

class Post {
  final String caption;
  final Color color;
  final DateTime date;
  final String file;

  const Post(
      {required this.caption,
      required this.color,
      required this.date,
      required this.file});
}
