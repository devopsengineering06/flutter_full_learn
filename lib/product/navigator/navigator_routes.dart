import '../../303/navigator/navigate_home_detail_view.dart';
import '../../303/navigator/navigate_home_view.dart';
import '../../303/reqres_resource/lottie_learn.dart';

class NavigatorRoutes {
  static const paragfh = "/";
  final items = {
    paragfh: (context) => const LottieLearn(),
    NavigateRoutes.home.withParaf: (context) => const NavigateHomeView(),
    NavigateRoutes.detail.withParaf: (context) => const NavigateHomeDetail(),
  };
}

enum NavigateRoutes { init, home, detail }

extension NavigateRoutesExtension on NavigateRoutes {
  String get withParaf => "/$name";
}
