import 'package:flutter/material.dart';

class PlaceListScreen  extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions:<Widget> [
          IconButton(
            onPressed: (){},
          
          
           icon: Icon(Icons.add),
           ),
        ],
        
        
        ),
        body: Center(child:CircularProgressIndicator()),
      
    );
  }
}