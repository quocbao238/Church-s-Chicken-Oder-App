import 'package:cache_image/cache_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blocs/blocs/combo_bloc/combo_bloc.dart';
import 'package:flutter_blocs/ui/custom_widget/customConfig.dart';
import 'package:flutter_blocs/ui/custom_widget/customData.dart';
import 'package:flutter_blocs/ui/custom_widget/showToast.dart';
import 'package:flutter_blocs/ui/pages/home_pages/comboDetails.dart';
import 'package:google_fonts/google_fonts.dart';

class ComboPage extends StatefulWidget {
  @override
  _ComboPageState createState() => _ComboPageState();
}

class _ComboPageState extends State<ComboPage> {
  GlobalKey globalyComboKey = GlobalKey();
  ScrollController _controller;
  /* Tab Contries Funtion */
  int currentSelect = 0;
  void _onPress(int num) {
    BlocProvider.of<ComboBloc>(globalyComboKey.currentContext)
        .add(SelectContriesEvent(index: num));
  }

  @override
  Widget build(BuildContext context) {
    double getHeight = MediaQuery.of(context).size.height;
    double getWidth = MediaQuery.of(context).size.width;
    double textScaleFactor = MediaQuery.of(context).textScaleFactor;
    return BlocProvider(
      create: (context) => ComboBloc(),
      child: BlocListener<ComboBloc, ComboState>(
        listener: (context, state) {
          if (state is SelectContriesState) {
            currentSelect = state.index;
          } else if (state is FavoriteState) {
            combos[state.index].favorite = !combos[state.index].favorite;
          } else if (state is GotoDetailPageState) {
            Navigator.of(context)
                .push(new MaterialPageRoute(builder: (context) {
              return ComboDetailsPage(
                argument: state.index,
              );
            }));
          }
        },
        child: BlocBuilder<ComboBloc, ComboState>(
            builder: (context, state) =>
                buildPageView(getHeight, getWidth, textScaleFactor)),
      ),
    );
  }

  Scaffold buildPageView(
      double getHeight, double getWidth, double textScaleFactor) {
    return Scaffold(
      key: globalyComboKey,
      body: Container(
          margin: EdgeInsets.only(
            top: getHeight * 0.12,
            bottom: getHeight * 0.1,
            left: getWidth * 0.03,
          ),
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  nameChurh,
                  textAlign: TextAlign.left,
                  style: GoogleFonts.abrilFatface(
                    textStyle: TextStyle(
                        color: Colors.black,
                        letterSpacing: 2.0,
                        fontSize: 26 * textScaleFactor),
                  ),
                ),
                SizedBox(height: getHeight * 0.02),
                Container(
                  height: getHeight * 0.05,
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15.0),
                                bottomRight: Radius.circular(15.0),
                                topRight: Radius.circular(3),
                                bottomLeft: Radius.circular(3)),
                            color: containerCombo),
                        child: Center(
                          child: Icon(
                            Icons.compare_arrows,
                            size: 30.0 * textScaleFactor,
                            color: iconComboColor,
                          ),
                        ),
                      ),
                      SizedBox(width: getWidth * 0.02),
                      Container(
                        height: getHeight * 0.05,
                        width: getWidth * 0.72,
                        child: ListView.builder(
                          controller: _controller,
                          scrollDirection: Axis.horizontal,
                          itemCount: countries?.length ?? 0,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: getWidth * 0.02),
                                margin: EdgeInsets.only(right: getWidth * 0.02),
                                height: getHeight * 0.05,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15.0),
                                        bottomRight: Radius.circular(15.0),
                                        topRight: Radius.circular(3),
                                        bottomLeft: Radius.circular(3)),
                                    color: index == currentSelect
                                        ? containerCombo
                                        : null),
                                child: Center(
                                  child: Text(
                                    countries[index] ?? "",
                                    style: GoogleFonts.abrilFatface(
                                      textStyle: TextStyle(
                                          color: index == currentSelect
                                              ? iconComboColor
                                              : Colors.black,
                                          letterSpacing: 1.0,
                                          fontSize: 12 * textScaleFactor),
                                    ),
                                  ),
                                ),
                              ),
                              onTap: () {
                                _onPress(index);
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: getHeight * 0.03),
                  child: Text(
                    "The best dishes",
                    style: GoogleFonts.robotoCondensed(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1.0,
                        fontSize: 24 * textScaleFactor,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: getHeight * 0.50,
                  width: getWidth * 0.99,
                  margin: EdgeInsets.only(left: getHeight * 0.01),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: combos?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        child: Container(
                          width: getWidth * 0.70,
                          height: getHeight * 0.5,
                          margin: EdgeInsets.only(right: getWidth * 0.08),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40),
                              bottomLeft: Radius.circular(40),
                              topLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                            ),
                            image: DecorationImage(
                                image: CacheImage(combos[index].image),
                                fit: BoxFit.fill),
                          ),
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                bottom: getHeight * 0,
                                left: getWidth * 0,
                                child: GestureDetector(
                                  onTap: () {
                                    BlocProvider.of<ComboBloc>(
                                            globalyComboKey.currentContext)
                                        .add(FavoriteEvent(index: index));
                                  },
                                  child: Container(
                                    width: getWidth * 0.15,
                                    height: getWidth * 0.15,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(30),
                                          bottomLeft: Radius.circular(30)),
                                      color: Colors.grey[300],
                                    ),
                                    child: Center(
                                      child: Icon(
                                        combos[index]?.favorite ?? false
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: combos[index]?.favorite ?? false
                                            ? Colors.red
                                            : Colors.black,
                                        size: 24.0 * textScaleFactor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: getHeight * 0.02,
                                right: getWidth * 0,
                                child: Container(
                                  width: getWidth * 0.38,
                                  height: getWidth * 0.4,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "\$ ${combos[index].prince.toString()}0",
                                        textAlign: TextAlign.left,
                                        style: GoogleFonts.abrilFatface(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              letterSpacing: 1.5,
                                              fontSize: 30 * textScaleFactor),
                                        ),
                                      ),
                                      Text(
                                        combos[index].name,
                                        textAlign: TextAlign.left,
                                        style: GoogleFonts.abrilFatface(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15 * textScaleFactor),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          BlocProvider.of<ComboBloc>(
                                  globalyComboKey.currentContext)
                              .add(GotoDetailPageEvent(index: index));
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          )),
    );
  }
}
