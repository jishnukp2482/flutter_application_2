import 'package:flutter/material.dart';
import 'package:flutter_application_2/src/user/presentation/manager/user/user_provider.dart';
import 'package:flutter_application_2/src/user/presentation/widgets/users/all_user_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllUsersScreen extends ConsumerStatefulWidget {
  const AllUsersScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AllUsersScreenState();
}

class _AllUsersScreenState extends ConsumerState<AllUsersScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref.read(userProviderProvider.notifier).fetchAllUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = ref.watch(userProviderProvider.notifier);
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () async {
          userProvider.fetchAllUsers();
        },
        child: Scaffold(
          appBar: AppBar(title: Text("All Users")),
          body: ListView(children: [AllUserListMenu()]),
        ),
      ),
    );
  }
}
