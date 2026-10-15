import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../common/app_assets.dart';
import '../common/app_colors.dart';
import '../common/app_text_styles.dart';
import '../models/contact.dart';
import '../widgets/add_contact_sheet.dart';
import '../widgets/contact_card.dart';
import '../widgets/shared_widgets.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'homeScreen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // brief: "When The User Enters 6 Contacts The Add Button Will be Invisible"
  static const int maxContacts = 6;

  // the whole app state is this one list
  final List<Contact> contacts = [];

  Future<void> openAddSheet() async {
    // showModalBottomSheet gives back whatever the sheet popped with
    final Contact? newContact = await showModalBottomSheet<Contact>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => const AddContactSheet(),
    );

    if (newContact == null) return;
    setState(() {
      contacts.add(newContact);
    });
  }

  // brief: "Floating Actions Button To Delete The last item in the list"
  void deleteLastContact() {
    setState(() {
      contacts.removeLast();
    });
  }

  void deleteContact(int index) {
    setState(() {
      contacts.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      appBar: AppBar(
        backgroundColor: AppColors.darkBlue,
        elevation: 0,
        title: const RouteLogo(),
      ),
      body: Padding(
        // the brief asks for 16 on the horizontal axis
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: contacts.isEmpty ? buildEmptyState() : buildContactsGrid(),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // the delete button only exists while the list has something
          if (contacts.isNotEmpty)
            FloatingActionButton(
              heroTag: 'delete',
              onPressed: deleteLastContact,
              backgroundColor: AppColors.red,
              child: const Icon(Icons.delete, color: AppColors.white),
            ),
          if (contacts.isNotEmpty) const SizedBox(height: 12),

          // the add button disappears once the list is full
          if (contacts.length < maxContacts)
            FloatingActionButton(
              heroTag: 'add',
              onPressed: openAddSheet,
              backgroundColor: AppColors.gold,
              child: const Icon(Icons.add, color: AppColors.darkBlue),
            ),
        ],
      ),
    );
  }

  // brief: the lottie animation plus the "no contacts" line
  Widget buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            AppAssets.emptyListAnimation,
            width: 260,
            repeat: true,
          ),
          const SizedBox(height: 16),
          const Text(
            'There is No Contacts Added Here',
            textAlign: TextAlign.center,
            style: AppTextStyles.titleLarge,
          ),
        ],
      ),
    );
  }

  Widget buildContactsGrid() {
    return GridView.builder(
      padding: const EdgeInsets.only(top: 8, bottom: 90),
      itemCount: contacts.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        // taller than it is wide, so the photo and the details both fit
        childAspectRatio: 0.62,
      ),
      itemBuilder: (context, index) {
        return ContactCard(
          contact: contacts[index],
          onDelete: () => deleteContact(index),
        );
      },
    );
  }
}
