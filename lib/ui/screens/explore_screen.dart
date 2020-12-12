import 'package:bookee_explore/ui/componets/custom_search_view.dart';
import 'package:bookee_explore/ui/data/model/book.dart';
import 'package:bookee_explore/ui/data/model/popular_books.dart';
import 'package:flutter/material.dart';

class ExploreBookScreen extends StatelessWidget {
  final List<Book> _books = [
    Book(image: "assets/images/fi.png", text: "Fiction"),
    Book(image: "assets/images/planet.png", text: "Science"),
    Book(image: "assets/images/planet.png", text: "Action"),
  ];

  final List<PopularBooks> _popularBooks = [
    PopularBooks(image: "assets/images/img_children_of_ruins.png", text: "Children of Ruin", authorName: "Adrian Ronaldo"),
    PopularBooks(image: "assets/images/img_life_of_pi.png", text: "Life of Pi", authorName: "Tochi Godwill"),
    PopularBooks(image: "assets/images/popular_books.png", text: "Married at 16", authorName: "Robin van bommel"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Bookee explore"),
                  Icon(
                    Icons.history,
                    color: Color(0xFF407BFF),
                  )
                ],
              ),
              SizedBox(height: 16.0),
              Text("Explore \nBooks", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: SearchView(),
                  ),
                  SizedBox(width: 10.0),
                  Container(
                    width: 54,
                    height: 52,
                    decoration: BoxDecoration(color: Color(0xFF407BFF), borderRadius: BorderRadius.circular(10.0)),
                    child: Center(child: Icon(Icons.compare_arrows, color: Colors.white)),
                  ),
                ],
              ),
              SizedBox(height: 40.0),
              _buildPopularBooks(),
              SizedBox(height: 40.0),
              _buildBooksForYou(),
              SizedBox(height: 20.0),
              bookContainer("assets/images/popular_books.png", "Where the Crawdads Sing", "Delia Owens"),
              SizedBox(height: 20.0),
              Stack(
                children: [
                  bookContainer("assets/images/popular_books.png", "The Dutch House", "Ann Patchett"),
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                          child: Container(
                            width: 100,
                            height: 140,
                            child: Column(
                              children: [Image.asset("assets/images/navigation_pana.png"), Text("Bookee Map", style: TextStyle(color: Color(0xFF407BFF)))],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPopularBooks() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Popular books", style: TextStyle(fontSize: 18.0)),
        SizedBox(height: 6.0),
        Container(
          height: 70,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _popularBooks.length,
            itemBuilder: (_, index) {
              final popularBook = _popularBooks[index];
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  elevation: 3.0,
                  child: Container(
                    width: 220,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), image: DecorationImage(image: AssetImage(popularBook.image))),
                          ),
                        ),
                        SizedBox(width: 6.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(popularBook.text, style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal,color: Color(0xff7A7991))),
                            Text(popularBook.authorName, style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal,color: Color(0xff7A7991))),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Widget _buildBooksForYou() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Books for you", style: TextStyle(fontSize: 18.0)),
        SizedBox(height: 6.0),
        Container(
          height: 60,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _books.length,
            itemBuilder: (_, index) {
              Book book = _books[index];
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  color: Colors.white,
                  elevation: 3,
                  child: Container(
                    width: 140,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Image.asset(
                            book.image,
                            width: 30,
                            height: 30,
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Text(book.text, style: TextStyle(color: Color(0xff7A7991),fontSize: 12.0))
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Widget bookContainer(String imageUrl, String title, String authorName) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 3.0,
            child: Container(
              width: 200,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), image: DecorationImage(image: AssetImage(imageUrl))),
                    ),
                  ),
                  SizedBox(width: 6.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(title, style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal, color: Color(0xff7A7991))),
                      Text(authorName, style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal,color: Color(0xff7A7991))),
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}
