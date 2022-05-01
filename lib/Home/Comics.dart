import 'dart:convert';

import 'package:bloc/bloc.dart';

import 'package:http/http.dart' as http;
import 'package:marvel_heroes_yt/Models/Comics.dart';
import 'package:rxdart/subjects.dart';

import '../Models/ComicsNew.dart';
import '../utils/const.dart';

class ComicsController implements BlocBase {
  //BLOC PERSONAGEM
  BehaviorSubject<List<ComicsNew>> blocComics = new BehaviorSubject();
  Sink<List<ComicsNew>> get inComics => blocComics.sink;
  Stream<List<ComicsNew>> get outComics => blocComics.stream;
  //FIM BLOC PERSONAGEM

  late List<ComicsNew> listaComics;

  getComics(int idPersonagem) {
    listaComics = [];
    inComics.add(listaComics);
    ComicsNew comic;
    String urlFinal =
        gerarUrl("characters/$idPersonagem/comics", adicional: "&limit=25");

    http.get(Uri.parse(urlFinal)).then((value) {
      var comicJson = jsonDecode(value.body)["data"]["results"];
      for (var c in comicJson) {
        comic = ComicsNew.fromJson(c); // ComicsNew comic. = fromJson(c);
        listaComics.add(comic);
      }
      inComics.add(listaComics);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

ComicsController comicsC = new ComicsController();
