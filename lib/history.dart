import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//ListView serve para a rolagem de tela
//Snapshot é o retorno dos elementos que estamos buscando do banco
//StreamBuilder é o que traz o status da conexão


class ClimaHistoryScreen extends StatefulWidget {
  const ClimaHistoryScreen({super.key});

  @override
  State<ClimaHistoryScreen> createState() => _ClimaHistoryScreenState();
}

class _ClimaHistoryScreenState extends State<ClimaHistoryScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>
      (stream: FirebaseFirestore.instance.collection('Monte Mor').snapshots(), 
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if(!snapshot.hasData || snapshot.data!.docs.isEmpty){
            return Center(
              child: Text("Não tem dado disponivel"),
            );
          }

          var dataList = snapshot.data!.docs;

          return ListView.builder(itemCount: dataList.length,
            itemBuilder: (context, index) {
              var data = dataList[index].data() as Map<String, dynamic>;  

              double temperatura = (data['temperatura'] ?? 0).toDouble();
              double umidade = (data['umidade'] ?? 0).toDouble();
              double chuva = (data['chuva'] ?? 0).toDouble();

              return Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)
                ),
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                color: Colors.blue.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.thermostat, size: 48, color: Colors.deepOrange),
                      SizedBox(height: 12),
                      Text("Temperatura: $temperatura °C",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87
                        ),
                      ),
                      Text("Umidade: $umidade %",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54
                        ),
                      ),
                      Text("Probabilidade de Chuva: $chuva %",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54
                        ),
                      ),
                      SizedBox(height: 20)
                    ]
                  )
                ),
              );
            },
          );
      })
      
    );
  }
}