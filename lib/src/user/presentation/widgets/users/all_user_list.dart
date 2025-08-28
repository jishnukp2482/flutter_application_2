import 'package:flutter/material.dart';

import 'package:flutter_application_2/src/user/data/models/response/fetch_all_user_res_modal.dart';
import 'package:flutter_application_2/src/user/presentation/manager/user/user_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllUserListMenu extends ConsumerWidget {
  const AllUserListMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userstate = ref.watch(userProviderProvider);

    if (userstate.isLoading) {
      return Center(child: CircularProgressIndicator());
    } else if (userstate.fetchAllUserResponse == null ||
        userstate.fetchAllUserResponse!.isEmpty) {
      return Center(child: Text("No Dat Found"));
    } else {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: userstate.fetchAllUserResponse?.length,
        itemBuilder: (context, index) {
          return AllUserListItem(
            fetchAllUserResponse: userstate.fetchAllUserResponse![index],
          );
        },
      );
    }
  }
}

class AllUserListItem extends StatelessWidget {
  const AllUserListItem({super.key, required this.fetchAllUserResponse});
  final FetchAllUserResponse fetchAllUserResponse;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          _buildDataRow("Name", fetchAllUserResponse.name),
          _buildDataRow("email", fetchAllUserResponse.email),
          _buildDataRow("phone", fetchAllUserResponse.phone),
          _buildDataRow("Company", fetchAllUserResponse.company.name),
        ],
      ),
    );
  }

  _buildDataRow(String title, String value) {
    Row(
      children: [
        Expanded(child: Text(title)),
        Expanded(child: Center(child: Text(":"))),
        Expanded(child: Text(value)),
      ],
    );
  }
}
