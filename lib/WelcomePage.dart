import 'package:flutter/material.dart';
import 'package:indicator_screen/helper/ColorSys.dart';
import 'package:indicator_screen/helper/Strings.dart';
import 'makePage.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20, top: 20,),
            child: Text(
              'Skip',
              style: TextStyle(
                color: ColorSys.primary,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          PageView(
            onPageChanged: (int page){
              setState(() {
                currentIndex=page;
              });
            },
            controller: _pageController,
            children: <Widget>[
              MakePage().setContent(
                name: Strings.stepOneTitle,
                content: Strings.stepOneContent,
                image: 'assets/images/step-one.png',
              ),
              MakePage().setContent(
                name: Strings.stepTwoTitle,
                content: Strings.stepTwoContent,
                image: 'assets/images/step-two.png',
                reverse: true,
              ),
              MakePage().setContent(
                name: Strings.stepThreeTitle,
                content: Strings.stepThreeContent,
                image: 'assets/images/step-three.png',
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: MakePage().buildIndicator(currentIndex: currentIndex),
            ),
          )
        ],
      ),
    );
  }
}
