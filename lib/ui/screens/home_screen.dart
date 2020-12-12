import 'package:bookee_explore/ui/screens/explore_screen.dart';
import 'package:bookee_explore/ui/screens/users_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _children = [Container(), ExploreBookScreen(), UsersScreen(), Container()];
  int _currentIndex = 0;

  void _setItem(int pos) {
    setState(() {
      _currentIndex = pos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: _children,
        index: _currentIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFFF4F4F4),
        selectedItemColor: Color(0xFF407BFF),
        unselectedItemColor: Colors.grey,
        onTap: ((int index) => _setItem(index)),
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: SizedBox.shrink()),
          BottomNavigationBarItem(icon: Icon(Icons.explore), title: SizedBox.shrink()),
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.users), title: SizedBox.shrink()),
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.user, size: 20.0), title: SizedBox.shrink()),
        ],
      ),
    );
  }
}
