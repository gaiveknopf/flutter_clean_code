import 'package:flutter/material.dart';

import 'constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<Color> _colorAnimation;
  Animation<double> _nameAnimation;
  Animation<double> _quoteAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _colorAnimation = ColorTween(
      begin: Colors.black.withOpacity(0.8),
      end: Colors.black.withOpacity(0.92),
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
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/ui/assets/images/splash.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: AnimatedBuilder(
              animation: _colorAnimation,
              builder: (BuildContext context, Widget child) {
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
                  'CHECKLIST DE VEÍCULOS',
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
