import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ClimaTela extends StatefulWidget {
  const ClimaTela({super.key});

  @override
  State<ClimaTela> createState() => _ClimaTelaState();
}

class _ClimaTelaState extends State<ClimaTela> {
  double temperatura = 0.0;
  double umidade = 0.0;
  double chuva = 0.0;

  @override
  void initState(){
    super.initState();
    fetchData();
  }

  void  fetchData(){
    FirebaseFirestore.instance.collection('Monte Mor').snapshots().listen((snapshot){
      var data = snapshot.docs.first.data();
      setState(() {
        temperatura = (data['temperatura'] ?? 0).toDouble();
        umidade = (data['umidade'] ?? 0).toDouble();
        chuva = (data['chuva'] ?? 0).toDouble();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clima - Monte Mor'),
        centerTitle: true,
        toolbarHeight: 150,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
              "Temperatura: $temperatura °C",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                "Umidade: $umidade °C",
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                "Probabilidade de Chuva: $chuva %",
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        )
      ),
    );
  }
}