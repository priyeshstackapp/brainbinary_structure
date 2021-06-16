import 'package:brainbinary_structure/screen/city/city_view_model.dart';
import 'package:brainbinary_structure/screen/city/widget/city_list_item.dart';
import 'package:brainbinary_structure/utils/app.dart';
import 'package:brainbinary_structure/utils/common_widgets.dart';
import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  final String country;

  CityScreen(this.country);

  @override
  CityScreenState createState() => CityScreenState();
}

class CityScreenState extends State<CityScreen> {
  CityViewModel model;

  @override
  void initState() {
    model = CityViewModel(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppRes.city),
      ),
      body: model.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount:
                  model.cities.data.length > 30 ? 30 : model.cities.data.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () => model.countryItemClick(index),
                child: CityListItem(
                  model.cities.data[index].city,
                  model.selectedCity,
                  index,
                ),
              ),
            ),
      bottomNavigationBar: BottomBar(
        onContinue: () => model.continueClick(model.selectedCity),
      ),
    );
  }
}
