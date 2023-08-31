import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class EmergencyContacts extends StatelessWidget {
  EmergencyContacts({Key? key}) : super(key: key);

  final List<Map<String, String>> emergencyContacts = [
    {
      'name': 'Medical Emergency',
      'phoneNumber': '108',
    },
    {
      'name': 'Elder Helpline',
      'phoneNumber': '14567',
    },
    {
      'name': 'Ambulance Assistance',
      'phoneNumber': '102',
    },
    {
      'name': 'Police Assistance',
      'phoneNumber': '100',
    },
    {
      'name': 'Fire Department',
      'phoneNumber': '101',
    },
    {
      'name': 'Women Helpline',
      'phoneNumber': '1091',
    },
    // You can add more contacts as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Contacts'),
      ),
      body: ListView.builder(
        itemCount: emergencyContacts.length,
        itemBuilder: (ctx, index) {
          final contact = emergencyContacts[index];
          return ListTile(
            title: Text(contact['name'] ?? '',style: TextStyle(fontWeight: FontWeight.bold),),
            subtitle: Text(contact['phoneNumber'] ?? ''),
            trailing: IconButton(
              icon: Icon(Icons.phone,color: Colors.green,),
              onPressed: () {
                _makePhoneCall(contact['phoneNumber']);
              },
            ),
          );
        },
      ),
    );
  }

  void _makePhoneCall(String? phoneNumber) async {
    if (phoneNumber != null) {
      await FlutterPhoneDirectCaller.callNumber(phoneNumber);
    } else {
      // Handle cases where the phone number is null or take other appropriate actions.
    }
  }
}
