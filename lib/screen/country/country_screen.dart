import 'package:brainbinary_structure/screen/country/widget/country_list_item.dart';
import 'package:brainbinary_structure/utils/app.dart';
import 'package:brainbinary_structure/utils/debug.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:brainbinary_structure/model/country_model.dart';
import 'package:brainbinary_structure/rx/rx_country.dart';
import 'package:brainbinary_structure/screen/country/country_view_model.dart';
import 'package:brainbinary_structure/utils/common_widgets.dart';

class CountryScreen extends StatefulWidget {
  @override
  CountryScreenState createState() => CountryScreenState();
}

class CountryScreenState extends State<CountryScreen> {
  CountryViewModel model;

  @override
  void initState() {
    model = CountryViewModel(this);
    super.initState();
  }

  @override
  void dispose() {
    model.disposers.forEach((d) => d());
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    model.disposers ??= [
      reaction((_) => model.countryStore.currentStatus,
          (StoreStatus message) async {
        if (message != null && message == StoreStatus.success) {
          rxCountry.updateLoader(false);
          rxCountry.updateCounties(model.countryStore.response.result);
        } else if (message != null && message == StoreStatus.failure) {
          rxCountry.updateLoader(false);
          Debug.print(" ><><><><><><><>< CRASH ><><><><><><><>< ");
        }
      }),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Country"),
      ),
      body: StreamBuilder<bool>(
          stream: rxCountry.isLoading,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return StreamBuilder<String>(
                    stream: rxCountry.selectedCountry,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return StreamBuilder<CountryModel>(
                            stream: rxCountry.country,
                            builder: (context, countrySnap) {
                              if (countrySnap.hasData) {
                                return ListView.builder(
                                  itemCount: countrySnap.data.data.length > 30
                                      ? 30
                                      : countrySnap.data.data.length,
                                  itemBuilder: (context, index) => InkWell(
                                    onTap: () => model.countryItemClick(
                                        countrySnap.data.data[index].country),
                                    child: CountryListItem(
                                      countrySnap.data.data[index].country,
                                      snapshot.data,
                                      countrySnap.data.data[index].country,
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
      bottomNavigationBar: StreamBuilder<String>(
          stream: rxCountry.selectedCountry,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return BottomBar(
                onContinue: () => model.continueClick(snapshot.data),
                onBack: () {},
              );
            } else {
              return Container();
            }
          }),
    );
  }
}
