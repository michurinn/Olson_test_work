import 'package:olkon_test_work/features/authentication/data/model/user.dart';

abstract class IUserStorage {
  Stream<User> getUserStream();
  User getCurrentUser();
  void setCurrentUser(User user);
}
