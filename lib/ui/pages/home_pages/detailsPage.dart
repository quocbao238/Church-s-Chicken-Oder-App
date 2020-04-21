import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blocs/ui/custom_widget/cacheImage.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../custom_widget/customData.dart';
import '../../custom_widget/showToast.dart';

class DetailsPage extends StatefulWidget {
  final List<Datas> list;
  final int argument;
  DetailsPage({this.argument, this.list});
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int amount = 1;

  @override
  void initState() {
    super.initState();
    widget.list[widget.argument].amount = 1;
  }

  @override
  Widget build(BuildContext context) {
    double getHeight = MediaQuery.of(context).size.height;
    double getWidth = MediaQuery.of(context).size.width;
    double textScaleFactor = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      body: buildPageView(getHeight, getWidth, textScaleFactor),
    );
  }

  Widget buildPageView(
      double getHeight, double getWidth, double textScaleFactor) {
    return Stack(
      children: <Widget>[
        buildImage(getHeight),
        buildDescription(getHeight, getWidth, textScaleFactor),
        buildBackSignIn(getHeight, getWidth),
      ],
    );
  }

  Widget buildBackSignIn(double getHeight, double getWidth) {
    return Positioned(
      top: getWidth * 0.08,
      left: getWidth * 0.02,
      child: IconButton(
          onPressed: () {
            setState(() {
              print("ONTAP");
              Navigator.pop(context);
            });
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.white70, size: 40.0)),
      // ),
    );
  }

  Widget buildDescription(
      double getHeight, double getWidth, double textScaleFactor) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Container(
        padding: EdgeInsets.only(
            left: getWidth * 0.05, right: getWidth * 0.05, top: 0.02),
        height: getHeight * 0.44,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.red[300], Colors.orange[200]]),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: getHeight * 0.02),
              child: AutoSizeText(
                widget.list[widget.argument].name,
                maxLines: 1,
                style: GoogleFonts.abrilFatface(
                  textStyle: TextStyle(
                      color: Colors.black,
                      letterSpacing: 1,
                      fontSize: 24 * textScaleFactor),
                ),
              ),
            ),
            SizedBox(height: getHeight * 0.01),
            Text(
              "Calories: " + widget.list[widget.argument].calories.toString(),
              style: GoogleFonts.textMeOne(
                textStyle: TextStyle(
                    color: Colors.white,
                    letterSpacing: 1.0,
                    fontSize: 18 * textScaleFactor),
              ),
            ),
            SizedBox(height: getHeight * 0.01),
            Container(
              height: getHeight * 0.08,
              child: AutoSizeText(
                widget.list[widget.argument].description,
                maxLines: 4,
                style: GoogleFonts.textMeOne(
                  textStyle: TextStyle(
                      color: Colors.black,
                      letterSpacing: 1.0,
                      fontSize: 16 * textScaleFactor),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: getHeight * 0.02),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (amount < 99) {
                          amount++;
                          widget.list[widget.argument].amount = amount;
                        }
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: getWidth * 0.05),
                      width: getHeight * 0.05,
                      height: getHeight * 0.05,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 1, color: Colors.black),
                        // color: Colors.red,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.add,
                          size: 24 * textScaleFactor,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    widget.list[widget.argument].amount < 10
                        ? "0$amount"
                        : "$amount",
                    style: GoogleFonts.textMeOne(
                      textStyle: TextStyle(
                          color: Colors.black,
                          letterSpacing: 1.0,
                          fontSize: 20 * textScaleFactor),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (amount > 1) {
                          amount--;
                          widget.list[widget.argument].amount = amount;
                        }
                      });
                    },
                    child: Container(
                      width: getHeight * 0.05,
                      margin: EdgeInsets.only(left: getWidth * 0.05),
                      height: getHeight * 0.05,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 1, color: Colors.black),
                        // color: Colors.red,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.remove,
                          size: 24 * textScaleFactor,
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.attach_money,
                    size: 30 * textScaleFactor,
                  ),
                  Text(
                    (widget.list[widget.argument].prince * amount).toString(),
                    style: GoogleFonts.textMeOne(
                      textStyle: TextStyle(
                          color: Colors.black,
                          letterSpacing: 1.0,
                          fontSize: 30 * textScaleFactor),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: getHeight * 0.02),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(
                  Icons.store_mall_directory,
                  size: 24 * textScaleFactor,
                ),
                Text(
                  "Standard: Friday Evening",
                  style: GoogleFonts.arimaMadurai(
                    textStyle: TextStyle(
                        color: Colors.black, fontSize: 13 * textScaleFactor),
                  ),
                ),
                Spacer(),
                Text(
                  "You save 30%",
                  style: GoogleFonts.arimaMadurai(
                    textStyle: TextStyle(
                        color: Colors.white54, fontSize: 13 * textScaleFactor),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                alignment: AlignmentDirectional.bottomCenter,
                margin: EdgeInsets.only(bottom: getHeight * 0.02),
                // color: Colors.red
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        setState(() {
                          widget.list[widget.argument].favorite =
                              !widget.list[widget.argument].favorite;
                        });
                      },
                      child: Container(
                        height: getWidth * 0.16,
                        width: getWidth * 0.16,
                        // color: Colors.red
                        decoration: BoxDecoration(
                            border: Border.all(width: 2, color: Colors.black38),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Icon(
                            widget.list[widget.argument].favorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            size: 30 * textScaleFactor,
                            color: widget.list[widget.argument].favorite
                                ? Colors.red
                                : Colors.black38,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (widget.list[widget.argument].amount != null) {
                            cartList.add(widget.list[widget.argument]);
                            // amount = 0;
                            // widget.list[widget.argument].amount = amount;
                            showToast(
                                msg: "Đã thêm thành công", context: context);
                          } else {
                            showToast(
                                msg: "Đã thêm thất cmn bại", context: context);
                          }
                        });
                      },
                      child: Container(
                        height: getWidth * 0.16,
                        width: getWidth * 0.7,
                        decoration: BoxDecoration(
                            color: Colors.black38,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            "Add to Cart".toUpperCase(),
                            style: GoogleFonts.arimaMadurai(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30 * textScaleFactor),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildImage(double getHeight) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        height: getHeight * 0.6,
        child: CacheNetworkImage(
          imageUrl: widget.list[widget.argument].image,
        ),
      ),
    );
  }
}
