import 'package:brainbinary_structure/utils/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:brainbinary_structure/utils/color_res.dart';
import 'package:brainbinary_structure/utils/styles.dart';

class BottomBar extends StatelessWidget {
  final VoidCallback onBack;
  final VoidCallback onContinue;

  BottomBar({this.onBack, @required this.onContinue});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: MediaQuery.of(context).size.width,
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: InkWell(
              onTap: onBack ?? () => Get.back(),
              child: Container(
                color: ColorRes.red,
                alignment: Alignment.center,
                child: Container(
                  child: Text(
                    AppRes.back,
                    style: AppTextStyle(),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: onContinue,
              child: Container(
                color: ColorRes.green,
                alignment: Alignment.center,
                child: Container(
                  child: Text(
                    AppRes.continueT,
                    style: AppTextStyle(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GreenButton extends StatelessWidget {

  final String title;
  final VoidCallback onTap;
  final double width;
  final double height;

  GreenButton({@required this.title, @required this.onTap, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width ?? MediaQuery.of(context).size.width / 2.3,
        height: height ?? 50,
        color: ColorRes.green,
        alignment: Alignment.center,
        child: Container(
          child: Text(
            title,
            style: AppTextStyle(),
          ),
        ),
      ),
    );
  }
}

