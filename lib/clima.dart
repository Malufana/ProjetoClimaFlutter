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
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Clima - Monte Mor',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        toolbarHeight: 120,
        elevation: 6,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
            children: [
              Card(
                elevation: 6,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      Icon(Icons.thermostat, size: 48, color: Colors.deepOrange),
                      SizedBox(height: 16),
                      Text(
                        "Temperatura: $temperatura °C",
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Umidade: $umidade °C",
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Probabilidade de Chuva: $chuva %",
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          ), 
        )
      ),
    );
  }
}