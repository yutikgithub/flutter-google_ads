import 'package:flutter/cupertino.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdmobHelper extends ChangeNotifier
{
    static String get bannerUnit => 'ca-app-pub-3940256099942544/6300978111';

    late InterstitialAd _interstitialAd;

    int rewardePoint = 0;
    int getReward() => rewardePoint;

    late RewardedAd rewardedAd; 

    static initialization()
    {
      if(MobileAds.instance == null)
      {
        MobileAds.instance.initialize();
      }
    }

    static BannerAd getBannerAd(){
      BannerAd bannerAd = BannerAd(
    size: AdSize.banner, 
    adUnitId: bannerUnit,
     listener: BannerAdListener(
       onAdLoaded: (Ad ad)
       {
         print("ad Loaded...");
       },
       onAdFailedToLoad: (ad, error) {
         print('Ad Failed to Load..');
         ad.dispose();
       },
       onAdOpened: (ad) {
         print('onAdOpenrd...');
       },
     ), 
     request: const AdRequest());

     return bannerAd;

    }

    void createInt(){
      InterstitialAd.load(
        adUnitId: 'ca-app-pub-3940256099942544/8691691433',
        request: const AdRequest(), 

        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad)
          {
            _interstitialAd = ad;
          }, 
          onAdFailedToLoad: (LoadAdError error)
          {
            createInt();
          })
     
        );
    }

    void showInt(){
      if(_interstitialAd == null)
      {
        createInt();
      }
      
      _interstitialAd.fullScreenContentCallback = FullScreenContentCallback(
       
        onAdShowedFullScreenContent: (InterstitialAd ad)
        {
          print('onAdShowedFullScreenContent');
        },

        onAdDismissedFullScreenContent: (InterstitialAd ad)
        {
          print('onAdDismissedFullScreenContent');
          createInt();
        },

        onAdFailedToShowFullScreenContent: (ad, error) {
          print('$ad onAdFaild $error');
          ad.dispose();
          createInt();
        },

      );

      _interstitialAd.show();

    }


    void loadRewardedAd()
    {
      RewardedAd.load(adUnitId: 'ca-app-pub-3940256099942544/5224354917',
       request: const AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (ad) {
            print("$ad is loaded...");
            rewardedAd = ad;
          }, 
          onAdFailedToLoad: (error) {
              //loadRewardedAd();
          },)
        );
    }

    void showRewardAd()
    {

      rewardedAd.show(onUserEarnedReward: (ad, reward) {
          print("Rewarde Earned is : ${reward.amount}");
       },
      );


      rewardedAd.fullScreenContentCallback = FullScreenContentCallback(
        onAdShowedFullScreenContent:(ad) {
          
        },

        onAdFailedToShowFullScreenContent: (ad, error){
          ad.dispose();
        },

        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
        },

        onAdImpression: (ad) {
          print("$ad impression occurred...");
        },

      );

    }

}