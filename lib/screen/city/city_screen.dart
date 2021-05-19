import 'package:brainbinary_structure/screen/city/city_view_model.dart';
import 'package:brainbinary_structure/screen/city/widget/city_list_item.dart';
import 'package:brainbinary_structure/utils/app.dart';
import 'package:brainbinary_structure/utils/color_res.dart';
import 'package:brainbinary_structure/utils/common_widgets.dart';
import 'package:brainbinary_structure/utils/debug.dart';
import 'package:brainbinary_structure/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

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
  void dispose() {
    model.disposers.forEach((d) => d());
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    model.disposers ??= [
      reaction((_) => model.cityStore.currentStatus,
          (StoreStatus message) async {
        if (message != null && message == StoreStatus.success) {
          model.isLoading = false;
          model.cities = model.cityStore.response.result;
          setState(() {});
        } else if (message != null && message == StoreStatus.failure) {
          model.isLoading = false;
          setState(() {});
          Debug.print(" ><><><><><><><>< CRASH ><><><><><><><>< ");
        }
      }),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("City"),
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
