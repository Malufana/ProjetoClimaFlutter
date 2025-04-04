import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ClimaHistoryScreen extends StatefulWidget {
  const ClimaHistoryScreen({super.key});

  @override
  State<ClimaHistoryScreen> createState() => _ClimaHistoryScreenState();
}

class _ClimaHistoryScreenState extends State<ClimaHistoryScreen> {

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(stream: stream, builder: builder)
      
    );
  }
}