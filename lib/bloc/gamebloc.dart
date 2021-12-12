import 'package:flutter/cupertino.dart';
import 'package:tictactoe/model/player.dart';

class Gamebloc extends ChangeNotifier{
  List<List<String>> matrix ;

  var lastmove = Player.o;
  setmatrix(int x,int y,String player){
    matrix[y][x]=lastmove==Player.o?Player.x:Player.o;
    notifyListeners();
  }
  setlastmove(String last){
    lastmove= last;
    notifyListeners();
  }
  setgame(int length){
    matrix=List.generate(length, (index) =>
        List.generate(length, (ind) =>Player.none));
    notifyListeners();
  }
}