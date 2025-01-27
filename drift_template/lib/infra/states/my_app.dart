import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_app.g.dart';

@riverpod
int Counter(Ref ref) {
  return 1;
}
