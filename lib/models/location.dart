import 'location_details.dart';
class Location {
   final String name;
   final String url;
   final List<LocationDetails> details;

   const Location({required this.name, required this.url, required this.details});
}