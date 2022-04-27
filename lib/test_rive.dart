// /// Demonstrates playing a one-shot animation on demand

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class PlayOneShotAnimation extends StatefulWidget {
  const PlayOneShotAnimation({
    required this.dimensions,
    Key? key,
  }) : super(key: key);

  final double dimensions;

  @override
  _PlayOneShotAnimationState createState() => _PlayOneShotAnimationState();
}

class _PlayOneShotAnimationState extends State<PlayOneShotAnimation> {
  late RiveAnimationController _controller;
  late final int megaMenuDurationIntervalInSeconds;
  bool _isPlaying = false;
  Timer? _timer;

  void _runAnimation() => _isPlaying ? null : _controller.isActive = true;

  @override
  void initState() {
    super.initState();
    megaMenuDurationIntervalInSeconds = 60;
    _controller = OneShotAnimation(
      'borderPulse',
      autoplay: false,
      onStop: () => setState(() => _isPlaying = false),
      onStart: () => setState(() => _isPlaying = true),
    );
    _timer = Timer.periodic(const Duration(seconds: 60), (Timer t) => _runAnimation());
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.dimensions,
      height: widget.dimensions,
      child: //Text('hi'),
          RiveAnimation.asset(
        'assets/vehicles.riv',
        onInit: (_) => setState(() {}),
        animations: const ['borderPulse'],
        fit: BoxFit.contain,
        controllers: [_controller],
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }
}
