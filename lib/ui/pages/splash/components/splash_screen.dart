import 'package:flutter/material.dart';

import 'constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _nameAnimation;
  late Animation<double> _quoteAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _colorAnimation = ColorTween(
      begin: Color.fromRGBO(15, 24, 34, 1).withOpacity(0.7),
      end: Color.fromRGBO(15, 24, 34, 1).withOpacity(0.92),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.1, 0.4, curve: Curves.easeInOut),
      ),
    );

    _nameAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.4, 0.7, curve: Curves.easeIn),
      ),
    );

    _quoteAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.7, 1, curve: Curves.easeIn),
      ),
    );

    _animationController.forward();

    _animationController.addStatusListener((status) async {});
  }

  @override
  void dispose() {
    _animationController.removeStatusListener((_) {});
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: AnimatedBuilder(
              animation: _colorAnimation,
              builder: (BuildContext context, Widget? child) {
                return Container(
                  color: _colorAnimation.value,
                );
              },
            ),
          ),
          Hero(
            tag: 'tourve',
            child: Material(
              type: MaterialType.transparency,
              child: Align(
                child: FadeTransition(
                  opacity: _nameAnimation,
                  child: const Text(
                    'DATABOX',
                    style: kLargeTitle,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: FadeTransition(
                opacity: _quoteAnimation,
                child: const Text(
                  'CHECKLIST DE VE??CULOS',
                  style: kQuoteStyle,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
