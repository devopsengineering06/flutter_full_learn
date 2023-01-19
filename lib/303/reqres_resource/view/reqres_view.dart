import 'dart:developer';

import 'package:flutter/material.dart';

import '../viewModel/reqres_view_model.dart';

class ReqresView extends StatefulWidget {
  const ReqresView({super.key});

  @override
  State<ReqresView> createState() => _ReqresViewState();
}

class _ReqresViewState extends ReqresViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isLoading ? const CircularProgressIndicator() : null,
      ),
      body: ListView.builder(
        itemCount: resources.length,
        itemBuilder: (context, index) {
          // inspect(resources[index]);
          print(resources[index].colorValue);
          return Card(
            color: Color(resources[index].colorValue),
            child: Text(
              resources[index].name ?? '',
            ),
          );
        },
      ),
    );
  }
}
