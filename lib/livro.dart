import 'autor.dart';

class Livro{
  static int _idCounter = 0;
  final int _id;
  String _titulo;
  Autor _autor;
  int _anoDePublicacao;
  bool _disponivel;
  
 
  Livro(this._titulo, this._autor, this._anoDePublicacao) :
    _disponivel = true,
    _id = ++_idCounter;
  

  int get id => _id;

  String get titulo => _titulo;
  set titulo(String titulo){
    if(titulo.trim().isEmpty){
      throw Exception('O título precisa conter algum caractere');
    }
    _titulo = titulo;
  }

  Autor get autor => _autor;
  set autor(Autor autor){
    _autor = autor;
  }

  int get anoDePublicacao => _anoDePublicacao;
  set anoDePublicacao(int ano){
    if(ano.isNegative){
      throw Exception('Informe um ano válido');
    }
    _anoDePublicacao = ano;
  }

  bool get disponivel => _disponivel;
  set disponivel(bool value){
    _disponivel = value;
  }

}