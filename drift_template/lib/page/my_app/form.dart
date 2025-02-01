import 'package:freezed_annotation/freezed_annotation.dart';

part 'form.freezed.dart'; // モデルの比較、コピー、不変性の機能を提供するファイル
// part 'form.g.dart'; // JSONのシリアライズ/デシリアライズを提供するファイル

@freezed
class MyAppForm with _$MyAppForm {
  const factory MyAppForm({
    required String id,
  }) = _MyAppForm;
}
