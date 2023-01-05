import 'package:flutter/material.dart';

class ButtonLearn extends StatelessWidget {
  const ButtonLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Button View')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextButton(
              style: ButtonStyle(
                // backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                backgroundColor: MaterialStateProperty.resolveWith(
                  (states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.green;
                    }
                    return Colors.white;
                  },
                ),
              ),
              onPressed: () {},
              child: Text(
                'Save',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.abc),
              onPressed: () {}, label: const Text('Test'),
              // child: const Text('data'),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.abc_rounded),
            ),
            FloatingActionButton(
              onPressed: () {
                // service istekleri
                // sayfanın rengini düzenle
              },
              child: const Icon(Icons.add),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: const CircleBorder(),
              ),
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
            InkWell(
              onTap: () {},
              child: const Text('custom'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.only(
                    bottom: 20, left: 40, right: 40, top: 20),
                child: Text(
                  'Place Bid',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Borders:
// CircleBorder(),RoundedRectangleBorder()
