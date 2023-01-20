import 'package:flutter/material.dart';
import 'package:flutter_learn_full/product/constant/duration_items.dart';
import 'package:flutter_learn_full/product/constant/lottie_items.dart';
import 'package:flutter_learn_full/product/global/theme_notifier.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class LottieLearn extends StatefulWidget {
  const LottieLearn({super.key});

  @override
  State<LottieLearn> createState() => _LottieLearnState();
}

// https://assets3.lottiefiles.com/packages/lf20_ydo1amjm.json

class _LottieLearnState extends State<LottieLearn>
    with TickerProviderStateMixin {
  late AnimationController controller;
  bool isLight = true;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: DurationItems.durationNormal());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
              onTap: () async {
                await controller.animateTo(isLight ? 0.5 : 1);
                // controller.animateTo(0.5);
                isLight = !isLight;
                Future.microtask(() {
                  context.read<ThemeNotifier>().changeTheme();
                });
              },
              child: Lottie.asset(LottieItems.themeChange.lottiePath,
                  repeat: false, controller: controller))
        ],
      ),
      body: const LottieLoading(),
    );
  }
}

class LottieLoading extends StatelessWidget {
  const LottieLoading({
    Key? key,
  }) : super(key: key);
  final _loadingLottie =
      'https://assets7.lottiefiles.com/datafiles/bEYvzB8QfV3EM9a/data.json';
  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.network(_loadingLottie));
  }
}
