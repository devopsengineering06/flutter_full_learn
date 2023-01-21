import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/image_learn_202.dart';
import 'package:kartal/kartal.dart';

class KartalView extends StatefulWidget {
  const KartalView({super.key});

  @override
  State<KartalView> createState() => _KartalViewState();
}

class _KartalViewState extends State<KartalView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          InkWell(
              onTap: () {
                context.navigateToPage(const ImageLearn202(), type: SlideType.LEFT);
              },
              child: Text('Kartal', style: context.textTheme.headline1)),
          Icon(context.isIOSDevice ? Icons.ios_share : Icons.android_rounded),
          AnimatedContainer(
              color: Colors.red,
              height: context.isKeyBoardOpen ? 0 : context.dynamicHeight(0.1),
              duration: context.durationLow),
          const TextField(),
          Image.network(''.randomImage),
          InkWell(
              onTap: () {
                'devops.engineering06@gmail.com'.launchEmail;
                'https://www.evernote.com/client/web?login=true#?n=83b28e6b-7b09-79ea-1c67-83a8cd51533e&'.launchWebsite;
                context.navigateToPage(const ImageLearn202(), type: SlideType.LEFT);
              },
              child: Text('DevOps', style: context.textTheme.headline1).toDisabled(true)),
        ],
      ),
    );
  }
}
