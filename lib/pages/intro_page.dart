import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 80.0, right: 80.0, bottom: 40.0, top: 160.0),
            child: Image.asset('images/avocado.png'),
          ),
           Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              "We deliver grocerries at your doorstep",
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSerif(fontSize: 48, fontWeight: FontWeight.bold),
            ),
          ),
          const Spacer(),
          Text("Fresh items daily",style: TextStyle(color: Colors.grey.shade600),),
          const Spacer(),
          GestureDetector(
            onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder:(context){
              return const HomePage();
            })),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(12)
              ),
              padding: const EdgeInsets.all(24),
              child: const Text("Get Started",style: TextStyle(color: Colors.white),),
              ),
          ),
            const Spacer()
        ],
      ),
    );
  }
}
