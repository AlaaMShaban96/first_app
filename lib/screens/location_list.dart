import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_app/screens/home.dart';
import '../mocks/mocks_location.dart';
import '../models/location.dart';
class LocationList extends StatelessWidget {
  final List<Location>  locations = MocksLocation.fetchAll()   ;

  LocationList({super.key});

  @override
  Widget build(BuildContext context) {

    return  list();
  }
  Widget _add(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(Icons.menu),
        SizedBox(
          width: 40.0,
          height: 40.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(500.0),
            child:Image.network("https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?cs=srgb&dl=pexels-pixabay-220453.jpg&fm=jpg"),
          )
        )
      ],
    );

  }

  Widget list(){
    return ListView.builder(
        itemCount:  locations.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: _imageWidget(locations[index]),
            title: _nameWidget(locations[index]),
            onTap: (){
                if (kDebugMode) {
                  print("this location tap it ${locations[index].name }");
                }
                Navigator.push(context, MaterialPageRoute(
                    builder:(context)=>Home(location: locations[index])
                ));
            },
            
          );
        } ,
    );
  }
  Widget _imageWidget (Location location){
    return
      Container(
        width: 50.0,
        padding: const EdgeInsets.all(2.0),
        // constraints: BoxConstraints.tightFor(width: 100.0),
        child:ClipRRect(
          // borderRadius: BorderRadius.circular(200.0),
          child: Image.network(location.url),
        ),
      );

  }
  Widget _nameWidget (Location location){
    return Text(location.name);
  }
}
