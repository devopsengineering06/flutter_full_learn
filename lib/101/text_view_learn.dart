import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextViewLearn extends StatelessWidget {
  TextViewLearn({super.key, this.username});
  final String name = 'DevOps';

  final String? username;
  final ProjectKeys keys = ProjectKeys();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoButton(
              child: const Text('DevOps'),
              onPressed: () {},
            ),
            TextButton(onPressed: () {}, child: const Text('DevOps')),
            Text(
              ('Welcome $name ${name.length}'),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.right,
              style: ProjectStyles.welcomeStyle,
            ),
            Text(
              ('Hello $name ${name.length}'),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.right,
              style: const TextStyle(
                wordSpacing: 2,
                letterSpacing: 2,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.underline,
                fontStyle: FontStyle.italic,
                color: Colors.lime,
              ),
            ),
            Text(('Welcome $name ${name.length}'),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.right,
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(color: ProjectColors.welcomeColor)),
            Text(username ??
                ''), // username!  Kullanılmaz.Boş gelirse hata verir.
            Text(keys.welcome),
          ],
        ),
      ),
    );
  }
}

class ProjectStyles {
  static TextStyle welcomeStyle = const TextStyle(
    wordSpacing: 2,
    letterSpacing: 2,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.underline,
    fontStyle: FontStyle.italic,
    color: Colors.lime,
  );
}

class ProjectColors {
  static Color welcomeColor = Colors.red;
}

class ProjectKeys {
  final String welcome = 'Merhaba';
}
