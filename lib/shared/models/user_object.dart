import 'package:json_annotation/json_annotation.dart';
import 'package:login_component/shared/models/user.dart';

import 'customer.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'user_object.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()

class UserObject {
  UserObject(this.customer, this.user, this.access_token, this.refresh_token,
      this.accessTokenExpiration , this.refreshTokenExpiration);

  Customer customer;
  User user;
  String access_token;
  String refresh_token;
  DateTime accessTokenExpiration;
  String refreshTokenExpiration;

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory UserObject.fromJson(Map<String, dynamic> json) => _$UserObjectFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$UserObjectToJson(this);
}


class UserSingleton {
  static final UserSingleton _instance = UserSingleton._internal();
  factory UserSingleton() => _instance;

  UserSingleton._internal() {
    // init things inside this
  }

  UserObject userObject;

}