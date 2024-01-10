import 'package:flutter/material.dart';
import 'package:meow_films/core/constant/constant.dart';
import 'package:meow_films/features/Presentation/pages/login_main_page.dart';
import 'package:meow_films/features/Presentation/pages/sign_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: 100,
                  height: 60,
                  color: Colors.blueAccent,
                  child: Image.network(
                    'https://repository-images.githubusercontent.com/234538112/b3b60300-3fb2-11ea-8c9d-af3ec292a086',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 55,
          ),
          Container(
            width: 330,
            height: 290,
            color: Colors.red,
            child: Image.network(
              'https://img.freepik.com/vecteurs-libre/theatre-ete-divertissement-ete-regarder-films-loisirs-plein-air-couple-appreciant-soiree-detente-au-cinema-plein-air-idee-rendez-vous-romantique_335657-3605.jpg',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            Constant.hello,
            style: TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            Constant.loginfirstdis,
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
          ),
          const Text(
            Constant.loginseconddis,
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
          ),
          const SizedBox(
            height: 46,
          ),
          SizedBox(
            width: 230,
            height: 35,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyLoggingPage()));
              },
              style: ElevatedButton.styleFrom(
                  foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                  backgroundColor: const Color.fromARGB(255, 16, 1, 214),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5))),
              child: const Text(
                Constant.loginbutton,
              ),
            ),
          ),
          const SizedBox(
            height: 19,
          ),
          SizedBox(
            width: 230,
            height: 35,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Mysignup()));
              },
              style: ElevatedButton.styleFrom(
                  foregroundColor: const Color.fromARGB(255, 16, 1, 214),
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: const BorderSide(
                          color: Color.fromARGB(255, 16, 1, 214)))),
              child: const Text(
                Constant.signup,
              ),
            ),
          )
        ],
      ),
    );
  }
}
