import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _titleSizeAnimation;
  late Animation _titleFadeInAnimation;
  late Animation _profileIconAnimation;
  late Animation _buyCounterAnimation;
  late Animation _rentCounterAnimation;
  late Animation _counterScaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _titleSizeAnimation = Tween<double>(begin: 0, end: 200).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0, 0.5, curve: Curves.easeIn),
      ),
    );
    _titleFadeInAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.4, 1, curve: Curves.easeIn),
      ),
    );
    _profileIconAnimation = Tween<double>(begin: 0, end: 1.3).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );
    _counterScaleAnimation = Tween<double>(begin: 0.1, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0, 1, curve: Curves.easeIn),
      ),
    );
    _buyCounterAnimation = Tween<double>(begin: 1, end: 1700).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.4, 1, curve: Curves.easeIn),
      ),
    );
    _rentCounterAnimation = Tween<double>(begin: 1, end: 2200).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.4, 1, curve: Curves.easeIn),
      ),
    );
    Future.delayed(
      const Duration(milliseconds: 200),
      () => _animationController.forward(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 248, 248, 248),
                Color.fromARGB(255, 253, 253, 253),
                Color.fromARGB(255, 250, 215, 175)
              ],
              stops: [0.1, 0.3, 0.9],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedBuilder(
                        animation: Listenable.merge(
                            [_titleSizeAnimation, _titleFadeInAnimation]),
                        builder: (context, child) => Container(
                          height: 40,
                          alignment: Alignment.center,
                          width: _titleSizeAnimation.value,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Opacity(
                            opacity: _titleFadeInAnimation.value,
                            child: Text(
                              'Saint Petersburg',
                              style: GoogleFonts.spaceMono(
                                  color: const Color.fromARGB(
                                    255,
                                    60,
                                    59,
                                    56,
                                  ),
                                  fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      AnimatedBuilder(
                        animation: _profileIconAnimation,
                        builder: (context, child) => Transform.scale(
                          scale: _profileIconAnimation.value,
                          child: Image.asset(
                            'assets/images/profile.webp',
                            height: 35,
                            width: 35,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: AnimatedBuilder(
                    animation: _titleFadeInAnimation,
                    builder: (context, child) => Opacity(
                      opacity: _titleFadeInAnimation.value,
                      child: child,
                    ),
                    child: RichText(
                      text: TextSpan(
                        text: 'Hi, Marina\n',
                        style: GoogleFonts.spaceMono(
                          color: const Color.fromARGB(255, 176, 162, 142),
                          fontSize: 16,
                        ),
                        children: [
                          TextSpan(
                            text: 'let\'s select your\nperfect place',
                            style: GoogleFonts.spaceMono(
                              color: const Color.fromARGB(255, 53, 52, 49),
                              fontSize: 23,
                              height: 1.3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedBuilder(
                        animation: Listenable.merge(
                            [_buyCounterAnimation, _counterScaleAnimation]),
                        builder: (context, child) => Transform.scale(
                          scale: _counterScaleAnimation.value,
                          child: Container(
                            width: 170,
                            height: 170,
                            padding: const EdgeInsets.symmetric(
                              vertical: 15,
                            ),
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 252, 158, 18),
                              shape: BoxShape.circle,
                            ),
                            child: Column(
                              children: [
                                Text(
                                  'Buy',
                                  style: GoogleFonts.spaceMono(
                                    color: Colors.white,
                                    fontSize: 16,
                                    height: 1,
                                  ),
                                ),
                                const Spacer(),
                                FittedBox(
                                  child: Text(
                                    NumberFormat('##').format(
                                      _buyCounterAnimation.value,
                                    ),
                                    maxLines: 1,
                                    style: GoogleFonts.spaceMono(
                                      color: Colors.white,
                                      fontSize: 22,
                                      height: 1,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'offers',
                                  style: GoogleFonts.spaceMono(
                                    color: Colors.white,
                                    fontSize: 14,
                                    height: 1,
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      AnimatedBuilder(
                        animation: Listenable.merge(
                            [_rentCounterAnimation, _counterScaleAnimation]),
                        builder: (context, child) => Transform.scale(
                          scale: _counterScaleAnimation.value,
                          child: Container(
                            width: 170,
                            height: 170,
                            padding: const EdgeInsets.symmetric(
                              vertical: 15,
                            ),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  'Rent',
                                  style: GoogleFonts.spaceMono(
                                    color: const Color.fromARGB(
                                        255, 165, 149, 126),
                                    fontSize: 16,
                                    height: 1,
                                  ),
                                ),
                                const Spacer(),
                                FittedBox(
                                  child: Text(
                                    NumberFormat('##').format(
                                      _rentCounterAnimation.value,
                                    ),
                                    maxLines: 1,
                                    style: GoogleFonts.spaceMono(
                                      color: const Color.fromARGB(
                                          255, 165, 149, 126),
                                      fontSize: 22,
                                      height: 1,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'offers',
                                  style: GoogleFonts.spaceMono(
                                    color: const Color.fromARGB(
                                        255, 165, 149, 126),
                                    fontSize: 14,
                                    height: 1,
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  child: ListView(
                    primary: false,
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    children: [
                      SizedBox(
                        height: 200,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                              child: Image.network(
                                'https://c8.alamy.com/comp/2C5T4A2/kitchen-background-interior-style-scandinavian-with-glass-jars-and-kitchen-stove-2C5T4A2.jpg',
                                width: MediaQuery.sizeOf(context).width,
                                height: 200,
                                fit: BoxFit.cover,
                                loadingBuilder:
                                    (context, child, loadingProgress) =>
                                        Container(
                                  color: loadingProgress?.expectedTotalBytes !=
                                          loadingProgress?.cumulativeBytesLoaded
                                      ? Colors.grey
                                      : Colors.white,
                                  child: child,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 12.0,
                                    sigmaY: 12.0,
                                  ),
                                  child: Builder(builder: (context) {
                                    final animation = Tween<double>(
                                      begin: 65,
                                      end:
                                          MediaQuery.sizeOf(context).width - 60,
                                    ).animate(
                                      CurvedAnimation(
                                          parent: _animationController,
                                          curve: Curves.easeIn),
                                    );
                                    return AnimatedBuilder(
                                      animation: animation,
                                      builder: (context, child) => Container(
                                        height: 50,
                                        padding: const EdgeInsets.only(
                                          left: 20,
                                          right: 5,
                                        ),
                                        width: animation.value,
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            if (animation.value ==
                                                MediaQuery.sizeOf(context)
                                                        .width -
                                                    60)
                                              AnimatedBuilder(
                                                animation:
                                                    _titleFadeInAnimation,
                                                builder: (context, child) =>
                                                    Opacity(
                                                  opacity: _titleFadeInAnimation
                                                      .value,
                                                  child: Text(
                                                    'Sec - 24',
                                                    maxLines: 1,
                                                    style:
                                                        GoogleFonts.spaceMono(
                                                      color: Colors.white,
                                                      fontSize: 17,
                                                      height: 1,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            const Spacer(),
                                            Container(
                                              width: 35,
                                              height: 35,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.white,
                                              ),
                                              child: const Icon(
                                                  Icons.arrow_right_outlined),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          Builder(builder: (context) {
                            final sizeAnimation = Tween<double>(
                              begin: 55,
                              end: (MediaQuery.sizeOf(context).width / 2) - 50,
                            ).animate(
                              CurvedAnimation(
                                  parent: _animationController,
                                  curve: Curves.easeIn),
                            );
                            return SizedBox(
                              height: 200,
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      20,
                                    ),
                                    child: Image.network(
                                      'https://c8.alamy.com/comp/2C5T4A2/kitchen-background-interior-style-scandinavian-with-glass-jars-and-kitchen-stove-2C5T4A2.jpg',
                                      width: (MediaQuery.sizeOf(context).width /
                                              2) -
                                          30,
                                      height: 200,
                                      fit: BoxFit.cover,
                                      loadingBuilder:
                                          (context, child, loadingProgress) =>
                                              Container(
                                        color: loadingProgress
                                                    ?.expectedTotalBytes !=
                                                loadingProgress
                                                    ?.cumulativeBytesLoaded
                                            ? Colors.grey
                                            : Colors.white,
                                        child: child,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 10,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                          sigmaX: 12.0,
                                          sigmaY: 12.0,
                                        ),
                                        child: AnimatedBuilder(
                                          animation: sizeAnimation,
                                          builder: (context, child) =>
                                              Container(
                                            height: 50,
                                            padding: const EdgeInsets.only(
                                              left: 20,
                                              right: 5,
                                            ),
                                            width: sizeAnimation.value,
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                20,
                                              ),
                                            ),
                                            child: Row(
                                              children: [
                                                if (sizeAnimation.value ==
                                                    (MediaQuery.sizeOf(context)
                                                                .width /
                                                            2) -
                                                        50)
                                                  AnimatedBuilder(
                                                    animation:
                                                        _titleFadeInAnimation,
                                                    builder: (context, child) =>
                                                        Opacity(
                                                      opacity:
                                                          _titleFadeInAnimation
                                                              .value,
                                                      child: Text(
                                                        'Sec - 24',
                                                        maxLines: 1,
                                                        style: GoogleFonts
                                                            .spaceMono(
                                                          color: Colors.white,
                                                          fontSize: 12,
                                                          height: 1,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                const Spacer(),
                                                Container(
                                                  width: 35,
                                                  height: 35,
                                                  decoration:
                                                      const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.white,
                                                  ),
                                                  child: const Icon(Icons
                                                      .arrow_right_outlined),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                          const SizedBox(
                            width: 30,
                          ),
                          Builder(builder: (context) {
                            final sizeAnimation = Tween<double>(
                              begin: 55,
                              end: (MediaQuery.sizeOf(context).width / 2) - 50,
                            ).animate(
                              CurvedAnimation(
                                  parent: _animationController,
                                  curve: Curves.easeIn),
                            );
                            return SizedBox(
                              height: 200,
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      20,
                                    ),
                                    child: Image.network(
                                      'https://c8.alamy.com/comp/2C5T4A2/kitchen-background-interior-style-scandinavian-with-glass-jars-and-kitchen-stove-2C5T4A2.jpg',
                                      width: (MediaQuery.sizeOf(context).width /
                                              2) -
                                          30,
                                      height: 200,
                                      fit: BoxFit.cover,
                                      loadingBuilder:
                                          (context, child, loadingProgress) =>
                                              Container(
                                        color: loadingProgress
                                                    ?.expectedTotalBytes !=
                                                loadingProgress
                                                    ?.cumulativeBytesLoaded
                                            ? Colors.grey
                                            : Colors.white,
                                        child: child,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 10,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                          sigmaX: 12.0,
                                          sigmaY: 12.0,
                                        ),
                                        child: AnimatedBuilder(
                                          animation: sizeAnimation,
                                          builder: (context, child) =>
                                              Container(
                                            height: 50,
                                            padding: const EdgeInsets.only(
                                              left: 20,
                                              right: 5,
                                            ),
                                            width: sizeAnimation.value,
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                20,
                                              ),
                                            ),
                                            child: Row(
                                              children: [
                                                if (sizeAnimation.value ==
                                                    (MediaQuery.sizeOf(context)
                                                                .width /
                                                            2) -
                                                        50)
                                                  AnimatedBuilder(
                                                    animation:
                                                        _titleFadeInAnimation,
                                                    builder: (context, child) =>
                                                        Opacity(
                                                      opacity:
                                                          _titleFadeInAnimation
                                                              .value,
                                                      child: Text(
                                                        'Sec - 24',
                                                        maxLines: 1,
                                                        style: GoogleFonts
                                                            .spaceMono(
                                                          color: Colors.white,
                                                          fontSize: 12,
                                                          height: 1,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                const Spacer(),
                                                Container(
                                                  width: 35,
                                                  height: 35,
                                                  decoration:
                                                      const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.white,
                                                  ),
                                                  child: const Icon(Icons
                                                      .arrow_right_outlined),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }
}
