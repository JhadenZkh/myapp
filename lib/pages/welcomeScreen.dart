import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:myapp/pages/auth/signUpScreen.dart';

import 'auth/loginScreen.dart';
import 'auth/signUpScreen.dart';

class welcomeScreen extends StatefulWidget {
  const welcomeScreen({super.key});

  @override
  State<welcomeScreen> createState() => _welcomeScreenState();
}

class _welcomeScreenState extends State<welcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(height: 20,),
              Image.network(
                'https://i.ibb.co/3MLGsSx/logo-new.png',
                height: 80,
                width: 120,
              ),
              Lottie.network(
                  'https://assets1.lottiefiles.com/packages/lf20_1pxqjqps.json',
                  height: 300,
                  width: 600),
              const Text(
                'Bienvenid@s',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              Expanded(
                flex: 0,
                child: Text(
                  'Ingresa a nuestra pagina de libros!',
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontWeight: FontWeight.w300,
                      // height: 1.5,
                      fontSize: 15),
                ),
              ),
              const SizedBox(
                height: 135,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      backgroundColor: Colors.grey,
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width / 3.3,
                          vertical: 20)
                      // padding: EdgeInsets.only(
                      //     left: 120, right: 120, top: 20, bottom: 20),
                      ),
                  onPressed: () {
                    Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeftPop, child: const loginScreen(), childCurrent: const welcomeScreen()));
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => loginScreen()));
                  },
                  child: const Text(
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3486447537.
                    'Iniciar Sesion!',
                    style: TextStyle(fontSize: 17),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'No tienes cuenta?',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const signUpScreen()));
                    },
                    child: const Text(
                      'Registrate',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
