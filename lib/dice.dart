import 'package:flutter/material.dart';

class Dice extends StatelessWidget {
  const Dice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text('Dice page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Row(
                children: [
                  Expanded(
                    child: Image.asset('images/dice1.png')
                  ),
                  const SizedBox(width: 20.0),
                  Expanded(
                    child: Image.asset('images/dice4.png')
                  ),
                ],
              ),
            ),
            const SizedBox(height: 60.0),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Colors.orangeAccent,
                minimumSize: const Size(100.0, 60.0),
              ),
              child: const Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 50.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
