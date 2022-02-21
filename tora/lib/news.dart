import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class NewsData with ChangeNotifier {
  List<dynamic> _map = [];
  bool _error = false;
  String _errorMessage = '';

  List get map => _map ;
  bool get error => _error;
  String get errorMessage => _errorMessage;

  Future<void> get fetchdata async {
    final response = await get(
      Uri.parse(
          'https://script.google.com/macros/s/AKfycbz3ZmaMiTgRFOPK8qwdDPgbkzmP4KLq-y70MEE1v9VPz2QtmNzw/exec'),
    );
    if (response.statusCode == 200) {
      try {
        _map = jsonDecode(response.body);
        _error = false;
      } catch (e) {
        _error = true;
        _errorMessage = e.toString();
        _map = [];
      }
    } else {
      _error = true;
      _errorMessage = 'Error :it could be your internet connection ';
      _map = [];
    }
    notifyListeners();
  }

  void initialValues() {
    _map = [];
    _error = false;
    _errorMessage = '';
    notifyListeners();
  }
}
