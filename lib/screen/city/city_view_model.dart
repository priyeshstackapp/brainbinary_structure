import 'package:brainbinary_structure/store/city/city_store.dart';
import 'package:get/get.dart';
import 'package:brainbinary_structure/rx/rx_city.dart';
import 'package:brainbinary_structure/screen/city/city_screen.dart';
import 'package:mobx/mobx.dart';

class CityViewModel {
  CityScreenState state;

  CityStore cityStore = CityStore();
  List<ReactionDisposer> disposers;

  CityViewModel(this.state) {
    rxCity.updateLoader(true);
    cityStore.getCity(state.widget.country);
  }

  countryItemClick(int index) async {
    rxCity.updateCity(index);
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
