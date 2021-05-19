import 'package:brainbinary_structure/store/country/country_store.dart';
import 'package:get/get.dart';
import 'package:brainbinary_structure/rx/rx_country.dart';
import 'package:brainbinary_structure/screen/city/city_screen.dart';
import 'package:brainbinary_structure/screen/country/country_screen.dart';
import 'package:mobx/mobx.dart';

class CountryViewModel {
  CountryScreenState state;

  CountryStore countryStore = CountryStore();
  List<ReactionDisposer> disposers;

  CountryViewModel(this.state) {
    rxCountry.updateLoader(true);
    countryStore.getCountry();
  }
  
  countryItemClick(String index) async {
    rxCountry.updateCountry(index);
  }
  
  continueClick(String data) async {
    if (data.isEmpty) {
      Get.snackbar(
        "Error",
        "Please select country",
      );
    } else {
      Get.to(()=> CityScreen(data));
    }
  }
}
