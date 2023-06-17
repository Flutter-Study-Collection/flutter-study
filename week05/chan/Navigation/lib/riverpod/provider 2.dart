import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'counter.dart';

final counterProvider = StateNotifierProvider<Counter, int>((ref) {
  return Counter();
});