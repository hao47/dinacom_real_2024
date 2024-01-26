
import 'package:dinacom_2024/UI/auth/auth_page_view.dart';
import 'package:dinacom_2024/UI/auth/login/login_binding.dart';
import 'package:dinacom_2024/UI/auth/login/login_page_view.dart';
import 'package:dinacom_2024/UI/auth/register/regist_binding.dart';
import 'package:dinacom_2024/UI/auth/register/regist_page_view.dart';
import 'package:dinacom_2024/UI/auth/verif/verif_binding.dart';
import 'package:dinacom_2024/UI/auth/verif/verif_controller.dart';
import 'package:dinacom_2024/UI/auth/verif/verificationpage.dart';
import 'package:dinacom_2024/UI/bottom_navigation/bottom_navigation.dart';
// import 'package:dinacom_2024/UI/bottom_navigation/item/notification/notification_page.dart';
// import 'package:dinacom_2024/UI/bottom_navigation/item/beranda/beranda.dart';
import 'package:dinacom_2024/UI/bottom_navigation/item/poran/poran.dart';
import 'package:dinacom_2024/UI/bottom_navigation/item/poran/poran_binding.dart';
import 'package:dinacom_2024/UI/bottom_navigation/item/profile/profile.dart';
import 'package:dinacom_2024/UI/detail/detail.dart';
import 'package:dinacom_2024/UI/detail/detail_binding.dart';
import 'package:dinacom_2024/UI/instansi_profile/profile.dart';
import 'package:dinacom_2024/UI/kelola/kelola_page.dart';
import 'package:dinacom_2024/UI/masyarakat_profile/profile.dart';
import 'package:dinacom_2024/UI/notification/notification_page.dart';
import 'package:dinacom_2024/UI/setting/changepassword.dart';
import 'package:dinacom_2024/UI/setting/setting.dart';
import 'package:dinacom_2024/UI/setting/setting_binding.dart';
import 'package:dinacom_2024/UI/splash_screen/splash_screen.dart';
import 'package:dinacom_2024/UI/splash_screen/splash_screen_binding.dart';
import 'package:get/get.dart';
import '../../constants/url_routes.dart';

// var appRoutes = {
//   UrlRoutes.initial: (context) => SplashScreen(),
//   UrlRoutes.regist: (context) => RegistPageView(),
//   // UrlRoutes.login: (context) =>  LoginPageView(),
//   UrlRoutes.auth_page: (context) => AuthPageView(),
//   UrlRoutes.home: (context) => Beranda(),
//   UrlRoutes.profile: (context) => Profile(),
//   UrlRoutes.verif: (context) => VerifPage(),
//
//   UrlRoutes.test: (context) => ProfileMasyarakat(),
//   UrlRoutes.test1: (context) => ProfileInstansi(),
//   // UrlRoutes.detail: (context) => DetailPage(id: 0,),
// };
List<GetPage> routes = [
  GetPage(
    name: UrlRoutes.initial,
    page: () => const SplashScreen(),
    binding: SplashScreenPageBinding(),
  ),
  GetPage(
    name:  UrlRoutes.auth_page,
    page: () => AuthPageView(),
    // binding: AuthPageBinding(),
  ),
  GetPage(
    name: '/menu',
    page: () => const BottomNavigation(),
  ),
  GetPage(
    name: UrlRoutes.verif,
    page: () => const VerifPage(),
    binding: VerifBinding()
  ),
  GetPage(
    name: '/poran',
    page: () => Poran(),
    binding: PoranBinding(),
  ),
  GetPage(
    name: '/detail',
    page: () => DetailPage(),
    binding: DetailPoranBinding(),
  ),
  GetPage(
    name: '/setting',
    page: () => Setting(),
    binding: SettingBinding(),
  ),
  GetPage(
    name: '/change',
    page: () => ChangePassword(),

    binding: SettingBinding(),
  ),
  GetPage(
    name: '/profilemasyarakat',
    page: () => ProfileMasyarakat(),

    // binding: SettingBinding(),
  ),  GetPage(
    name: '/profileinstansi',
    page: () => ProfileInstansi(),

    // binding: SettingBinding(),
  ),
  GetPage(
    name: '/kelola',
    page: () => KelolaPage(),
  ),
  // GetPage(
  //   name: '/regist',
  //   page: () => RegistPageView(),
  //   binding: RegistPageBinding()
  //
  //   // binding: SettingBinding(),
  // ),

  GetPage(
      name: '/notif',
      page: () => NotificationPage(),
      // binding: RegistPageBinding()

    // binding: SettingBinding(),
  ),
  // GetPage(
  //   name: '/login',
  //   page: () => LoginPageView(),
  //   binding: LoginPageBinding()
  //
  //   // binding: SettingBinding(),
  // ),
  // GetPage(
  //   name: '/detail',
  //   page: () => const DetailPageView(),
  //   binding: DetailPageBinding(),
  // ),
  // GetPage(
  //   name: '/event_purchashed',
  //   page: () => EventPurchasedPageView(),
  //   binding: EventPurchasedPageBinding(),
  // ),
  // GetPage(
  //   name: '/profile',
  //   page: () =>  ProfilePageView(),
  //   binding: ProfilePageBinding(),
  // ),
  // GetPage(
  //   name: '/checkout',
  //   page: () => const CheckoutPageView(),
  //   binding: CheckoutPageBinding(),
  // ),
  // GetPage(
  //   name: '/eticket',
  //   page: () => const ETicketPageView(),
  //   binding: ETicketPageBinding(),
  // ),

];