import 'package:flutter/material.dart';

class DashboardScreenPage extends StatefulWidget {
  const DashboardScreenPage({super.key});

  @override
  State<DashboardScreenPage> createState() => _DashboardScreenPageState();
}

class _DashboardScreenPageState extends State<DashboardScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.indigo,
        title: Text("Dashboard", style: TextStyle(color: Colors.white),),),
      body: SafeArea(child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text("Coming Soon...",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18),)
        ],),
      )),
    );

  }
}
