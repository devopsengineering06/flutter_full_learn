import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import './post_model.dart';

class ServicePostLearn extends StatefulWidget {
  const ServicePostLearn({super.key});

  @override
  State<ServicePostLearn> createState() => _ServicePostLearnState();
}

class _ServicePostLearnState extends State<ServicePostLearn> {
  List<PostModel>? _items;
  String? name;
  bool _isLoading = false;
  // late final Dio _networkManager;
  late final Dio _dio;
  final _baseUrl = 'https://jsonplaceholder.typicode.com/';

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  final TextEditingController _userIdController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // _networkManager = Dio(BaseOptions(baseUrl: _baseUrl));
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> _addItemToService(PostModel postModel) async {
    _changeLoading();
    final response = await _dio.post('posts', data: postModel);
    if (response.statusCode == HttpStatus.created) {
      name = 'Başarıyla gönderildi';
    }
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          _isLoading
              ? const CircularProgressIndicator.adaptive()
              : const SizedBox.shrink()
        ],
        title: Text(name ?? ''),
      ),
      body: Column(children: [
        TextField(
            controller: _titleController,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(labelText: 'Title')),
        TextField(
            controller: _bodyController,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(labelText: 'Body')),
        TextField(
            controller: _userIdController,
            keyboardType: TextInputType.number,
            inputFormatters: const [],
            autofillHints: const [AutofillHints.creditCardNumber],
            decoration: const InputDecoration(labelText: 'UserId')),
        TextButton(
          onPressed: _isLoading
              ? null
              : () {
                  if (_titleController.text.isNotEmpty &&
                      _bodyController.text.isNotEmpty &&
                      _userIdController.text.isNotEmpty) {
                    final model = PostModel(
                        body: _bodyController.text,
                        title: _titleController.text,
                        userId: int.tryParse(_userIdController.text));
                    // print(model.userId);
                    _addItemToService(model);
                  }
                },
          child: const Text('Send'),
        )
      ]),
    );
  }
}

class _PostCard extends StatelessWidget {
  const _PostCard({
    Key? key,
    required PostModel? model,
  })  : _model = model,
        super(key: key);

  final PostModel? _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        title: Text(
          _model?.title ?? '',
          style: const TextStyle(color: Colors.red),
        ),
        subtitle: Text(_model?.body ?? ''),
      ),
    );
  }
}
