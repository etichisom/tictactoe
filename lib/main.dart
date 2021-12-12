import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/ui/gameboard.dart';

import 'bloc/gamebloc.dart';

void main() {
  runApp(
      MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => Gamebloc()),

  ],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:Board(),
    );
  }
}
