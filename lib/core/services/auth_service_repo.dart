abstract class AuthServiceRepo {
  /// Create a new user with email and password.
  Future<dynamic> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });

  /// Sign in an existing user with email and password.
  Future<dynamic> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  /// Sign in a user with Google.
  Future<dynamic> signInWithGoogle();

  /// Sign in a user with Facebook.
  Future<dynamic> signInWithFacebook();

  /// Delete the currently signed-in user.
  Future<void> deleteUser();
}
