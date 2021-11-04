import 'package:flutter/material.dart';
import 'package:flutter_crud/provider/users.dart';
import 'package:flutter_crud/routes/app_routes.dart';
import 'package:flutter_crud/views/user_form.dart';
import 'package:flutter_crud/views/user_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //classe users.dart(provider)- provider vai se basear para notificar os itens quando acontecer uma mudança
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) =>
              Users(), //cria um novo changenotifier baseado a partir do users
        ),
      ],
      child: MaterialApp(
          //vai usar a aplicação inteira como child, ou seja, a aplicação inteira vai ter acesso
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          routes: {
            AppRoutes.HOME: (_) => const UserList(),
            AppRoutes.USER_FORM: (_) => const UserForm()
          }),
    );
  }
}
