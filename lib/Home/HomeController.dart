import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;

import 'package:rxdart/rxdart.dart';

import '../Helper.dart';
import '../Models/Personagem.dart';

class HomeController extends BlocBase {
  //BLOC PERSONAGEM
  BehaviorSubject<List<Personagem>> blocPersoagem = BehaviorSubject();
  Sink<List<Personagem>> get inPerson => blocPersoagem.sink;
  Stream<List<Personagem>> get outPerson => blocPersoagem.stream;
  //FIM BLOC PERSONAGEM

  late List<Personagem> listaPersonagem;
  late Personagem personagem;

  HomeController() : super(null) {
    escolhePersonagem([1009351, 1009220, 1009610]);
  }

  escolhePersonagem(List<int> ids) {
     listaPersonagem = [];

    for (var id in ids) {
      getPersonagemPorId(id);
    }
  }

  getPersonagemPorId(int id) {
    String urlFinal = gerarUrl("characters/$id");
    print(urlFinal);
    http.get(Uri.parse(urlFinal)).then((v) {
      if (v.statusCode.toString() == '200') {
        var personagems = jsonDecode(v.body)["data"]["results"];
        for (var personagemTemp in personagems) {
          personagem = Personagem.fromJson(personagemTemp);
          listaPersonagem.add(personagem);

          inPerson.add(listaPersonagem);
        }
      }
    });
  }

  atualizaQuadros(Personagem perso) {
    for (var a in listaPersonagem) {
      a.clicked = false;
    }
    perso.clicked = true;
    inPerson.add(listaPersonagem);
  }

  @override
  void dispose() {
    blocPersoagem.close();
  }
}

HomeController homeC = HomeController();
