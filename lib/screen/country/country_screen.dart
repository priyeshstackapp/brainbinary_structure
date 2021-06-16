import 'package:brainbinary_structure/screen/country/country_view_model.dart';
import 'package:brainbinary_structure/screen/country/widget/country_list_item.dart';
import 'package:brainbinary_structure/utils/app.dart';
import 'package:brainbinary_structure/utils/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CountryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CountryViewModel>.reactive(
      onModelReady: (model) async {
        model.init();
      },
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(AppRes.country),
          ),
          body: model.isBusy
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : model.countryModel == null
                  ? Center(
                      child: Text("API ISSUE"),
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
          bottomNavigationBar: model.isBusy
              ? null
              : BottomBar(
                  onContinue: () => model.continueClick(model.selectedCountry),
                  onBack: () => model.init(),
                ),
        );
      },
      viewModelBuilder: () => CountryViewModel(),
    );
  }
}
