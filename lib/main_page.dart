import 'package:flutter/material.dart';
import 'page/school/school.dart';
import 'page/me/me.dart';

class MainPage extends StatefulWidget {
  @override
  State createState() {
    return MainPageState();
  }
}

class MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  PageController pageController;
  int page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('莘莘'),
        centerTitle: true,
      ),
      body: PageView(
        key: Key('MainPage'),
        children: <Widget>[
          School(),
          Me(),
        ],
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(
            icon: new Icon(Icons.school),
            title: new Text('高校'),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.person),
            title: new Text('我的'),
          )
        ],
        currentIndex: page,
        type: BottomNavigationBarType.fixed,
        onTap: onTap,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    pageController = new PageController(initialPage: this.page);
  }

  void onPageChanged(int page) {
    setState(() {
      this.page = page;
    });
  }

  void onTap(int index) {
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 100), curve: Curves.linear);
  }
}
