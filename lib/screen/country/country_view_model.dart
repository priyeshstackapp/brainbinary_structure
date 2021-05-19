import 'package:brainbinary_structure/model/country_model.dart';
import 'package:brainbinary_structure/screen/city/city_screen.dart';
import 'package:brainbinary_structure/screen/country/country_screen.dart';
import 'package:brainbinary_structure/store/country/country_store.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';

class CountryViewModel {
  CountryScreenState state;

  CountryModel countryModel = CountryModel();

  int selectedCountry = -1;
  bool isLoading = false;

  CountryStore countryStore = CountryStore();
  List<ReactionDisposer> disposers;

  CountryViewModel(this.state) {
    isLoading = true;
    countryStore.getCountry();
  }
  
  countryItemClick(int index) async {
    selectedCountry = index;
    state.setState(() {

    });
  }
  
  continueClick(int data) async {
    if (data == -1) {
      Get.snackbar(
        "Error",
          "Please select country",
          );
    } else {
      Get.to(()=> CityScreen(countryModel.data[data].country));
    }
  }
}
