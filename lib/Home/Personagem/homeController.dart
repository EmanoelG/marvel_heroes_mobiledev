import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:marvel_heroes_yt/Home/Personagem/Personagem.dart';
import 'package:rxdart/rxdart.dart';

class HomeController extends BlocBase {
  //Bloc personagem
  late BehaviorSubject<List<Personagem>> blocPersonagem = BehaviorSubject();

  Sink<List<Personagem>> get inPerson => blocPersonagem.sink;
  Stream<List<Personagem>> get outPerson => blocPersonagem.stream;
  //Fin bloc personagem
  
  late List<Personagem> personagem;
  late Personagem personag;

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
