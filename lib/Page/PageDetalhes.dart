import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvel_heroes_yt/Comics/Controll/ComicsControl.dart';
import 'package:marvel_heroes_yt/Models/ComicsNew.dart';

import 'package:marvel_heroes_yt/Models/Personagem.dart';

class PageDetalhes extends StatelessWidget {
  int id;
  PageDetalhes({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes'),
      ),
      body: Container(
        child: StreamBuilder<List<ComicsNew>>(
            stream: comicsC.outComics,
            builder: (BuildContext context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (!snapshot.hasData) {
                return Text("Sem dados");
              }

              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  ComicsNew perso = snapshot.data![index];
                  return Card(
                    child: Column(
                      children: [
                        Card(
                          color: Color.fromARGB(255, 250, 250, 250),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Center(
                                    child: Image.network(
                                  "${perso.thumbnail.path}.${perso.thumbnail.extension}",
                                  width: 350,
                                )),
                                const Text(
                                  'Descrição ',
                                  maxLines: 1,
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(
                                  perso.description,
                                  maxLines: 1,
                                  style: TextStyle(fontSize: 25),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Center(child: Text(perso.description)),
                      ],
                    ),
                  );
                },
              );
            }),
      ),
    );
  }
}
