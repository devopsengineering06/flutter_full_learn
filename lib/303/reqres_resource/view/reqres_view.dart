import 'package:flutter/material.dart';
import 'package:flutter_learn_full/product/extension/string_extension.dart';
import 'package:flutter_learn_full/product/global/resource_context.dart';
import 'package:flutter_learn_full/product/global/theme_notifier.dart';
import 'package:provider/provider.dart';

import 'package:flutter_learn_full/303/reqres_resource/service/reqres_service.dart';
import 'package:flutter_learn_full/303/reqres_resource/viewModel/reqres_provider.dart';

import '../../../101/scaffold_learn.dart';
import '../../../product/service/project_dio.dart';
import '../model/resource_model.dart';

class ReqresView extends StatefulWidget {
  const ReqresView({super.key});

  @override
  State<ReqresView> createState() => _ReqresViewState();
}

// class _ReqresViewState extends ReqresViewModel {
class _ReqresViewState extends State<ReqresView> with ProjectDioMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ReqresProvider>(
      create: (BuildContext context) => ReqresProvider(ReqresService(service)),
      builder: (context, child) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.read<ThemeNotifier>().changeTheme();
            },
          ),
          appBar: AppBar(
              actions: const [_SaveAndNavigate()],
              title: context.watch<ReqresProvider>().isLoading
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : null),
          body: Column(
            children: [
              const _TempPlaceHolder(),
              Expanded(
                  child: _resourceListView(
                      context, context.watch<ReqresProvider>().resources)),
            ],
          ),
        );
      },
    );
  }

  ListView _resourceListView(BuildContext context, List<Data> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        // inspect(resources[index]);
        // print(resources[index].color?.colorValue);
        return Card(
          color: Color(items[index].color?.colorValue ?? 0),
          child: Text(
            items[index].name ?? '',
          ),
        );
      },
    );
  }
}

class _TempPlaceHolder extends StatelessWidget {
  const _TempPlaceHolder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<ReqresProvider, bool>(
      builder: (context, value, child) {
        return value ? const Placeholder() : const Text('data');
      },
      selector: (context, provider) {
        return provider.isLoading;
      },
    );
  }
}

class _SaveAndNavigate extends StatelessWidget {
  const _SaveAndNavigate({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          context
              .read<ReqresProvider>()
              .saveToLocale(context.read<ResourceContext>());
          Navigator.of(context).push(MaterialPageRoute(builder: (_) {
            return const ScaffoldViewLearn();
          }));
        },
        child: const Icon(Icons.ac_unit));
  }
}
