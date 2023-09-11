import 'package:flutter/material.dart';

import '../models/location.dart';
class Home extends StatelessWidget {
  final Location location;
  const Home({super.key,required this.location});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(location.name),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: testFunction(),

      ),
    );

  }
  List<Widget> testFunction(){
     List<Widget> result =[] ;
    for(int i=0;i< location.details.length;i++){
      // result.add( Text(location.details[i].description));
      result.add(
        SizedBox(
          width:1220.0 ,
          // height: 50.0,
          child: Card(
            margin:const EdgeInsets.fromLTRB(0, 12.0, 0, 0),

            color: Colors.blueGrey,
            child:
                Row(

                  children: [
                    Container(
                      padding:const EdgeInsets.fromLTRB(20.0, 0, 0, 0),

                      child:Text(
                        location.details[i].description,
                        style: const TextStyle(color: Colors.white),
                      ) ,
                    )
                    ,
                     Container(
                      padding:const EdgeInsets.fromLTRB(190.0, 1.0, 0, 0),
                      child:const CircleAvatar(
                        child: CircleAvatar(
                            radius: 100.0,
                            backgroundImage:NetworkImage( 'https://w7.pngwing.com/pngs/44/730/png-transparent-sports-car-cartoon-car-compact-car-car-vehicle.png')
                        ) ,
                      )

                    )
                  ],
                )
          ),
        )

      );

    }
    return result;
  }
}
