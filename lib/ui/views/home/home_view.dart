import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:whats_app_clone/theme/custom_theme.dart';
import 'package:whats_app_clone/ui/views/chat/widgets/custom_chat_list.dart';
import 'package:whats_app_clone/ui/views/setting/setting_view.dart';
import 'package:whats_app_clone/ui/widgets/user_app_bar.dart';
import 'package:whats_app_clone/ui/widgets/user_listview_builder.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: UserAppBar(
          title: ('Hello ${viewModel.user?.email?.split('@').first}'),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
              color: CustomTheme.inversePrimary(context),
            ),
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {},
              color: CustomTheme.inversePrimary(context),
            ),
          ],
          bottom: TabBar(
            tabs: const [
              Tab(text: "Chats"),
              Tab(text: "Status"),
              Tab(text: "Calls"),
            ],
            labelColor: CustomTheme.inversePrimary(context),
            unselectedLabelColor: CustomTheme.inversePrimary(context),
            indicatorColor: CustomTheme.inversePrimary(context),
          ),
        ),
        body: TabBarView(
          children: [
            viewModel.isBusy
                ? const Center(child: CircularProgressIndicator())
                : CustomChatList(
                    chats: viewModel.chats,
                    onRefresh: viewModel.fetchUserList,
                  ),
            const UserListviewbuilder(
              status: ["Status 1", "Status 2", "Status 3"],
              icon: Icons.account_circle,
            ),
            const UserListviewbuilder(
              status: ["Call 1", "Call 2", "Call 3"],
              icon: Icons.call,
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SettingView(),
              ),
            );
          },
          backgroundColor: CustomTheme.primary(context),
          child:
              Icon(Icons.settings, color: CustomTheme.inversePrimary(context)),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
