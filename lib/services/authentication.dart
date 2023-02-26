import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthenticationRepository {
  Future<void> login(String phoneNumber, String password);
  Future<void> register(String phoneNumber, String password);
  Future<bool> isAuthenticated();
}

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final http.Client _httpClient;
  final String _baseUrl;
  final SharedPreferences _preferences;

  AuthenticationRepositoryImpl({
    required http.Client httpClient,
    required String baseUrl,
    required SharedPreferences preferences,
  })  : _httpClient = httpClient,
        _baseUrl = baseUrl,
        _preferences = preferences;

  @override
  Future<String?> login(String phoneNumber, String password) async {
    final loginUrl = '$_baseUrl/login';
    final response = await _httpClient.post(
      Uri.parse(loginUrl),
      body: {'email': phoneNumber, 'password': password},
    );

    if (response.statusCode == 200) {
      // Store the user's token in SharedPreferences
      await _preferences.setString('auth_token', response.body);

      return response.body;
    } else {
      throw Exception('Failed to authenticate');
    }
  }

  @override
  Future<bool> isAuthenticated() async {
    // Check if the user's token exists in SharedPreferences
    final authToken = _preferences.getString('auth_token');
    return authToken != null;
  }

  @override
  Future<void> register(String phoneNumber, String password) async {
    final registerUrl = '$_baseUrl/register';
    final response = await _httpClient.post(
      Uri.parse(registerUrl),
      body: {'phone_number': phoneNumber, 'password': password},
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to register');
    }
  }
}
