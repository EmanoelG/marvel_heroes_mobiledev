import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late Size _tela;
  late TabController tabControl;
  List<Widget> paginas = [
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.red,
    )
  ];

  @override
  void initState() {
    // TODO: implement initState
    tabControl = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _tela = MediaQuery.of(context).size;
    return Scaffold(
      //appBar: AppBar(),
      body: TabBarView(controller: tabControl, children: paginas),
      bottomNavigationBar: TabBar(
        controller: tabControl,
        tabs: const <Widget>[
          Tab(
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.description,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
