import 'package:flutter/material.dart';
import 'package:marvel_heroes_yt/Models/Comics.dart';
import '../Comics/Controll/ComicsControl.dart';
import '../Models/ComicsNew.dart';
import '../Models/Personagem.dart';
import 'HomeController.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late Size _tela;
  late TabController tabController;
  var descriptionHeroes = '';
  @override
  void initState() {
    tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _tela = MediaQuery.of(context).size;

    List<Widget> paginas = [
      _personagens(context, _tela),
      Container(
        color: Colors.green,
      )
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Heroes Marvel'),
        centerTitle: true,
      ),
      body: TabBarView(
        controller: tabController,
        children: paginas,
      ),
      bottomNavigationBar: TabBar(controller: tabController, tabs: <Widget>[
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
        ),
      ]),
    );
  }

  Widget _personagens(BuildContext context, tela) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.black,
              height: tela.height * .7,
              child: _containerPersonagens(context),
            ),
            _description(),
          ],
        ),
      ),
    );
  }

  Widget _containerPersonagens(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: _tela.width * .09),
      child: Column(
        children: <Widget>[
          StreamBuilder<List<Personagem>>(
              stream: homeC.outPerson,
              builder: (BuildContext context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (!snapshot.hasData) {
                  return Text("Sem dados");
                }
                return Expanded(
                  child: Container(
                    width: double.infinity,
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      scrollDirection: Axis.horizontal,
                      // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      //     crossAxisCount: 1),
                      itemBuilder: (context, int index) {
                        Personagem perso = snapshot.data![index];
                        return GestureDetector(
                          onTap: () {
                            print(perso.description);
                            setState(() {
                              descriptionHeroes = perso.description;
                            });
                            // comicsC.getComics(perso.id);
                            homeC.atualizaQuadros(perso);
                          },
                          child: Column(
                            children: <Widget>[
                              containerPersonagem(perso),
                              Expanded(
                                child: Container(
                                  child: Image.network(
                                    "${perso.thumbnail.path}.${perso.thumbnail.extension}",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),

                              // _description(perso),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }

  Container containerDeDisponiveis(Personagem perso) {
    return Container(
        //padding: EdgeInsets.all(8),
        color: perso.clicked ? Colors.black : Colors.white,
        child: Center(
          child: Text(
            "Comics disponíveis: ${perso.comics.available}",
            style: TextStyle(
                color: perso.clicked ? Colors.white : Colors.black,
                fontSize: _tela.width * .08),
          ),
        ));
  }

  Center containerPersonagem(Personagem perso) {
    return Center(
      child: Text(
        perso.name,
        style: TextStyle(
            fontSize: _tela.width * .08,
            color: perso.clicked ? Colors.white : Colors.white),
      ),
    );
  }

  _description() {
    Personagem perso;
    return Container(
      child: Text(
        descriptionHeroes,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
