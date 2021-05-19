import 'package:brainbinary_structure/screen/country/country_view_model.dart';
import 'package:brainbinary_structure/screen/country/widget/country_list_item.dart';
import 'package:brainbinary_structure/utils/app.dart';
import 'package:brainbinary_structure/utils/color_res.dart';
import 'package:brainbinary_structure/utils/common_widgets.dart';
import 'package:brainbinary_structure/utils/debug.dart';
import 'package:brainbinary_structure/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class CountryScreen extends StatefulWidget {
  @override
  CountryScreenState createState() => CountryScreenState();
}

class CountryScreenState extends State<CountryScreen> {
  CountryViewModel model;

  @override
  void initState() {
    model = CountryViewModel(this);
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
      reaction((_) => model.countryStore.currentStatus,
          (StoreStatus message) async {
        if (message != null && message == StoreStatus.success) {
          model.isLoading = false;
          model.countryModel = model.countryStore.response.result;
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
        title: Text(AppRes.country),
      ),
      body: model.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: model.countryModel.data.length > 30
                  ? 30
                  : model.countryModel.data.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () => model.countryItemClick(index),
                child: CountryListItem(
                  model.countryModel.data[index].country,
                  model.selectedCountry,
                  index,
                ),
              ),
            ),
      bottomNavigationBar: BottomBar(
        onContinue: () => model.continueClick(model.selectedCountry),
        onBack: () {},
      ),
    );
  }
}
