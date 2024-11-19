import 'package:flutter/material.dart';



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PageViewExample(),
    );
  }
}

class PageViewExample extends StatefulWidget {
  @override
  _PageViewExampleState createState() => _PageViewExampleState();
}

class _PageViewExampleState extends State<PageViewExample> {
  PageController _pageController = PageController();
  int _currentPage = 0;
  double _buttonWidth = 50.0;
  bool _isAnimating = false;

  List<String> _pages = [
    'Page 1',
    'Page 2',
    'Page 3',
    'Page 4',
  ];

  void _animateAndMoveToNextPage() {
    setState(() {
      _buttonWidth = _isAnimating ? 50.0 : 150.0;
      _isAnimating = !_isAnimating;
    });

    Future.delayed(Duration(milliseconds: 300), () {
      if (_currentPage < _pages.length - 1) {
        _pageController.nextPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("PageView.builder Example")),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _pages.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                  _buttonWidth = 50.0;  // Reset button width on page change
                  _isAnimating = false;
                });
              },
              itemBuilder: (context, index) {
                return Center(
                  child: Text(
                    _pages[index],
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              onTap: _animateAndMoveToNextPage,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                width: _buttonWidth,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(25),
                ),
                alignment: Alignment.center,
                child: Text(
                  _currentPage < _pages.length - 1 ? "Next" : "Done",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
