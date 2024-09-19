import 'package:flutter/material.dart';

import 'farmers_form_ui.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        useMaterial3: false,
      ),
      debugShowCheckedModeBanner: false,
      home: FarmersForm(),
    ),
  );
}
