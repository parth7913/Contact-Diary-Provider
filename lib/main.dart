import 'package:contactdiary/Contact.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'DetailPage.dart';

void main() {
  runApp(
    Sizer(
      builder: (context, ori, type) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (context) => Contact(),
            'D': (context) => Detail(),
          },
        );
      },
    ),
  );
}
