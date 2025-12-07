import 'dart:math';

import 'package:movies_app/core/resources/constanst_manager.dart';

int getRandomNumber() {
  final random = Random();
  return random.nextInt(ConstanstManager.Genres.length);
}
