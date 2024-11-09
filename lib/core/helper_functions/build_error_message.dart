 import 'package:flutter/material.dart';

void buildErrorBar(BuildContext context,String errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errorMessage),
      ),
    );
  }