import 'package:brainbinary_structure/model/country_model.dart';
import 'package:rxdart/rxdart.dart';

class RxCountry {

  BehaviorSubject<String> selectedCountry = BehaviorSubject<String>();
  BehaviorSubject<bool> isLoading = BehaviorSubject<bool>();
  BehaviorSubject<CountryModel> country = BehaviorSubject<CountryModel>();

  void updateCountry(String data) {
    selectedCountry.sink.add(data);
  }
  void updateCounties(CountryModel data) {
    country.sink.add(data);
  }
  void updateLoader(bool data) {
    isLoading.sink.add(data);
  }

  RxCountry(){
    updateCountry("");
    updateLoader(false);
  }
}

final rxCountry = RxCountry();
