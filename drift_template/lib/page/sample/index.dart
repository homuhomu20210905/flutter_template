import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'form.dart';

class SampleWidget extends ConsumerWidget {
  final SampleForm form;
  const SampleWidget({required this.form, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: Text("test"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("id: ${form.id}"),
              Text("name: ${form.name}"),
              Text("age: ${form.age}"),
            ],
          ),
        ));
  }
}
