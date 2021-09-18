import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DatabaseService {

  // Gets the getUsers function from the back-end 
  Future<http.Response> getUsers() { 
  return http.get('http://127.0.0.1:3000/users'); 
}
}