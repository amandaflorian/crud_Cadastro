import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_crud/data/dummy_users.dart';
import 'package:flutter_crud/models/user.dart';

//controlar lista de usuarios

class Users with ChangeNotifier {
  final Map<String, User> _items = {...dummyUsers};

  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  User byIdex(int i) {
    return _items.values.elementAt(i);
  }

  //insere um elemento dentro do map quando não existe
  //altera um elemento baseado na chave
  // se o elemento não existir ele inclui
  void put(User user) {
    if (user == null) {
      return;
    }

    //alterar, quando tem ID, baseado pela chave
    if (user.id.trim().isNotEmpty && _items.containsKey(user.id)) {
      _items.update(user.id, (_) => user);
    } else {
      //adicionar (quando nao tem ID)
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
          id,
          () => User(
                id: id,
                name: user.name,
                email: user.email,
                avatarUrl: user.avatarUrl,
              ));
    }
    //notifica o provider que houve uma mudança
    //e ele altera a interface gráfica
    notifyListeners();
  }

  //excluir-remover
  void remove(User user) {
    if (user != null && user.id != null) {
      _items.remove(user.id);
      notifyListeners();
    }
  }
}
