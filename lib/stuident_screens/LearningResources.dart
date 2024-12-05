import 'package:flutter/material.dart';

class LearningResourcesScreen extends StatelessWidget {
  final List<Map<String, String>> resources = [
    {
      'title': 'Flutter Documentation',
      'category': 'Article',
      'url': 'https://flutter.dev/docs',
      'description': 'Official documentation to learn Flutter.',
      'image': 'https://flutter.dev/assets/flutter-logo-sharing-4c24c17b6fcae60e664b3c3d1fdb3b21bc7d7f81a3fa927a8c55d9e5d72669ea.png'
    },
    {
      'title': 'Flutter YouTube Tutorials',
      'category': 'Video',
      'url': 'https://www.youtube.com/c/FlutterDev',
      'description': 'Watch tutorials and build apps with Flutter.',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/a/a0/Flutter_logo_2021.svg'
    },
    {
      'title': 'Complete Flutter Guide',
      'category': 'Tutorial',
      'url': 'https://www.tutorialspoint.com/flutter/index.htm',
      'description': 'Step-by-step Flutter guide for beginners.',
      'image': 'https://www.tutorialspoint.com/flutter/images/flutter.jpg'
    },
  ];

  LearningResourcesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learning Resources'),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: ResourceSearchDelegate());
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Explore Learning Resources',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: resources.length,
                itemBuilder: (context, index) {
                  final resource = resources[index];
                  return Card(
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(10.0),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(resource['image']!),
                        radius: 30,
                      ),
                      title: Text(
                        resource['title']!,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        resource['category']!,
                        style: const TextStyle(fontSize: 14, color: Colors.blueGrey),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.arrow_forward, color: Colors.blue),
                        onPressed: () {
                          // Open resource URL (could be in browser or app)
                          print('Opening ${resource['url']}');
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResourceSearchDelegate extends SearchDelegate {
  final List<Map<String, String>> resources = [
    {
      'title': 'Flutter Documentation',
      'category': 'Article',
      'url': 'https://flutter.dev/docs',
      'description': 'Official documentation to learn Flutter.',
      'image': 'https://flutter.dev/assets/flutter-logo-sharing-4c24c17b6fcae60e664b3c3d1fdb3b21bc7d7f81a3fa927a8c55d9e5d72669ea.png'
    },
    {
      'title': 'Flutter YouTube Tutorials',
      'category': 'Video',
      'url': 'https://www.youtube.com/c/FlutterDev',
      'description': 'Watch tutorials and build apps with Flutter.',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/a/a0/Flutter_logo_2021.svg'
    },
    {
      'title': 'Complete Flutter Guide',
      'category': 'Tutorial',
      'url': 'https://www.tutorialspoint.com/flutter/index.htm',
      'description': 'Step-by-step Flutter guide for beginners.',
      'image': 'https://www.tutorialspoint.com/flutter/images/flutter.jpg'
    },
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<Map<String, String>> results = resources
        .where((resource) => resource['title']!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final resource = results[index];
        return Card(
          elevation: 5,
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: ListTile(
            contentPadding: const EdgeInsets.all(10.0),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(resource['image']!),
              radius: 30,
            ),
            title: Text(
              resource['title']!,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              resource['category']!,
              style: const TextStyle(fontSize: 14, color: Colors.blueGrey),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.arrow_forward, color: Colors.blue),
              onPressed: () {
                // Open resource URL (could be in browser or app)
                print('Opening ${resource['url']}');
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<Map<String, String>> suggestions = resources
        .where((resource) => resource['title']!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final resource = suggestions[index];
        return Card(
          elevation: 5,
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: ListTile(
            contentPadding: const EdgeInsets.all(10.0),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(resource['image']!),
              radius: 30,
            ),
            title: Text(
              resource['title']!,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              resource['category']!,
              style: const TextStyle(fontSize: 14, color: Colors.blueGrey),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.arrow_forward, color: Colors.blue),
              onPressed: () {
                // Open resource URL (could be in browser or app)
                print('Opening ${resource['url']}');
              },
            ),
          ),
        );
      },
    );
  }
}
