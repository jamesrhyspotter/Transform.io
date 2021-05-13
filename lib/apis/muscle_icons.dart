

class MuscleIcons {

  var muscleImagePaths = {
    'anteriorChain':'lib/assets/prometheus_white_orange/full_body_white.png',
    'posteriorChain':'lib/assets/prometheus_white_orange/full_body_posterior_white.png',
    'chest': 'lib/assets/prometheus_white_orange/chest.png',
    'front delts':  'lib/assets/prometheus_white_orange/front_delts.png',
    'side delts':  'lib/assets/prometheus_white_orange/side_delts.png',
    'abs' :   'lib/assets/prometheus_white_orange/abs.png',
    'obliques' : 'lib/assets/prometheus_white_orange/obliques.png',
    'quads': 'lib/assets/prometheus_white_orange/quads.png',
    'biceps':   'lib/assets/prometheus_white_orange/biceps.png',
    'forearms' : 'lib/assets/prometheus_white_orange/forearms.png',
    'traps': 'lib/assets/prometheus_white_orange/traps.png',
    'lats':  'lib/assets/prometheus_white_orange/lats.png',
    'rear delts and rhomboids': 'lib/assets/prometheus_white_orange/reardeltsandrhomboids.png',
    'triceps':     'lib/assets/prometheus_white_orange/triceps.png',
    'lower back': 'lib/assets/prometheus_white_orange/lower_back.png',
    'glutes' :     'lib/assets/prometheus_white_orange/glutes.png',
    'hamstrings':   'lib/assets/prometheus_white_orange/hamstrings.png',
    'calves':     'lib/assets/prometheus_white_orange/calves.png',
  };


  String getImagePath(String muscle){
    if(muscleImagePaths.containsKey(muscle)){
      return muscleImagePaths[muscle];
    }
  }


}