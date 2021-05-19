// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CityStore on _CityStore, Store {
  Computed<StoreStatus> _$currentStatusComputed;

  @override
  StoreStatus get currentStatus => (_$currentStatusComputed ??=
          Computed<StoreStatus>(() => super.currentStatus,
              name: '_CityStore.currentStatus'))
      .value;

  final _$responseAtom = Atom(name: '_CityStore.response');

  @override
  ObservableFuture<CityModel> get response {
    _$responseAtom.reportRead();
    return super.response;
  }

  @override
  set response(ObservableFuture<CityModel> value) {
    _$responseAtom.reportWrite(value, super.response, () {
      super.response = value;
    });
  }

  final _$getCityApiAsyncAction = AsyncAction('_CityStore.getCityApi');

  @override
  Future<dynamic> getCityApi(String country) {
    return _$getCityApiAsyncAction.run(() => super.getCityApi(country));
  }

  @override
  String toString() {
    return '''
response: ${response},
currentStatus: ${currentStatus}
    ''';
  }
}
