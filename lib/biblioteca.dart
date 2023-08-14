import 'autor.dart';
import 'livro.dart';
import 'usuario.dart';

class Biblioteca{
  final List<Livro> _livros;
  final List<Autor> _autores;
  final List<Usuario> _usuarios;

  Biblioteca() : _livros = [], _autores = [], _usuarios = [];

  void cadastrarLivro(String titulo, Autor autor, int anoDePublicacao){
    Livro novoLivro = Livro(titulo, autor, anoDePublicacao);
    _livros.add(novoLivro);
    autor.livros.add(novoLivro);
    print('\nLivro cadastrado com Sucesso! --> ${novoLivro.titulo} - ${novoLivro.autor.nome} - ${novoLivro.anoDePublicacao}');
  }

  void cadastrarAutor(String nome, DateTime dataDeNascimento){
    Autor novoAutor = Autor(nome, dataDeNascimento);
    _autores.add(novoAutor);

    print('\nAutor cadastrado com sucesso! --> ${novoAutor.nome} - ${novoAutor.dataDeNascimento}');
  }

  void cadastrarUsuario(String nome, String endereco){
    Usuario novoUsuario = Usuario(nome, endereco);
    _usuarios.add(novoUsuario);

    print('\nUsuário cadastrado com sucesso! --> ${novoUsuario.nome} - ${novoUsuario.endereco}');
  }

  void listarLivrosDisponiveis(){

    if(_livros.isEmpty){
      print('\nNão há livros cadastrados ainda!');
      return;
    }

    print('Livros Disponíveis');
    for(var livro in _livros){
      if(livro.disponivel){
        print('${livro.id} --> ${livro.titulo} - ${livro.autor.nome} - ${livro.anoDePublicacao}');
      }
    }
  }

  void listarLivrosEmprestados(){

    if(_livros.isEmpty){
      print('\nNão há livros cadastrados ainda!');
      return;
    }

    print('Livros Emprestados');
    for(var livro in _livros){
      if(!livro.disponivel){
        print('${livro.id} --> ${livro.titulo} - ${livro.autor.nome} - ${livro.anoDePublicacao}');
      }
    }
  }

  void listarLivroPorAutor(Autor autor){

    if(_livros.isEmpty){
      print('\nNão há livros cadastrados ainda!');
      return;
    }

    print('Livros do autor: ${autor.nome}');
    for(var livro in autor.livros){
      print('${livro.id} --> ${livro.titulo} - ${livro.autor.nome} - ${livro.anoDePublicacao}');
    }
  }


  void adicionarLivroEmprestado(Livro livro, Usuario usuario){

    if(_livros.isEmpty){
      print('\nNão há livros cadastrados ainda!');
      return;
    }

    if(livro.disponivel){
      livro.disponivel = false;
      usuario.livrosEmprestados.add(livro);
      print('\nLivro adicionado à lista de livros emprestados.');
    } else{
      print('\nO livro ${livro.titulo} já está emprestado!');
    }
  }

  void devolverLivroEmprestado(Livro livro, Usuario usuario){

    if(_livros.isEmpty){
      print('\nNão há livros cadastrados ainda!');
      return;
    }

      if(!livro.disponivel && usuario.livrosEmprestados.contains(livro)){
        livro.disponivel = true;
        usuario.livrosEmprestados.remove(livro);
        print('\nO livro ${livro.titulo} foi devolvido.');
      } else {
        print('\nO livro ${livro.titulo} não está emprestado para o usuário ${usuario.nome}');
      }
  }

  bool contemAutores(){
    return !_autores.isNotEmpty;
  }

  void listarAutores(){
    for(var autor in _autores){
      print(' ${autor.id} --> ${autor.nome} - ${autor.dataDeNascimento}');
    }
  }

  void listarUsuarios(){
    for(var usuario in _usuarios){
      print('${usuario.id} --> ${usuario.nome} - ${usuario.endereco}');
    }
  }

  Autor? getAutorById(int id){
    for (var autor in _autores){
      if(autor.id == id){
        return autor;
      }
    }

    return null;
  }

  Livro? getLivroById(int id){
    for(var livro in _livros){
      if(livro.id == id){
        return livro;
      }
    }

    return null;
  }

  Usuario? getUsuarioById(int id){
    for(var usuario in _usuarios){
      if(usuario.id == id){
        return usuario;
      }
    }
    return null;
  }
}