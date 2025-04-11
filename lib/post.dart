import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PostClimateScreen extends StatefulWidget {
  const PostClimateScreen({super.key});

  @override
  State<PostClimateScreen> createState() => _PostClimateScreenState();
}

class _PostClimateScreenState extends State<PostClimateScreen> {
  final TextEditingController temperaturaController = TextEditingController();
  final TextEditingController umidadeController = TextEditingController();
  final TextEditingController chuvaController = TextEditingController();

  Future<void> postData() async {
    final double temp = double.parse(temperaturaController.text);
    final double umid = double.parse(umidadeController.text);
    final double chuv = double.parse(chuvaController.text);

    await FirebaseFirestore.instance.collection('Monte Mor').add(
      {
        'temperatura': temp,
        'umidade': umid,
        'chuva': chuv
      }
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Seus dados foram enviados com sucesso!"))
    );

    temperaturaController.clear();
    umidadeController.clear();
    chuvaController.clear();

  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tela de POST")),
      body: Column(
        children: [
          TextField(
            controller: temperaturaController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Insira a Temperatura"),
          ),
          TextField(
            controller: umidadeController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Insira a Umidade"),
          ),
          TextField(
            controller: chuvaController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Insira a probabilidade de Chuva"),
          ),
          ElevatedButton(onPressed: postData, child: Text("Enviar"))
        ],
      ),
    );
  }
}