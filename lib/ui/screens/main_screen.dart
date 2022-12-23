import 'package:animation_demo/ui/screens/test_area_screen.dart';
import 'package:animation_demo/ui/widgets/custom_popup_circles.dart';
import 'package:animation_demo/ui/widgets/custom_elevation.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_chip.dart';
import '../widgets/custom_digit_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final AnimationController backgroundAnimationController;
  late final AnimationController customClipAnimationController;
  late final AnimationController digitsContainerAnimationController;
  late final AnimationController erasingDotsAnimarionController;

  static const Duration backgroundAnimDuration = Duration(seconds: 4);
  static const Duration clipAnimDuration = Duration(milliseconds: 1200);
  static const Duration digitAnimDuration = Duration(milliseconds: 1200);
  static const Duration bottomDotsDuration = Duration(seconds: 4);
  final List<Widget> groupOfSimilarWidgets = [];
  int clickCounter = 0;

  @override
  void initState() {
    super.initState();
    backgroundAnimationController =
        AnimationController(vsync: this, duration: backgroundAnimDuration);
    customClipAnimationController =
        AnimationController(vsync: this, duration: clipAnimDuration);
    digitsContainerAnimationController =
        AnimationController(vsync: this, duration: digitAnimDuration);
    erasingDotsAnimarionController =
        AnimationController(vsync: this, duration: bottomDotsDuration);

    for (int i = 0; i <= 4; i++) {
      groupOfSimilarWidgets.add(CustomChip(
          backgroundColor: Colors.green,
          isLocked: (i < 2) ? false : true,
          controller: customClipAnimationController));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConstrainedBox(
        constraints: const BoxConstraints.expand(
            width: double.infinity, height: double.infinity),
        child: ColoredBox(
          color: Colors.blue[900]!,
          child: Center(
            child: GestureDetector(
              onTap: () => {
                setState(
                  () {
                    switch (clickCounter) {
                      case 0:
                        backgroundAnimationController.repeat();
                        clickCounter++;
                        break;
                      case 1:
                        customClipAnimationController.forward();
                        erasingDotsAnimarionController.forward();
                        digitsContainerAnimationController.forward();
                        clickCounter++;
                        break;
                      case 2:
                        customClipAnimationController.reset();
                        backgroundAnimationController.reset();
                        erasingDotsAnimarionController.reset();
                        digitsContainerAnimationController.reset();
                        clickCounter = 0;
                        break;
                    }
                  },
                )
              },
              child: BackgroundElevation(
                animationController: backgroundAnimationController,
                childWidget: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    height: 500,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 10, 18, 80),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const HeaderWidget(),
                          BodyWidget(
                              digitsContainerAnimationController:
                                  digitsContainerAnimationController),
                          FooterWidget(
                              groupOfSimilarWidgets: groupOfSimilarWidgets,
                              erasingDotsAnimarionController:
                                  erasingDotsAnimarionController),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 58,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MaterialButton(
                color: Colors.red,
                onPressed: () => {
                      clickCounter = 0,
                      digitsContainerAnimationController.reset(),
                      backgroundAnimationController.reset(),
                      customClipAnimationController.reset(),
                      erasingDotsAnimarionController.reset()
                    },
                child: const Text('Terminate All')),
            MaterialButton(
                color: Colors.red,
                onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TestAreaScreen()))
                    },
                child: const Text('GOTO Screen2')),
            MaterialButton(
                enableFeedback: true,
                color: Colors.red,
                onPressed: () => {digitsContainerAnimationController.forward()},
                child: const Text('Manual Start')),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    erasingDotsAnimarionController.dispose();
    backgroundAnimationController.dispose();
    customClipAnimationController.dispose();
    digitsContainerAnimationController.dispose();
    super.dispose();
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red[900]!,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8.0),
            topRight: Radius.circular(8.0),
          ),
        ),
        child: const Padding(padding: EdgeInsets.all(8), child: Placeholder()),
      ),
    );
  }
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({
    Key? key,
    required this.digitsContainerAnimationController,
  }) : super(key: key);

  final AnimationController digitsContainerAnimationController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(8),
        width: double.infinity,
        color: Colors.red[600],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text(
                      'Team Name',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(width: 100),
                    CustomDigitContainer(
                        controller: digitsContainerAnimationController),
                  ],
                ),
                const Text(
                  'Final',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w800),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text(
                      'Team Name',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(width: 100),
                    CustomDigitContainer(
                        controller: digitsContainerAnimationController),
                  ],
                ),
                const Text(
                  '6:45',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black87,
                      fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FooterWidget extends StatelessWidget {
  const FooterWidget({
    Key? key,
    required this.groupOfSimilarWidgets,
    required this.erasingDotsAnimarionController,
  }) : super(key: key);

  final List<Widget> groupOfSimilarWidgets;
  final AnimationController erasingDotsAnimarionController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.red[300]!,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(8.0),
              bottomRight: Radius.circular(8.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: groupOfSimilarWidgets),
                const Text(
                  "Scoring: Total Points Scored",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
                const Divider(color: Colors.white),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Winning Boxes',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w800),
                    ),
                    CustomPopupCircles(
                        controller: erasingDotsAnimarionController)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
