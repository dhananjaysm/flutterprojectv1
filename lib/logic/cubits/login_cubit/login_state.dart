class LoginRegisterState {
  final String phoneNumber;
  final String password;
  final bool isLoading;
  final bool isLoggedIn;
  final bool isRegistration;

  LoginRegisterState({
    required this.phoneNumber,
    required this.password,
    required this.isLoading,
    required this.isLoggedIn,
    required this.isRegistration,
  });

  factory LoginRegisterState.initial() {
    return LoginRegisterState(
      phoneNumber: '',
      password: '',
      isLoading: false,
      isLoggedIn: false,
      isRegistration: false,
    );
  }
}
