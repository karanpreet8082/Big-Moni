import 'package:bigbucks/colors.dart';
import 'package:bigbucks/features/home/controller/home_controller.dart';
import 'package:bigbucks/features/home/screens/add_debtor.dart';
import 'package:bigbucks/features/home/screens/notifications_screen.dart';
import 'package:bigbucks/features/home/widgets/creditors_list.dart';
import 'package:bigbucks/features/home/widgets/debtors_list.dart';
import 'package:bigbucks/features/profile/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  Future<void> getUserTransactions() {
    return ref.read(homeControllerProvider).getUserTransactions();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Big Moni"),
          backgroundColor: CustomColors.blackColor,
          bottom: const TabBar(
            indicator: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 2.0,
                  color: CustomColors.whiteColor,
                ),
              ),
            ),
            tabs: [
              Tab(
                text: "Debtors",
              ),
              Tab(
                text: "Creditors",
              ),
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(ProfileScreen.routeName);
                },
                icon: const Icon(Icons.person))
          ],
          leading: IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.of(context).pushNamed(NotificationScreen.routeName);
            },
          ),
        ),
        body: FutureBuilder(
          future: getUserTransactions(),
          builder: (context, snapshot) {
            return const TabBarView(
              children: [
                DebtorsList(),
                CreditorsList(),
              ],
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: CustomColors.blackColor,
          onPressed: () {
            Navigator.of(context).pushNamed(AddScreen.routeName);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
