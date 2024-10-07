import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  final List<Map<String, String>> dummyNews = [
    {
      'title': 'Breaking News: Flutter 3.0 Released!',
      'description': 'Flutter 3.0 is packed with new features, performance improvements, and more.',
      'pubDate': 'October 3, 2024',
    },
    {
      'title': 'Tech Giants Join Forces',
      'description': 'Major tech companies are collaborating on a new AI initiative to improve global connectivity.',
      'pubDate': 'October 2, 2024',
    },
    {
      'title': 'Stock Market Hits Record High',
      'description': 'The stock market reaches new heights amid optimism about economic recovery.',
      'pubDate': 'October 1, 2024',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: dummyNews.length,
        itemBuilder: (context, index) {
          final newsItem = dummyNews[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    newsItem['title']!,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    newsItem['description']!,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Published on: ${newsItem['pubDate']!}',
                    style: TextStyle(
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
