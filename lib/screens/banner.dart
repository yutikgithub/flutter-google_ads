import 'package:ads/ads/admob_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BannerDemo extends StatefulWidget {
  const BannerDemo({Key? key}) : super(key: key);

  @override
  _BannerDemoState createState() => _BannerDemoState();
}

class _BannerDemoState extends State<BannerDemo> {

  late List<String> data;
  late List<Object> dataAds;

  AdmobHelper admobHelper = AdmobHelper();


  @override
  void initState() {
    super.initState();
    data = [];
    admobHelper.createInt();

    for (int i = 1; i < 20; i++) {
      data.add('Item $i');
    }

    dataAds = List.from(data);

    for (int i = 1; i <= data.length; i++) {
      // var min = 1;
      // var rm = Random();

      // var randomNumber = min + rm.nextInt(18);

      if(i % 4 == 0)
      {
           dataAds.insert(i, AdmobHelper.getBannerAd()..load());
      }

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: dataAds.length,
          itemBuilder: (context, index) {
            if (dataAds[index] is String) {
              return ListTile(
                title: Text(dataAds[index].toString()),
                leading: const Icon(Icons.ac_unit_outlined),
                onTap: (){
                  admobHelper.showInt();
                  },
              );
            } else {
              final Container adContent = Container(
                height: 50,
                child: AdWidget(
                  ad: dataAds[index] as BannerAd,
                ),
              );

              return adContent;

            }
          }),
      bottomNavigationBar: Container(
        height: 50.0,
        child: AdWidget(
          ad: AdmobHelper.getBannerAd()..load(),
        ),
      ),
    );
  }
}
