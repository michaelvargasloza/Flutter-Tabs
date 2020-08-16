import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tabapp/FirstPage.dart';
import 'package:tabapp/SecondPage.dart';

class TabPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new TabPageState();
}

class TabPageState extends State<TabPage> with SingleTickerProviderStateMixin{
  TabController tabController;
  List<Tab> myTabs = <Tab>[
    new Tab(icon: Icon(Icons.home), text: "Inicio"),
    new Tab(icon: Icon(Icons.notifications), text: "Notificaciones"),
  ];

  @override
  void initState() {
    tabController = new TabController(length: myTabs.length, vsync: this);
    //Detecta la posición de los tabs
    tabController.addListener(() {
      setState(() {
        print("index ${tabController.index}");
      });
    });
  }

  @override
  void dispose() {
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Ejemplo Tabs en Flutter"),
        bottom: new TabBar(tabs: myTabs, controller: tabController),
      ),
      body: new TabBarView(children: [
        new FirstPage(),
        new SecondPage()
      ],
        controller: tabController,),
    );
  }
}