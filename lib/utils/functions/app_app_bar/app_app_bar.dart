import 'package:flutter/material.dart';

AppBar appAppBar({
  String? title,
  String? description,
  required bool isExpanded,
}){
  return AppBar(
    title: Text('My App'),
    toolbarHeight: isExpanded ? 200 : 100,
    flexibleSpace: FlexibleSpaceBar(
      background: Image.network(
        'https://example.com/image.jpg',
        fit: BoxFit.cover,
      ),
    ),
  );
}
