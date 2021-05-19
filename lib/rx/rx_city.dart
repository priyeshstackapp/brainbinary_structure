import 'package:brainbinary_structure/model/city_model.dart';
import 'package:rxdart/rxdart.dart';

class RxCity {

  BehaviorSubject<int> selectedCity = BehaviorSubject<int>();
  BehaviorSubject<bool> isLoading = BehaviorSubject<bool>();
  BehaviorSubject<CityModel> cities = BehaviorSubject<CityModel>();

  void updateCity(int data) {
    selectedCity.sink.add(data);
  }
  void updateLoader(bool data) {
    isLoading.sink.add(data);
  }
  void updateCities(CityModel data) {
    cities.sink.add(data);
  }

  RxCity(){
    updateCity(-1);
    updateLoader(false);
  }
}

final rxCity = RxCity();
