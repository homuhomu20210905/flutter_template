import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/infra/repository/database.dart';
import 'package:flutter_template/infra/states/my_app.dart';
import 'package:flutter_template/page/sample/index.dart';

import 'sample/form.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${count}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            OutlinedButton(
                onPressed: () {
                  var db =
                      MyDatabase.getInstance(); //This should be a singleton
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DriftDbViewer(db)));
                },
                child: Text("ほげ")),
            OutlinedButton(
                onPressed: () {
                  var sampleForm = SampleForm(id: "1", name: "hoge", age: 20);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SampleWidget(form: sampleForm)));
                },
                child: Text("ほげ"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _testDrift,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _testDrift() async {
    final database = MyDatabase.getInstance();
    await database.into(database.categories).insert(CategoriesCompanion.insert(
        description: 'my first category', updatedAt: DateTime.now()));
    final allCategories = await database.select(database.categories).get();

    print('Categories in database: $allCategories');
  }
}
