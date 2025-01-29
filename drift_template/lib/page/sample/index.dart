import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'form.dart';

class SampleWidget extends ConsumerWidget {
  final SampleForm form;
  const SampleWidget({required this.form, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    this.form.age;
    return Column(
      children: [
        Text('ID: ${this.form.id}'),
        Text('Name: ${this.form.name}'),
        Text('Age: ${this.form.age}'),
      ],
    );
  }
}
