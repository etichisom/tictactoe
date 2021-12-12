import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/bloc/gamebloc.dart';
import 'package:tictactoe/component/field.dart';
import 'package:tictactoe/model/player.dart';
class Board extends StatelessWidget {
  Gamebloc gamebloc;
  int length = 3;
  @override
  Widget build(BuildContext context) {
    gamebloc = Provider.of<Gamebloc>(context);
    if(gamebloc.matrix==null){
      Future.delayed(Duration(seconds: 1),(){
        gamebloc.setgame(length);
      });
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          SizedBox(width: 50,),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: SvgPicture.asset('assest/game.svg'),
          ),
        ],
      ),
      body:gamebloc.matrix==null?CircularProgressIndicator():Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: 20,
                    width: 30,
                    child: SvgPicture.asset('assest/X.svg')),
                Text('Player1'),
                SizedBox(width: 50,),
                SizedBox(
                    height: 20,
                    width: 30,
                    child: SvgPicture.asset('assest/O.svg')),
                Text('Player1'),
              ],
            ),
            Expanded(flex:1,child: Container(),),
            SizedBox(
                height: 300,
                child:Column(
                    children:[
                      for(int y=0;y<length;y++)
                        Expanded(
                          child: Container(
                            child: Row(
                              children: [
                                for(int x=0;x<length;x++)
                                  Expanded(
                                    child: InkWell(
                                      onTap: (){
                                        play(x, y, gamebloc.matrix[y][x]);
                                      },
                                      child: Container(
                                          child: Field(x: x,y: y,
                                            value:gamebloc.matrix[y][x].toString() ,)),
                                    ),
                                  )
                              ],
                            ),
                          ),
                        )
                    ]
                )
            ),
            Expanded(flex:1,child: Container(),),
          ],
        ),
      ),
    );
  }

  void play(int x, int y, String e) {
  gameend();
    if(e == Player.none){
      gamebloc.setmatrix(x, y, e);
      gamebloc.setlastmove(gamebloc.matrix[y][x]);
    }
    gameend();
  }

  void gameend() {
   bool end = gamebloc.matrix.every((element)
   =>element.every((element) => element!=Player.none));
   print(end);
   if(end){
     Future.delayed(Duration(seconds: 1),(){
       gamebloc.setgame(length);
     });
   }
  }
}
