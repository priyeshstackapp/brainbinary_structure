import 'package:brainbinary_structure/utils/color_res.dart';
import 'package:brainbinary_structure/utils/styles.dart';
import 'package:flutter/material.dart';

class CountryListItem extends StatelessWidget {
  final String name;
  final int selectedCountry;
  final int index;

  CountryListItem(this.name, this.selectedCountry, this.index);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        height: 50,
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "$name",
              style: AppTextStyle(
                weight: FontWeight.w500,
                size: 16,
                textColor: ColorRes.black,
              ),
            ),
            selectedCountry == index ? Icon(Icons.check_circle) : SizedBox()
          ],
        ),
      ),
    );
  }
}
