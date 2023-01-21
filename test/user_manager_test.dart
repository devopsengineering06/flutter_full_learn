// ignore_for_file: unused_local_variable

import 'package:flutter_full_learn/303/generic_learn.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});
  test('User calculate ', () {
    final users = [
      const GenericUser('vb', '11', 10),
      const GenericUser('vb', '11', 10),
      const GenericUser('vb', '11', 20),
    ];
    final userManagement = UserManagement(const AdminUser('vadmin', '1', 15, 1));
    final result = userManagement.calculateMoney(users);

    final response = userManagement.showNames<String>(users);

    expect(result, 55);
  });
}
