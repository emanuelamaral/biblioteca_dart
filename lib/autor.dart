import 'livro.dart';

class Autor {
  static int _idCounter = 0;
  final int _id;
  String _nome;
  DateTime _dataDeNascimento;
  final List<Livro> _livros;

  Autor(this._nome, this._dataDeNascimento) : 
  _livros = [],
  _id = ++_idCounter;

  int get id => _id;

  String get nome => _nome;
  set nome(String nome) {
    if (nome.trim().isEmpty) {
      throw Exception('O nome do autor não pode ser vazio');
    }
    _nome = nome;
  }

  DateTime get dataDeNascimento => _dataDeNascimento;
  set dataDeNascimento(DateTime dataDeNascimento) {
    _dataDeNascimento = dataDeNascimento;
  }

  List<Livro> get livros => _livros;

}
