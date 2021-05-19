import 'package:brainbinary_structure/model/city_model.dart';
import 'package:brainbinary_structure/screen/city/city_screen.dart';
import 'package:brainbinary_structure/store/city/city_store.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';

class CityViewModel {
  CityScreenState state;

  CityModel cities;

  int selectedCity = -1;
  bool isLoading = false;

  CityStore cityStore = CityStore();
  List<ReactionDisposer> disposers;


  CityViewModel(this.state) {
    isLoading = true;
    cityStore.getCity(state.widget.country);
  }

  countryItemClick(int index) async {
    selectedCity = index;
    state.setState(() {

    });
  }

  continueClick(int data) async {
    if (data == -1) {
      Get.snackbar(
        "Error",
        "Please select city",
      );
    } else {
      Get.snackbar(
        "Utilization",
        "Coming soon",
      );
    }
  }
}
