import 'package:flutter/cupertino.dart';

class ReusbaleRow extends StatelessWidget{
  String title, value;

  ReusbaleRow({Key? key,
    required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
   return Padding(
     padding: const EdgeInsets.all(8.0),
     child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
         Text(title),
         Text(value),
       ],
     ),
   );
  }

}