import 'package:assigned_task/pages/all_news_page.dart';
import 'package:assigned_task/pages/favorite_page.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int _selectedIndex = 0;
  Widget _allNews = AllNews();
  Widget _favorites = Favorites();

  Widget getBody() {
    if (this._selectedIndex == 0) {
      return this._allNews;
    } else {
      return this._favorites;
    }
  }

  void onTapHandler(int index) {
    this.setState(() {
      this._selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: this.getBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this._selectedIndex,
        onTap: (int index) => this.onTapHandler(index),
        selectedFontSize: 20,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.menu,
              color: Colors.black,
              size: 30,
            ),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: Colors.red,
              size: 30,
            ),
            label: 'Favs',
          ),
        ],
      ),
    );
  }
}

/*

 */
/*
Row(
children: [
Expanded(
child: TextButton(
style: TextButton.styleFrom(
backgroundColor: Colors.blue,
padding: const EdgeInsets.fromLTRB(15, 10, 10, 10),
),
onPressed: () {

},
child: Row(
children: [
Icon(
Icons.menu,
size: 30,
color: Colors.black,
),
SizedBox(
width: 10,
),
Text(
'News',
style: TextStyle(
color: Colors.black,
fontSize: 24,
fontWeight: FontWeight.bold),
),
],
),
),
),
SizedBox(
width: 15,
),
Expanded(
child: TextButton(
onPressed: () {},
child: Row(
children: [
Icon(
Icons.favorite,
size: 30,
color: Colors.red,
),
SizedBox(
width: 10,
),
Text(
'Favs',
style: TextStyle(
color: Colors.black,
fontSize: 24,
fontWeight: FontWeight.bold),
),
],
),
),
),
],
),
*/
