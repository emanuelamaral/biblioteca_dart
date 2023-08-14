import 'dart:io';

import 'package:exercicio_1/autor.dart';
import 'package:exercicio_1/biblioteca.dart';
import 'package:exercicio_1/livro.dart';
import 'package:exercicio_1/usuario.dart';

DateTime? verificarDataDeNascimento(var value){

  DateTime? dataDeNascimento;

  try{
    dataDeNascimento = DateTime.tryParse(value ?? "");
  } catch (e){
    print('Ocorreu um erro: $e');
  }

  return dataDeNascimento;
}

void cadastrarLivro(){

  print('\n--------------- Cadastro de Livro ---------------\n');

  if(biblioteca.contemAutores()){
    print('Não há autores cadastrados ainda!');
    return;
  }

  stdout.write('Informe o título do livro: ');
  var titulo = stdin.readLineSync();

  stdout.write('Qual o autor do livro?\n');
  biblioteca.listarAutores();

  stdout.write('Informe o código do autor: ');
  var idDoAutor = stdin.readLineSync();

  int? id = int.tryParse(idDoAutor ?? "");

  Autor? autor = biblioteca.getAutorById(id!);

  if(autor == null){
    print('O autor escolhido não existe');
    return;
  }

  stdout.write('Informe o ano de publicação do livro: ');
  var anoDePublicacao = stdin.readLineSync();

  int? anoPublicacao = int.tryParse(anoDePublicacao ?? "");

  if(anoPublicacao == null){
    print('Ano informado inválido');
    return;
  }

  biblioteca.cadastrarLivro(titulo.toString(), autor, anoPublicacao);

}

void cadastrarAutor(){

  print('\n--------------- Cadastro de Autor ---------------\n');

  stdout.write('Informe o nome do autor: ');
  var nome = stdin.readLineSync();

  stdout.write('Informe a data de nascimento no formato (yyyy-MM-dd): ');
  var dataDeNascimento= stdin.readLineSync();

  DateTime? dataDeNascimentoDoAutor = verificarDataDeNascimento(dataDeNascimento);

  if (dataDeNascimentoDoAutor == null){
    print('A data não pode ser nula');
    return;
  }
  biblioteca.cadastrarAutor(nome.toString(), dataDeNascimentoDoAutor);
}

void cadastrarUsuario(){
  
  print('\n--------------- Cadastro de Usuário ---------------\n');

  stdout.write('Informe o nome do usuário: ');
  var nome = stdin.readLineSync();

  stdout.write('Informe o endereco do usuário: ');
  var endereco = stdin.readLineSync();

  biblioteca.cadastrarUsuario(nome.toString(), endereco.toString());

}

void emprestarLivro(){

  print('\n--------------- Emprestar Livro ---------------\n');

  print('Qual livro deseja pegar emprestado?');
  biblioteca.listarLivrosDisponiveis();

  stdout.write('Informe o código do livro: ');
  var idDoLivro = stdin.readLineSync();

  int? idLivro = int.tryParse(idDoLivro ?? "");

  Livro? livro = biblioteca.getLivroById(idLivro!);

  if(livro == null){
    print('O livro escolhido não existe');
    return;
  }

  print('E para qual usuário o livro será emprestado?\n');
  biblioteca.listarUsuarios();

  stdout.write('Informe o código do usuário: ');
  var idDoUsuario = stdin.readLineSync();

  int? idUsuario = int.tryParse(idDoUsuario ?? "");

  Usuario? usuario = biblioteca.getUsuarioById(idUsuario!);

  if(usuario == null){
    print('O usuário escolhido não existe');
    return;
  }

  biblioteca.adicionarLivroEmprestado(livro, usuario);

}

void devolverLivro(){

  print('\n--------------- Devolver Livro ---------------\n');

  print('Qual livro deseja devolver?\n');
  biblioteca.listarLivrosEmprestados();

  stdout.write('Informe o código do livro: ');
  var idDoLivro = stdin.readLineSync();

  int? idLivro = int.tryParse(idDoLivro ?? "");

  Livro? livro = biblioteca.getLivroById(idLivro!); 

  if(livro == null){
    print('O livro escolhido não existe');
    return;
  }

  print('E qual usuário contém o livro?\n');
  biblioteca.listarUsuarios();

  stdout.write('Informe o código do livro: ');
  var idDoUsuario = stdin.readLineSync();

  int? idUsuario = int.tryParse(idDoUsuario ?? "");

  Usuario? usuario = biblioteca.getUsuarioById(idUsuario!);

  if(usuario == null){
    print('O usuário escolhido não existe');
    return;
  }

  biblioteca.devolverLivroEmprestado(livro, usuario);
}

void listarLivrosDisponiveis(){

  print('\n--------------- Listar Livros disponíveis ---------------\n');

  biblioteca.listarLivrosDisponiveis();
}

void listarLivrosEmprestados(){

  print('\n--------------- Listar Livros Emprestados ---------------\n');

  biblioteca.listarLivrosEmprestados();
}

void listarLivroPorAutor(){

  print('\n--------------- Listar Livros por Autor ---------------\n');

  if(biblioteca.contemAutores()){
    print('Não há autores cadastrados ainda!');
    return;
  }

  print('De qual o autor que deseja obter o livro?\n');
  biblioteca.listarAutores();

  stdout.write('Informe o código do Autor: ');
  var idDoAutor = stdin.readLineSync();

  int? id = int.tryParse(idDoAutor ?? "");

  Autor? autor = biblioteca.getAutorById(id!);

  if(autor == null){
    print('O autor escolhido não existe');
    return;
  }

  biblioteca.listarLivroPorAutor(autor);

}

Biblioteca biblioteca = Biblioteca();

void main(List<String> arguments) {
  int? escolha;
  
  do{
    print('\nEscolha o que deseja fazer:');
    print('1 -- Cadastrar Autor');
    print('2 -- Cadastrar Livro');
    print('3 -- Cadastrar Usuário');
    print('4 -- Emprestar Livro');
    print('5 -- Devolver Livro');
    print('6 -- Listar Livros Disponíveis');
    print('7 -- Listar Livros Emprestados');
    print('8 -- Listar livros Por Autor');
    print('0 -- Sair');
    stdout.write('Opção: ');
    var escolhaDoUsuario = stdin.readLineSync();
    if(escolhaDoUsuario != null){
      escolha = int.tryParse(escolhaDoUsuario);
    }

    switch(escolha){
      case 1:
        cadastrarAutor();
      case 2:
        cadastrarLivro();
      case 3:
        cadastrarUsuario();
      case 4:
        emprestarLivro();
      case 5:
        devolverLivro();
      case 6:
        listarLivrosDisponiveis();
      case 7:
        listarLivrosEmprestados();
      case 8:
        listarLivroPorAutor();
      case 0:
        break;
      default:
        print('Opção inválida');
    }

  }while(escolha != 0);


  print('Volte sempre!');
}

