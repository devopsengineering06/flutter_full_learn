import 'package:flutter/material.dart';

import './model_learn.dart';

class ModelViewLearn extends StatefulWidget {
  const ModelViewLearn({super.key});

  @override
  State<ModelViewLearn> createState() => _ModelViewLearnState();
}

class _ModelViewLearnState extends State<ModelViewLearn> {
  // final user9 = PostModel8(body: 'a');       // user9 değiştirilemez
  // PostModel8 user9 = PostModel8(body: 'a');   // Hata vermez
  var user9 = PostModel8(body: 'a'); // var kullanılabilir

  @override
  void initState() {
    super.initState();

    final user1 = PostModel1();
    // ..userId = 1
    // ..body = 'vb';
    user1.body = 'hello';

    final user2 = PostModel2(1, 2, 'a', 'b');
    user2.body = 'c';

    final user3 = PostModel3(1, 2, 'a', 'b');
    // user3.body='c';     // hata verir

    final user4 = PostModel4(userId: 1, id: 2, title: 'a', body: 'b');
    // user4.body='c';      // hata verir

    final user5 = PostModel5(userId: 1, id: 2, title: 'a', body: 'b');
    // user5.userId = 3;     // hata verir

    final user6 = PostModel6(userId: 1, id: 2, title: 'a', body: 'b');
    // user6.     Özelliklere erişilemez.

    final user7 = PostModel1(); // Default değerlerini alır.

    //Service kullanımı
    final user8 = PostModel8(body: 'a');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            // user9 = PostModel8(title: 'On pressed!');
            // user9 = user9.copyWith(title: 'vb');
            // user9.updateBody('DevOps');
            user9.updateBody(null);
          });
        },
      ),
      appBar: AppBar(
        // title: Text(user9.body ?? ''),
        // title: Text(user9.title!),  // Hata verir
        // title: Text(user9.title ?? 'Not has any data'), // Hata vermez
        title: Text(user9.body ?? 'Not has any data'), // Hata vermez
      ),
    );
  }
}
