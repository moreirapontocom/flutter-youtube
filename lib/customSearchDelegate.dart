import 'package:flutter/material.dart';

// O tipo String é o que a SearchDelegate espera receber

class CustomSearchDelegate extends SearchDelegate<String> {

  // Nenhum método abaixo pode retornar null
  // Ao extender a SearchDelegate, os métodos criados automaticamente retornam null mas não pode

  @override
  List<Widget> buildActions(BuildContext context) {

    // Ações da pesquisa (botão X para limpar o texto digitado) e outros botões
    // É possível adicionar qualquer botão (ícone)
    // Fica ao lado direito

    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {

    // Botão de voltar (sair da pesquisa)
    // Fica ao lado esquerdo

    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        // Navigator.pop(context); // Fecha a pesquisa mas não tem como passar dados pra tela de trás
        // O null é pra passar parâmetros pra tela de trás
        close(context, "");
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {

    // Chamado quando o usuário aperta o botão para pesquisar
    // A lupa do Android ou o Submit do iOS
    // Usando query pode-se acessar o que está na pesquisa

    close(context, query);

    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    // Chamado a cada tecla que o usuário pressiona
    // Usando query pode-se acessar o que está na pesquisa

    return Container();
  }
  
}