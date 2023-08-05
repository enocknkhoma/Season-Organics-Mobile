import 'package:flutter/material.dart';
import 'package:season/view/authentication/authentication.dart';
import 'package:season/view/main/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserManagement {
  Future<Widget> handleAuth() async {
    // Check if user is already logged in using SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (isLoggedIn) {
      return Dashboard(); // User is already logged in, show dashboard
    } else {
      // Make API request to check user's authentication status
      final apiResponse = await fetchUserAuthenticationStatus();

      if (apiResponse['authenticated'] == true) {
        prefs.setBool('isLoggedIn', true);
        return Dashboard(); // User is authenticated, show dashboard
      } else {
        return Authentication(); // User is not authenticated, show login page
      }
    }
  }

  Future<Map<String, dynamic>> fetchUserAuthenticationStatus() async {
    final response = await http.get(Uri.parse('YOUR_API_URL'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch user authentication status');
    }
  }
}
