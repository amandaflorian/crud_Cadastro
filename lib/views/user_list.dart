import 'package:flutter/material.dart';
import 'package:flutter_crud/components/user_tile.dart';
import 'package:flutter_crud/provider/users.dart';
import 'package:flutter_crud/routes/app_routes.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Usuários'),
        //botão adicionar novo usuário
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes
                  .USER_FORM); //chama uma rota nomeada, quando clicar vai dar um push na tela colocando em cima da tela anterior
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: users.count,
        //contexto pelo indice, mostra valores do elemento indice
        itemBuilder: (ctx, i) => UserTile(users.byIdex(i)),
      ),
    );
  }
}
