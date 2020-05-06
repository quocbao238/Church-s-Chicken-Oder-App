import 'package:cached_network_image/cached_network_image.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blocs/ui/custom_widget/customConfig.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../repository/user_repository.dart';
import '../login_pages/login_page.dart';

class IntroPage extends StatefulWidget {
  final UserRepository userRepository;
  IntroPage({@required this.userRepository});
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  /* Page Controller */
  PageController _pageController;

  /* Page view Index */
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double getHeight = MediaQuery.of(context).size.height;
    double getWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Slider
          buildSlider(getHeight, getWidth),

          // Indicator
          buildIndicator(getWidth),

          // Appbar
          buildAppbar(getHeight, getWidth)
        ],
      ),
    );
  }

  Container buildSlider(double getHeight, double getWidth) {
    return Container(
      height: getHeight,
      width: getWidth,
      child: PageView(
        scrollDirection: Axis.horizontal,
        controller: _pageController,
        onPageChanged: (int _selectedIndex) {
          selectedIndex = _selectedIndex;
          setState(() {});
        },
        children: <Widget>[
          //Slider 1
          sliderOne(getHeight, getWidth),
          sliderTwo(getHeight, getWidth),
          sliderThree(getHeight, getWidth),
          sliderFour(getHeight, getWidth),
        ],
      ),
    );
  }

  Stack sliderOne(double getHeight, double getWidth) {
    return Stack(
      children: <Widget>[
        // Image Slider
        Container(
          height: getHeight,
          width: getWidth,
          child: Image.asset(
            sliderImage1,
            fit: BoxFit.cover,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: getHeight * 0.35),
              height: getHeight * 0.35,
              width: getWidth,
              // color: Colors.red,
              child: Center(
                child: RotationTransition(
                  turns: AlwaysStoppedAnimation(-2 / 180),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: getHeight * 0.05,
                      ),
                      Container(
                        width: getWidth * 0.80,
                        height: 8.0,
                        color: Colors.white,
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        txtSlider10.toUpperCase(),
                        style: GoogleFonts.abrilFatface(
                            textStyle: TextStyle(
                                color: Colors.white,
                                height: 1,
                                letterSpacing: 0.5,
                                fontSize: 50.0,
                                fontWeight: FontWeight.w600)),
                      ),
                      Text(
                        txtSlider11.toUpperCase(),
                        style: GoogleFonts.abrilFatface(
                          textStyle: TextStyle(
                              color: Colors.white,
                              // height: 1.0,
                              fontSize: 18.0),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Container(
                        width: getWidth * 0.80,
                        height: 8.0,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //Button
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                  return LoginPageParent(
                    userRepository: widget.userRepository,
                  );
                }));
              },
              child: Container(
                width: getWidth * 0.4,
                height: getHeight * 0.1,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.amber, width: 3), borderRadius: BorderRadius.circular(radius / 2)),
                child: Center(
                  child: Text(
                    btnSilder1,
                    style: GoogleFonts.bitter(
                        textStyle: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }

  Stack sliderTwo(double getHeight, double getWidth) {
    return Stack(
      children: <Widget>[
        // Image Slider
        Container(
          height: getHeight,
          width: getWidth,
          child: Image.asset(
            sliderImage2,
            fit: BoxFit.cover,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: getHeight * 0.35),
              height: getHeight * 0.35,
              width: getWidth,
              // color: Colors.red,
              child: Center(
                child: RotationTransition(
                  turns: AlwaysStoppedAnimation(-2 / 180),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: getWidth * 0.80,
                        height: 8.0,
                        color: Colors.white,
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        txtSlider20.toUpperCase(),
                        style: GoogleFonts.abrilFatface(
                            textStyle: TextStyle(
                                color: Colors.white,
                                height: 1,
                                letterSpacing: 0.5,
                                fontSize: 50.0,
                                fontWeight: FontWeight.w600)),
                      ),
                      Text(
                        txtSlider21.toUpperCase(),
                        style: GoogleFonts.abrilFatface(
                          textStyle: TextStyle(color: Colors.white, letterSpacing: 2.0, fontSize: 65.0),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Container(
                        width: getWidth * 0.80,
                        height: 8.0,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //Button
            Container(
              width: getWidth * 0.5,
              height: getHeight * 0.1,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.amber, width: 3), borderRadius: BorderRadius.circular(radius / 2)),
              child: Center(
                child: Text(
                  btnSilder2,
                  style: GoogleFonts.bitter(
                      textStyle: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold)),
                ),
              ),
            )
          ],
        )
      ],
    );
  }

  Stack sliderThree(double getHeight, double getWidth) {
    return Stack(
      children: <Widget>[
        // Image Slider
        Container(
          height: getHeight,
          width: getWidth,
          child: Image.asset(
            sliderImage3,
            fit: BoxFit.cover,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: getHeight * 0.30),
              height: getHeight * 0.35,
              width: getWidth,
              // color: Colors.red,
              child: Center(
                child: RotationTransition(
                  turns: AlwaysStoppedAnimation(-2 / 180),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: getHeight * 0.05,
                      ),
                      Container(
                        width: getWidth * 0.80,
                        height: 8.0,
                        color: Colors.white,
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        txtSlider30.toUpperCase(),
                        style: GoogleFonts.abrilFatface(
                            textStyle: TextStyle(
                                color: Colors.white,
                                height: 1,
                                letterSpacing: 0.5,
                                fontSize: 40.0,
                                fontWeight: FontWeight.w600)),
                      ),
                      Text(
                        txtSlider31.toUpperCase(),
                        style: GoogleFonts.abrilFatface(
                          textStyle: TextStyle(
                              color: Colors.white,
                              // height: 1.0,
                              fontSize: 33.0),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Container(
                        width: getWidth * 0.80,
                        height: 8.0,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //Button
            Container(
              margin: EdgeInsets.only(top: getHeight * 0.05),
              width: getWidth * 0.8,
              height: getHeight * 0.1,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.amber, width: 3), borderRadius: BorderRadius.circular(radius / 2)),
              child: Center(
                child: Text(
                  btnSilder3,
                  style: GoogleFonts.bitter(
                      textStyle: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold)),
                ),
              ),
            )
          ],
        )
      ],
    );
  }

  Stack sliderFour(double getHeight, double getWidth) {
    return Stack(
      children: <Widget>[
        // Image Slider
        Container(
          height: getHeight,
          width: getWidth,
          child: Image.asset(
            sliderImage4,
            fit: BoxFit.cover,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: getHeight * 0.30),
              height: getHeight * 0.35,
              width: getWidth,
              // color: Colors.red,
              child: Center(
                child: RotationTransition(
                  turns: AlwaysStoppedAnimation(-2 / 180),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: getHeight * 0.05,
                      ),
                      Container(
                        width: getWidth * 0.80,
                        height: 8.0,
                        color: Colors.white,
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        txtSlider40.toUpperCase(),
                        style: GoogleFonts.abrilFatface(
                            textStyle: TextStyle(
                                color: Colors.white,
                                height: 1,
                                letterSpacing: 0.5,
                                fontSize: 40.0,
                                fontWeight: FontWeight.w600)),
                      ),
                      Text(
                        txtSlider41.toUpperCase(),
                        style: GoogleFonts.abrilFatface(
                          textStyle: TextStyle(
                              color: Colors.white,
                              // height: 1.0,
                              fontSize: 50.0),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Container(
                        width: getWidth * 0.80,
                        height: 8.0,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //Button
            Container(
              margin: EdgeInsets.only(top: getHeight * 0.05),
              width: getWidth * 0.6,
              height: getHeight * 0.1,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.amber, width: 3), borderRadius: BorderRadius.circular(radius / 2)),
              child: Center(
                child: Text(
                  btnSilder4,
                  style: GoogleFonts.bitter(
                      textStyle: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold)),
                ),
              ),
            )
          ],
        )
      ],
    );
  }

  Positioned buildAppbar(double getHeight, double getWidth) {
    return Positioned(
      top: getHeight * 0.03,
      left: 0,
      right: 0,
      child: Container(
        height: getHeight * 0.15,
        width: getWidth * 0.1,
        // color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RotationTransition(
              turns: AlwaysStoppedAnimation(-3 / 180),
              child: Container(
                padding: EdgeInsets.only(top: padding * 1.5, left: padding * 0),
                width: getWidth * 0.3,
                child: Column(
                  children: <Widget>[
                    Container(
                      width: getWidth * 0.15,
                      height: 4.0,
                      color: Colors.white,
                    ),
                    SizedBox(height: 2.0),
                    Text(
                      "Order".toUpperCase(),
                      style: GoogleFonts.bitter(
                          textStyle: TextStyle(color: Colors.white, fontSize: 14.0, fontWeight: FontWeight.bold)),
                    ),
                    Text(
                      "Now".toUpperCase(),
                      style: GoogleFonts.bitter(
                          textStyle: TextStyle(color: Colors.white, fontSize: 14.0, fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(height: 2.0),
                    Container(
                      width: getWidth * 0.15,
                      height: 4.0,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: getHeight * 0.15,
              child: Image.asset(
                sliderLogoImage,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: getWidth * 0.3,
              padding: EdgeInsets.only(right: padding * 1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: 50.0,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Positioned buildIndicator(double getWidth) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        alignment: AlignmentDirectional.bottomCenter,
        height: 40,
        child: Center(
          child: DotsIndicator(
            dotsCount: 4,
            position: selectedIndex.toDouble(),
            decorator: DotsDecorator(
              size: Size(getWidth * 0.15, 8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              activeColor: Colors.white,
              activeSize: Size(getWidth * 0.15, 8.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
