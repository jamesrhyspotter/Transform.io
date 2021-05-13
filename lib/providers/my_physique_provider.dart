

import 'package:flutter/material.dart';

class MyPhysiqueProvider extends ChangeNotifier {

  List<String> imagePaths = [
    'lib/assets/prometheus_white_orange/full_body_white.png',
    'lib/assets/prometheus_white_orange/full_body_posterior_white.png',
    // 'lib/assets/muscle_images/anterior_chain_white.png',
    // 'lib/assets/muscle_images/posterior_chain_white.png',
    'lib/assets/prometheus_white_orange/chest.png',
    'lib/assets/prometheus_white_orange/front_delts.png',
    'lib/assets/prometheus_white_orange/side_delts.png',
    'lib/assets/prometheus_white_orange/abs.png',
    'lib/assets/prometheus_white_orange/obliques.png',
    'lib/assets/prometheus_white_orange/quads.png',
    'lib/assets/prometheus_white_orange/biceps.png',
    'lib/assets/prometheus_white_orange/forearms.png',
    'lib/assets/prometheus_white_orange/traps.png',
    'lib/assets/prometheus_white_orange/lats.png',
    'lib/assets/prometheus_white_orange/reardeltsandrhomboids.png',
    'lib/assets/prometheus_white_orange/triceps.png',
    'lib/assets/prometheus_white_orange/lower_back.png',
    'lib/assets/prometheus_white_orange/glutes.png',
    'lib/assets/prometheus_white_orange/hamstrings.png',
    'lib/assets/prometheus_white_orange/calves.png',
    //
  ];

  String _currentImagePath = 'lib/assets/muscle_images/anterior_chain_white.png';

  set currentImagePath(String value) {
    _currentImagePath = value;
    print(_currentImagePath);
    notifyListeners();
  }

  String get currentImagePath => _currentImagePath;
}