import 'package:brainbinary_structure/utils/app.dart';
import 'package:mobx/mobx.dart';
import 'package:brainbinary_structure/model/city_model.dart';
import 'package:brainbinary_structure/rest_api/country_rest_api.dart';

part 'city_store.g.dart';

class CityStore = _CityStore with _$CityStore;

abstract class _CityStore with Store {
  void getCity(String country) {
    getCityApi(country);
  }

  @observable
  ObservableFuture<CityModel> response;

  @action
  Future getCityApi(String country) async {
    response = ObservableFuture(RestApi.getCity(country));
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
