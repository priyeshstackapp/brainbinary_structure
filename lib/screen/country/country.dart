import 'package:brainbinary_structure/screen/country/country_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class Country extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CountryViewModel>.reactive(
      onModelReady: (model) async {
        /// initiates the [UserProfileViewModel] before marking the model isBusy as false
        model.init();
      },
      builder: (context, viewModel, child) => Scaffold(
        body: Center(
          child: Text(viewModel.title),
        ),
      ),
      viewModelBuilder: () => CountryViewModel(),
    );
  }
}
