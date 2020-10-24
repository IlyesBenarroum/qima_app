import '../../app/modules/OnBoarding/views/on_boarding_view.dart';
import '../../app/modules/OnBoarding/bindings/on_boarding_binding.dart';
import '../../app/modules/add_auction/add_auction_view.dart';
import '../../app/modules/add_auction/add_auction_binding.dart';
import '../../app/modules/auction_live/auction_live_view.dart';
import '../../app/modules/auction_live/auction_live_binding.dart';
import '../../app/modules/detail/detail_view.dart';
import '../../app/modules/detail/detail_binding.dart';
import '../../app/modules/splash/splash_view.dart';
import '../../app/modules/splash/splash_binding.dart';
import '../../app/modules/notification/notification_view.dart';
import '../../app/modules/notification/notification_binding.dart';
import '../../app/modules/profile/profile_view.dart';
import '../../app/modules/profile/profile_binding.dart';
import '../../app/modules/auctions/auction_view.dart';
import '../../app/modules/auctions/auction_binding.dart';
import '../../app/modules/main/main_view.dart';
import '../../app/modules/main/main_binding.dart';
import '../../app/modules/signup/signup_view.dart';
import '../../app/modules/signup/signup_binding.dart';
import '../../app/modules/home/home_view.dart';
import '../../app/modules/home/home_binding.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: Routes.MAIN,
      page: () => MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: Routes.AUCTION,
      page: () => AuctionView(),
      binding: AuctionBinding(),
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.NOTIFICATION,
      page: () => NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.DETAIL,
      page: () => DetailView(),
      binding: DetailBinding(),
    ),
    GetPage(
      name: Routes.AUCTION_LIVE,
      page: () => AuctionLiveView(),
      binding: AuctionLiveBinding(),
    ),
    GetPage(
      name: Routes.ADD_AUCTION,
      page: () => AddAuctionView(),
      binding: AddAuctionBinding(),
    ),
    GetPage(
      name: Routes.ON_BOARDING,
      page: () => OnBoardingView(),
      binding: OnBoardingBinding(),
    ),
  ];
}
