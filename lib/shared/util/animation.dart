import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

extension WidgetAnimationExtension on Widget {
  Widget get am {
    return animate().move().fadeIn(
      duration: 800.ms,
    );
  }

  Widget get amFade {
    return animate()
        .shimmer(
      duration: 2200.ms,
    )
        .fadeIn(
      duration: 800.ms,
    );
  }

  Widget get smShimmer {
    return animate()
        .shimmer(
      duration: 800.ms,
    )
        .fadeIn(
      duration: 800.ms,
    );
  }

  Widget get amShake {
    return animate()
        .shake(
      duration: 800.ms,
    )
        .fadeIn(
      duration: 800.ms,
    );
  }

  Widget get amScale {
    return animate()
        .shimmer(
      duration: 2200.ms,
    )
        .scale(
      duration: 400.ms,
    )
        .fadeIn(
      duration: 400.ms,
    );
  }

  Widget get amShimmer {
    return animate()
        .shimmer(
      duration: 800.ms,
    )
        .fadeIn(
      duration: 800.ms,
    );
  }

  Widget amShimmerIndex(int index) {
    return animate()
        .shimmer(
      delay: (300 + (index * 200)).ms,
      duration: (300 + (index * 200)).ms,
    )
        .move(
      delay: (300 + (index * 200)).ms,
      duration: (300 + (index * 200)).ms,
    )
        .fadeIn(
      delay: (300 + (index * 200)).ms,
      duration: (300 + (index * 200)).ms,
    );
  }

  Widget get amUpDown {
    return animate()
        .shimmer(
      duration: 800.ms,
    )
        .fadeIn()
        .moveY(
      begin: -10,
      duration: 800.ms,
    );
  }

  Widget get amDownUp {
    return animate()
        .shimmer(
      duration: 800.ms,
    )
        .fadeIn()
        .moveY(
      begin: 10,
      duration: 800.ms,
    );
  }

  Widget get shimmer {
    return animate(
      onPlay: (controller) => controller.repeat(),
    ).shimmer(
      duration: 1500.ms,
    );
  }
}
