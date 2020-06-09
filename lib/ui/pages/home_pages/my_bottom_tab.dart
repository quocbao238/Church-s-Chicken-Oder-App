import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyBottomTabs extends StatelessWidget {
  final String icon;
  final String text;
  final bool isSelected;
  final Function onPressed;

  MyBottomTabs(this.icon, this.text, this.isSelected, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //icon
            Container(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.height * 0.05,
              child: Image.asset(icon),
            ),
            SizedBox(height: 4.0),
            //text
            Text(
              text,
              style: TextStyle(
                fontSize: 14.0,
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}
