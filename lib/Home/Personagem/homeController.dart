import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:marvel_heroes_yt/Home/Personagem/Personagem.dart';
import 'package:marvel_heroes_yt/utils/const.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;

class HomeController extends BlocBase {
  //Bloc personagem
  late BehaviorSubject<List<Personagem>> blocPersonagem = BehaviorSubject();

  Sink<List<Personagem>> get inPerson => blocPersonagem.sink;
  Stream<List<Personagem>> get outPerson => blocPersonagem.stream;
  //Fin bloc personagem
  late List<Personagem> listaPersonagem;
  late Personagem personagens;

  escolherPersonagem(List<int> ids) {
    for (var id in ids) {
      listaPersonagem = [];
      getPersonagemById(id);
    }
  }

  HomeController() : super(null) {
    escolherPersonagem([1009351, 1009220, 1009610]);
  }

  getPersonagemById(int id) {
    var urlFinal = gerarUrl("characters/$id");
    print('url formada: $urlFinal');
    http.post(Uri.parse(urlFinal)).then(
      (v) {
        print('Status: ' + v.statusCode.toString());
        if (v.body.isEmpty) {
          var personagems = jsonDecode(v.body)["data"]["results"];
          for (var personagemTemp in personagems) {
            personagens = personagens.fromJson(personagemTemp);
            listaPersonagem.add(personagens);
            inPerson.add(listaPersonagem);
          }
        }
      },
    );
  }

  late List<Personagem> personagem;
  late Personagem personag;
  atualizaQuadros(Personagem perso) {
    for (var a in listaPersonagem) {
      a.clicked = false;
    }
    perso.clicked = true;
    inPerson.add(listaPersonagem);
  }

  @override
  void dispose() {
    blocPersonagem.close();
  }
}

HomeController homeC = HomeController();
