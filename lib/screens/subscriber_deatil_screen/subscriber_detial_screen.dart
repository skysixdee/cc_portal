import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class SubscriberDetailScreen extends StatelessWidget {
   SubscriberDetailScreen({super.key});
  bool border=false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: border?ButtonBorder():null,
                  child: TextButton(
                    child: Text(
                      'Pack Details',
                      style:GoogleFonts.inter(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      )
                    ),
                    onPressed:(){
                      border=true;
                      ButtonBorder();
                    }, 
                  ),
                ),
                TextButton(
                  style:TextButton.styleFrom(
                    shape:RoundedRectangleBorder(
                      //side:BorderSide(color:Colors.grey)
                    )
                  ),
                  child: Text(
                    'Tone Details',
                    style:GoogleFonts.inter(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    )
                  ),
                  onPressed:(){}, 
                ),
              ],),
              Container(
                height:1,
                color:Colors.grey,
              )
          ],
        ),
          
      ),
    );
  }

  BoxDecoration ButtonBorder() {
    return BoxDecoration(
                  border:Border(
                    top:BorderSide(color:Colors.grey),
                    left:BorderSide(color:Colors.grey),
                    right:BorderSide(color:Colors.grey),
                  ) );
  }
}
