// ignore_for_file: unused_field

class PostModel1 {
//  ?  =>  hepsi null gelebilir

  int? userId;
  int? id;
  String? title;
  String? body;

  // initialize
}

class PostModel2 {
  int userId;
  int id;
  String title;
  String body;

// Constructer oluşturmak

  PostModel2(this.userId, this.id, this.title, this.body);

  // initialize
}

class PostModel3 {
  // Varebiller sadece constructur zamanında gelir.
  final int userId;
  final int id;
  final String title;
  final String body;

  PostModel3(this.userId, this.id, this.title, this.body);

  // initialize
}

class PostModel4 {
  // İsimli parametreler alabilir..
  final int userId;
  final int id;
  final String title;
  final String body;

  PostModel4({required this.userId, required this.id, required this.title, required this.body});

  // initialize
}

class PostModel5 {
  // private . DIşarıdan doğrudan nesnelere erişemez.
  final int _userId;
  final int _id;
  final String _title;
  final String _body;

  int get userId => _userId; // Encapsülation alanını verir.DIşarıdan userId 'ye erişilir.

  PostModel5({
    required int userId,
    required int id,
    required String title,
    required String body,
  })  : _userId = userId,
        _id = id,
        _title = title,
        _body = body;
}

class PostModel6 {
  // private . DIşarıdan doğrudan nesnelere erişemez.

  late final int _userId;
  late final int _id;
  late final String _title;
  late final String _body;

  PostModel6({
    required int userId,
    required int id,
    required String title,
    required String body,
  }) {
    _userId = userId;
    _id = id;
    _title = title;
    _body = body;
  }
}

class PostModel7 {
  // private . DIşarıdan doğrudan nesnelere erişemez.
  late final int _userId;
  late final int _id;
  late final String _title;
  late final String _body;

  PostModel7({
    int userId = 0,
    int id = 0,
    String title = '',
    String body = '',
  }) {
    _userId = userId;
    _id = id;
    _title = title;
    _body = body;
  }
}

class PostModel8 {
  final int? userId;
  final int? id;
  final String? title;
  String? body;

  PostModel8({this.userId, this.id, this.title, this.body});

  void updateBody(String? data) {
    if (data != null && data.isNotEmpty) {
      body = data;
    }
  }

  PostModel8 copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) {
    return PostModel8(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }
}
