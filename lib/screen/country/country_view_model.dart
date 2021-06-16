import 'package:brainbinary_structure/model/country_model.dart';
import 'package:brainbinary_structure/rest_api/country_rest_api.dart';
import 'package:brainbinary_structure/screen/city/city_screen.dart';
import 'package:brainbinary_structure/screen/country/country_screen.dart';
import 'package:get/get.dart';

class CountryViewModel {
  CountryScreenState state;

  CountryModel countryModel;

  int selectedCountry = -1;
  bool isLoading = true;

  CountryViewModel(this.state) {
    getCountry();
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



  void getCountry() async {
    countryModel = await RestApi.getCountry();
    isLoading = false;
    state.setState(() {});
  }
}
