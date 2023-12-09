import 'package:electricity/models/userDataModel.dart';
import 'package:electricity/services/userDataServices.dart';
import 'package:flutter/material.dart';

class YourWidget extends StatefulWidget {
  @override
  _YourWidgetState createState() => _YourWidgetState();
}

class _YourWidgetState extends State<YourWidget> {
  final UserService _userService = UserService();
  UserData? _userData;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    final userData = await _userService.getUserData();
    if (userData != null) {
      setState(() {
        _userData = userData;
      });
    } else {
      // Handle error fetching data
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: _userData != null
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Full Name: ${_userData!.fullName}'),
                Text('Phone Number: ${_userData!.phoneNo}'),
                Text('Electric Consumer No: ${_userData!.electricConsumerNo}'),
                Text('Water Consumer No: ${_userData!.waterConsumerNo}'),
              ],
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
