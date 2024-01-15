enum ProfileItems { account, logout }

extension ProfileItemsExtension on ProfileItems {
  String get title {
    switch (this) {
      case ProfileItems.account:
        return "Account Details";
      case ProfileItems.logout:
        return "Logout";
    }
  }
}
