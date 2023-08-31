import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Health extends StatelessWidget {
  Health({Key? key}) : super(key: key);

  final List<Map<String, String>> assistiveDevices = [
    {
      'name': 'Hearing Aids',
      'amazonLink':
      'https://www.amazon.com/s?k=hearing+aids',
    },
    {
      'name': 'Walker',
      'amazonLink':
      'https://www.amazon.com/s?k=walker',
    },
    {
      'name': 'Wheelchair',
      'amazonLink':
      'https://www.amazon.com/s?k=wheelchair',
    },
    {
      'name': 'Cane',
      'amazonLink':
      'https://www.amazon.com/s?k=cane',
    },
    {
      'name': 'Grab Bars',
      'amazonLink':
      'https://www.amazon.com/s?k=grab+bars',
    },
    {
      'name': 'Shower Chair',
      'amazonLink':
      'https://www.amazon.com/s?k=shower+chair',
    },
    {
      'name': 'Stair Lift',
      'amazonLink':
      'https://www.amazon.com/s?k=stair+lift',
    },
    {
      'name': 'Reacher',
      'amazonLink':
      'https://www.amazon.com/s?k=reacher',
    },
    {
      'name': 'Orthopedic Shoes',
      'amazonLink':
      'https://www.amazon.com/s?k=orthopedic+shoes',
    },
    // Add more assistive devices as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assistive Devices for Elderly'),
      ),
      body: ListView.builder(
        itemCount: assistiveDevices.length,
        itemBuilder: (ctx, index) {
          final device = assistiveDevices[index];
          return ListTile(
            leading: Icon(Icons.arrow_right),
            title: Text(device['name'] ?? ''),
            trailing: Icon(Icons.link),
            onTap: () {
              _launchURL(device['amazonLink']);
            },
          );
        },
      ),
    );
  }

  void _launchURL(String? url) async {
    if (url != null && await canLaunch(url)) {
      await launch(url);
    } else {
      // Handle errors, e.g., URL can't be launched
      print('Could not launch $url');
    }
  }
}
