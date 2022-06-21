import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dice Game',
      home: Login(),
    );
  }
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController diceInputController = TextEditingController();
  TextEditingController passwordInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log in'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 50.0)),
            const Center(
              child: Image(
                image: AssetImage('images/chef.gif'),
                width: 170.0,
                height: 190.0,
              ),
            ),
            Form(
              child: Theme(
                data: ThemeData(
                  primaryColor: Colors.teal,
                  inputDecorationTheme: const InputDecorationTheme(
                    labelStyle: TextStyle(
                      color: Colors.teal,
                      fontSize: 15.0,
                    ),
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: diceInputController,
                        decoration: const InputDecoration(
                          labelText: 'Enter "dice"',
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      TextField(
                        controller: passwordInputController,
                        decoration: const InputDecoration(
                          labelText: 'Enter password',
                        ),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                      ),
                      const SizedBox(height: 40.0),
                      ElevatedButton(
                        onPressed: () {
                          if (diceInputController.text == 'dice') {
                            if (passwordInputController.text == '1234') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('주사위 페이지로 이동'),
                                  duration: Duration(seconds: 2),
                                )
                              );
                            } else {
                              showSnackBar(context, 2);
                            }
                          } else {
                            if (passwordInputController.text == '1234') {
                              showSnackBar(context, 1);
                            } else {
                              showSnackBar(context, 0);
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orangeAccent,
                          minimumSize: const Size(100.0, 50.0),
                        ),
                        child: const Icon(Icons.arrow_forward, size: 35.0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showSnackBar(BuildContext context, int type) {
    String message = '';
    if (type == 1) {
      message = 'dice 의 철자를 확인하세요';
    } else if (type == 2) {
      message = '비밀번호가 일치하지 않습니다';
    } else {
      message = '로그인 정보를 다시 확인하세요.';
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.blue,
        duration: const Duration(seconds: 2),
      )
    );
  }
}
