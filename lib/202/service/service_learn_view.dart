// ignore_for_file: unused_field

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import './post_service.dart';
import './post_model.dart';

class ServiceLearn extends StatefulWidget {
  const ServiceLearn({super.key});

  @override
  State<ServiceLearn> createState() => _ServiceLearnState();
}

class _ServiceLearnState extends State<ServiceLearn> {
  List<PostModel>? _items;
  String? name;
  bool _isLoading = false;
  // late final Dio _networkManager;
  late final Dio _dio;
  final _baseUrl = 'https://jsonplaceholder.typicode.com/';

// TEST EDİLEBİLİR KOD BAŞLADI
  late final IPostService _postService;

  @override
  void initState() {
    super.initState();
    // _networkManager = Dio(BaseOptions(baseUrl: _baseUrl));
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
    _postService = PostService();
    name = 'DevOps';
    // fetchPostItems();
    fetchPostItemsAdvance();
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> fetchPostItemsAdvance() async {
    _changeLoading();
    _items = await _postService.fetchPostItemsAdvance();
    _changeLoading();
  }

  // Future<void> fetchPostItemsAdvance() async {
  //   _changeLoading();
  //   final response = await _dio.get('posts');
  //   // print(response.statusCode);
  //   if (response.statusCode == HttpStatus.ok) {
  //     final datas = response.data;

  //     if (datas is List) {
  //       setState(() {
  //         _items = datas.map((e) => PostModel.fromJson(e)).toList();
  //       });
  //     }
  //   }
  //   _changeLoading();
  // }

  // Future<void> fetchPostItems() async {
  //   _changeLoading();
  //   final response =
  //       await Dio().get('https://jsonplaceholder.typicode.com/posts');
  //   // print(response.statusCode);
  //   if (response.statusCode == HttpStatus.ok) {
  //     final datas = response.data;

  //     if (datas is List) {
  //       setState(() {
  //         _items = datas.map((e) => PostModel.fromJson(e)).toList();
  //       });
  //     }
  //   }
  //   _changeLoading();
  // }

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
      body: _items == null
          ? const Placeholder()
          : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: _items?.length ?? 0,
              itemBuilder: (context, index) {
                return _PostCard(model: _items?[index]);
              },
            ),
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
