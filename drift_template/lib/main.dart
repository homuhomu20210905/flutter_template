import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/page/my_app/index.dart';

import 'page/my_app/form.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(form: MyAppForm(id: '1')),
    ),
  );
}
