import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Implement logout functionality
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
            SizedBox(height: 20),
            ListTile(
              title: Text('Username'),
              subtitle: Text('sanjeev'),
              trailing: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  // Implement edit username functionality
                },
              ),
            ),
            ListTile(
              title: Text('Consumer Number (Electricity)'),
              subtitle: Text('1234567890'),
              trailing: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  // Implement edit electricity consumer number functionality
                },
              ),
            ),
            ListTile(
              title: Text('Consumer Number (Water)'),
              subtitle: Text('0987654321'),
              trailing: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  // Implement edit water consumer number functionality
                },
              ),
            ),
            ListTile(
              title: Text('Choose Electricity Board'),
              subtitle: Text('Board ABC'),
              trailing: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  // Implement choose electricity board functionality
                },
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Implement save changes functionality
              },
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}

