import 'package:climaapp/clima.dart';
import 'package:flutter/material.dart';

class Clima extends StatelessWidget {
  const Clima({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/fundoHome.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/1.png"),
            SizedBox(height: 50),
            ElevatedButton(onPressed: (){
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => ClimaTela())
              );}, 
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 134, 173, 240),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.cloud, color: Colors.black),
                  SizedBox(width: 5),
                  Text("Entrar",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}