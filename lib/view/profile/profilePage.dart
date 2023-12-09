import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon:const Icon(Icons.logout),
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
          const  CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
       const     SizedBox(height: 20),
            ListTile(
              title:const Text('Username'),
              subtitle:const Text('sanjeev'),
              trailing: IconButton(
                icon:const Icon(Icons.edit),
                onPressed: () {
                  // Implement edit username functionality
                },
              ),
            ),

            ListTile(
              title:const Text('Phone Number'),
              subtitle:const Text('1234567890'),
              trailing: IconButton(
                icon:const Icon(Icons.edit),
                onPressed: () {
                  // Implement edit username functionality
                },
              ),
            ),
            ListTile(
              title:const Text('Consumer Number (Electricity)'),
              subtitle:const Text('1234567890'),
              trailing: IconButton(
                icon:const Icon(Icons.edit),
                onPressed: () {
                  // Implement edit electricity consumer number functionality
                },
              ),
            ),
            ListTile(
              title:const Text('Consumer Number (Water)'),
              subtitle:const Text('0987654321'),
              trailing: IconButton(
                icon:const Icon(Icons.edit),
                onPressed: () {
                  // Implement edit water consumer number functionality
                },
              ),
            ),
            ListTile(
              title:const Text('Choose Electricity Board'),
              subtitle:const Text('Board ABC'),
              trailing: IconButton(
                icon:const Icon(Icons.edit),
                onPressed: () {
                  // Implement choose electricity board functionality
                },
              ),
            ),
            // Spacer(),
            ElevatedButton(
              onPressed: () {
                // Implement save changes functionality
              },
              child:const Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
