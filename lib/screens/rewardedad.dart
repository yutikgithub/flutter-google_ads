import 'package:ads/ads/admob_helper.dart';
import 'package:ads/screens/nativ_ads.dart';
import 'package:flutter/material.dart';

class RewardedAdsPage extends StatelessWidget {
  const RewardedAdsPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    AdmobHelper admobHelper = AdmobHelper();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              ElevatedButton(onPressed: (){
                  admobHelper.loadRewardedAd();
              }, child: const Text('Load Rewarded Ads')),

              const SizedBox(height: 30.0,),

              ElevatedButton(onPressed: (){
                  admobHelper.showRewardAd();
              }, child: const Text('Show Rewarded Ads')),

              const SizedBox(height: 30.0,),

              ElevatedButton(onPressed: (){

                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NativeAds(),));

              }, child: const Text('show native ad'))

          ],
        ),
      ),
    );
  }
}