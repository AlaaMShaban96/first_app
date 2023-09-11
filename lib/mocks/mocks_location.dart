import 'package:test_app/models/location_details.dart';

import '../models/location.dart';
class MocksLocation {
  static List<Location> fetchAll(){
    return [
        Location(
            name: "tripole",
            url: "https://www.shutterstock.com/shutterstock/photos/668593321/display_1500/stock-photo-large-beautiful-drops-of-transparent-rain-water-on-a-green-leaf-macro-drops-of-dew-in-the-morning-668593321.jpg",
            details: <LocationDetails>[
              LocationDetails(description:'description test 1'),
              LocationDetails(description:'description test 2'),
              LocationDetails(description:'description test 3'),
              LocationDetails(description:'description test 4'),
            ]
        ),
        Location(
            name: "musrata",
            url: "https://img.freepik.com/premium-photo/creative-crystal-lens-ball-photography-sunset_602166-2.jpg",
            details: <LocationDetails>[
              LocationDetails(description:'description test 1'),
              LocationDetails(description:'description test 2'),
              LocationDetails(description:'description test 3'),
              LocationDetails(description:'description test 4'),
            ]
        ),
        Location(
            name: "bangaze ",
            url: "https://i.pinimg.com/474x/ea/f9/ff/eaf9fff526d22cf3a4b3a8bb66e3a887.jpg",
            details: <LocationDetails>[
              LocationDetails(description:'description test 1'),
              LocationDetails(description:'description test 2'),
              LocationDetails(description:'description test 3'),
              LocationDetails(description:'description test 4'),
            ]
        ),
        Location(
            name: "nfat",
            url: "https://i.pinimg.com/170x/87/9d/ad/879dadf395e6381bbc1d394313b3e064.jpg",
            details: <LocationDetails>[
              LocationDetails(description:'description test 1'),
              LocationDetails(description:'description test 2'),
              LocationDetails(description:'description test 3'),
              LocationDetails(description:'description test 4'),
            ]
        ),
        Location(
          name: "sbha",
          url: "https://www.neonlightphotography.com/wp-content/uploads/2021/05/work-72504033-canvas-print-480x480.jpg",
          details: <LocationDetails>[
            LocationDetails(description:'description test 1'),
            LocationDetails(description:'description test 2'),
            LocationDetails(description:'description test 3'),
            LocationDetails(description:'description test 4'),
          ]
      ),
    ];
  }
  static Location first(){
    return fetchAll()[0] ;
  }
}