import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class OnboardPage extends StatelessWidget {
  final String pageText;
  final Color pageColor;
  final String pageSubTitle;
  final String imagePath;

  OnboardPage({
    this.pageText,
    this.pageColor,
    this.pageSubTitle,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: pageColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  imagePath,
                ),
              ),
            ),
          ),
          SizedBox(height: 60),
          Text(
            pageText,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple),
          ),
          SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              pageSubTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
