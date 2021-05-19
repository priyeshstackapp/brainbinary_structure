import 'package:brainbinary_structure/model/country_model.dart';
import 'package:brainbinary_structure/rest_api/country_rest_api.dart';
import 'package:brainbinary_structure/utils/app.dart';
import 'package:mobx/mobx.dart';

part 'country_store.g.dart';

class CountryStore = _CountryStore with _$CountryStore;

abstract class _CountryStore with Store {
  void getCountry() {
    getCountryApi();
  }

  @observable
  ObservableFuture<CountryModel> response;

  @action
  Future getCountryApi() async {
    response = ObservableFuture(RestApi.getCountry());
  }

  @computed
  StoreStatus get currentStatus {
    if (response != null) {
      if (response.status == FutureStatus.pending)
        return StoreStatus.loading;
      else if (response.status == FutureStatus.rejected)
        return StoreStatus.failure;
      else
        return StoreStatus.success;
    } else {
      return StoreStatus.initial;
    }
  }
}
