import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  final PageController _pageController = PageController();

  late List<Widget> page=[];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('PageView.builder Example'),
        ),
        body: PageView.builder(
          controller: _pageController,
          itemCount: 3,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  height: 400,
                  color: Colors.primaries[index % Colors.primaries.length],
                  child: Center(
                    child: Text(
                      'Page $index',
                      style: const TextStyle(fontSize: 32, color: Colors.white),
                    ),
                  ),
                ),
                const Text('hii'),
              ],
            );
          },
        ),
        
      ),
    );
  }

  Widget pageview(){
    return PageView.builder(
      controller: _pageController,
      itemCount: 3,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Container(
              height: 400,
              color: Colors.primaries[index % Colors.primaries.length],
              child: Center(
                child: Text(
                  'Page $index',
                  style: const TextStyle(fontSize: 32, color: Colors.white),
                ),
              ),
            ),
            const Text('hii'),
          ],
        );
      },
    );
  }
}

