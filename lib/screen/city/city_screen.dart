import 'package:brainbinary_structure/screen/city/widget/city_list_item.dart';
import 'package:brainbinary_structure/utils/app.dart';
import 'package:brainbinary_structure/utils/debug.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:brainbinary_structure/model/city_model.dart';
import 'package:brainbinary_structure/rx/rx_city.dart';
import 'package:brainbinary_structure/screen/city/city_view_model.dart';
import 'package:brainbinary_structure/utils/common_widgets.dart';

class CityScreen extends StatefulWidget {
  final String country;

  CityScreen(this.country);

  @override
  CityScreenState createState() => CityScreenState();
}

class CityScreenState extends State<CityScreen> {
  CityViewModel model;

  @override
  void initState() {
    model = CityViewModel(this);
    super.initState();
  }

  @override
  void dispose() {
    rxCity.updateCity(-1);
    model.disposers.forEach((d) => d());
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    model.disposers ??= [
      reaction((_) => model.cityStore.currentStatus,
          (StoreStatus message) async {
        if (message != null && message == StoreStatus.success) {
          rxCity.updateLoader(false);
          rxCity.updateCities(model.cityStore.response.result);
        } else if (message != null && message == StoreStatus.failure) {
          rxCity.updateLoader(false);
          Debug.print(" ><><><><><><><>< CRASH ><><><><><><><>< ");
        }
      }),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("City"),
      ),
      body: StreamBuilder<bool>(
          stream: rxCity.isLoading,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return StreamBuilder<int>(
                    stream: rxCity.selectedCity,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return StreamBuilder<CityModel>(
                            stream: rxCity.cities,
                            builder: (context, countrySnap) {
                              if (countrySnap.hasData) {
                                return ListView.builder(
                                  itemCount: countrySnap.data.data.length > 30
                                      ? 30
                                      : countrySnap.data.data.length,
                                  itemBuilder: (context, index) => InkWell(
                                    onTap: () => model.countryItemClick(index),
                                    child: CityListItem(
                                      countrySnap.data.data[index].city,
                                      snapshot.data,
                                      index,
                                    ),
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            });
                      } else {
                        return Container();
                      }
                    });
              }
            } else {
              return Container();
            }
          }),
      bottomNavigationBar: StreamBuilder<int>(
          stream: rxCity.selectedCity,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return BottomBar(
                onContinue: () => model.continueClick(snapshot.data),
              );
            } else {
              return Container();
            }
          }),
    );
  }
}
