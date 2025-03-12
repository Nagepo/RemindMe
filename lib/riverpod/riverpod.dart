import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remind_me/riverpod/riverpod_model.dart';

final remProvider = ChangeNotifierProvider<RiverpodModel>((ref) {
  return RiverpodModel();
});
