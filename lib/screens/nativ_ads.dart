import 'package:ads/screens/banner.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class NativeAds extends StatefulWidget {
  const NativeAds({ Key? key }) : super(key: key);

  @override
  _NativeAdsState createState() => _NativeAdsState();
}

class _NativeAdsState extends State<NativeAds> {

  late NativeAd ad;
  bool isAdLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ad = NativeAd(
      adUnitId: "ca-app-pub-3940256099942544/2247696110", 
      factoryId: "listTile", 
      listener: NativeAdListener(

        onAdLoaded: (_){
          setState(() {
            isAdLoaded = true;
          });
        },

        onAdFailedToLoad: (ad,error)
        {
            ad.dispose();
            print("Ad load faild (code = ${error.code} message = ${error.message})");
        }

      ),
       request: const AdRequest()
       );

      ad.load();

  }

  @override
  void dispose() {
    ad.dispose();
    super.dispose();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const BannerDemo(),));
        }, child: const Text('show banner ads')),
      ),
        bottomNavigationBar: SizedBox(
          height: 100.0,
          child: 
          isAdLoaded 
          ? AdWidget(ad: ad)
          : const Center(child: Text('Ad is Lodeing...'))
        ),
    );
  }
}