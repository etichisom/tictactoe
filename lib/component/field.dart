import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tictactoe/model/player.dart';

class Field extends StatelessWidget {
 int x;
 int y;
 String value;
 final BorderSide _borderSide =const BorderSide(
     color:Color.fromRGBO(56, 59, 89, 1),
     width: 1.5,
     style: BorderStyle.solid
 );
 Field({this.x,this.y,this.value});

  @override
  Widget build(BuildContext context) {
    check();
    return Container(
        margin: const EdgeInsets.all(0.0),
        decoration: BoxDecoration(
         border:determineBorder()
      ), child: Center(
       child: Center(child:Padding(
         padding: const EdgeInsets.all(3.0),
         child: wid(),
       )))
    );
  }
 Border determineBorder() {
   Border determinedBorder = Border.all();

   switch(check()) {
     case 0:
       determinedBorder = Border(bottom: _borderSide, right: _borderSide);
       break;
     case 1:
       determinedBorder = Border(left: _borderSide, bottom: _borderSide, right: _borderSide);
       break;
     case 2:
       determinedBorder = Border(left: _borderSide, bottom: _borderSide);
       break;
     case 3:
       determinedBorder = Border(bottom: _borderSide, right: _borderSide, top: _borderSide);
       break;
     case 4:
       determinedBorder = Border(left: _borderSide, bottom: _borderSide, right: _borderSide, top: _borderSide);
       break;
     case 5:
       determinedBorder = Border(left: _borderSide, bottom: _borderSide, top: _borderSide);
       break;
     case 6:
       determinedBorder = Border(right: _borderSide, top: _borderSide);
       break;
     case 7:
       determinedBorder = Border(left: _borderSide, top: _borderSide, right: _borderSide);
       break;
     case 8:
       determinedBorder = Border(left: _borderSide, top: _borderSide);
       break;
   }

   return determinedBorder;
 }

  int check() {
    if(x==0&&y==0){
      return 0;
    }else if(y==0&&x==1){
      return 1;
    }else if(y==0&&x==2){
      return 2;
    }else if(y==1&&x==0){
      return 3;
    }else if(y==1&&x==1){
     return 4;
    }else if(y==1&&x==2){
     return 5;
    }else if(y==2&&x==0){
      return 6;
    }else if(y==2&&x==1){
     return 7;
    }else if(y==2&&x==2){
     return 8;
    }else{
      return 8;
    }
  }

  String text(String value) {
    if(value==Player.x){
     return Player.x;
    }else if(value==Player.o){
      return Player.o;
    }else{
      return '';
    }
  }

 Widget wid() {
    if(value==Player.x){
      return SvgPicture.asset('assest/x.svg');
    }else if(value==Player.o){
      return SvgPicture.asset('assest/O.svg');
    }else{
      Text('');
    }
 }
}
