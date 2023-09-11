import '../models/article.dart';

class MocksArticle{
  static List<Article> all(){
    return [
      Article(
        id:1,
        title: "Instagram quietly limits ‘daily time limit’ option",
        author: "MacRumors",
        imageUrl: "https://picsum.photos/id/1000/960/540",
        postedOn: "Yesterday",
      ),
      Article(
          id: 2,
          title: "Google Search dark theme goes fully black for some on the web",
          imageUrl: "https://picsum.photos/id/1010/960/540",
          author: "9to5Google",
          postedOn: "4 hours ago"
      ),
      Article(
        id: 3,
        title: "Check your iPhone now: warning signs someone is spying on you",
        author: "New York Times",
        imageUrl: "https://picsum.photos/id/1001/960/540",
        postedOn: "2 days ago",
      ),
      Article(
        id:4,
        title:
        "Amazon’s incredibly popular Lost Ark MMO is ‘at capacity’ in central Europe",
        author: "MacRumors",
        imageUrl: "https://picsum.photos/id/1002/960/540",
        postedOn: "22 hours ago",
      ),
      Article(
        id: 5,
        title:
        "Panasonic's 25-megapixel GH6 is the highest resolution Micro Four Thirds camera yet",
        author: "Polygon",
        imageUrl: "https://picsum.photos/id/1020/960/540",
        postedOn: "2 hours ago",
      ),
      Article(
        id: 6,
        title: "Samsung Galaxy S22 Ultra charges strangely slowly",
        author: "TechRadar",
        imageUrl: "https://picsum.photos/id/1021/960/540",
        postedOn: "10 days ago",
      ),
      Article(
        id: 7,
        title: "Snapchat unveils real-time location sharing",
        author: "Fox Business",
        imageUrl: "https://picsum.photos/id/1060/960/540",
        postedOn: "10 hours ago",
      ),
    ];
  }
  static Article first(){
    return all()[0];
  }
}