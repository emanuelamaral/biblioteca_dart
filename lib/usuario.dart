import 'livro.dart';

class Usuario{
  static int _idCounter = 0;
  final int _id;
  String _nome;
  String _endereco;
  final List<Livro> _livrosEmprestados;

  Usuario(this._nome, this._endereco) : 
  _livrosEmprestados = [],
  _id = ++_idCounter;

  int get id => _id;

  String get nome => _nome;
  set nome(String nome){
    if(nome.trim().isEmpty){
      throw Exception('O nome do usuário não pode ser vazio');
    }
    _nome = nome;
  }
  
  String get endereco => _endereco;
  set endereco(String endereco){
    if(endereco.trim().isEmpty){
      throw Exception('O endereço não pode ser vazio');
    }
    _endereco = endereco;
  }

  List<Livro> get livrosEmprestados => _livrosEmprestados;

}