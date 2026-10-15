import 'dart:io';

import 'package:flutter/material.dart';

import '../common/app_colors.dart';
import '../common/app_text_styles.dart';
import '../models/contact.dart';

// One card in the contacts grid:
//   photo on top with the name chip over its bottom-left corner,
//   a gold panel under it with the email and phone,
//   and a red Delete button.
class ContactCard extends StatelessWidget {
  final Contact contact;
  final void Function()? onDelete;

  const ContactCard({
    super.key,
    required this.contact,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      // ClipRRect actually cuts the photo, a borderRadius on the
      // decoration would only round the colour behind it
      borderRadius: BorderRadius.circular(16),
      child: Container(
        color: AppColors.gold,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ---- photo + name chip ----
            Expanded(
              flex: 5,
              child: Stack(
                children: [
                  Positioned.fill(child: buildPhoto()),
                  Positioned(
                    left: 8,
                    bottom: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.gold,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        contact.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.darkBlue,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ---- details + delete ----
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InfoLine(icon: Icons.email, text: contact.email),
                    InfoLine(icon: Icons.phone, text: contact.phone),
                    SizedBox(
                      width: double.infinity,
                      height: 30,
                      child: ElevatedButton(
                        onPressed: onDelete,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.red,
                          foregroundColor: AppColors.white,
                          elevation: 0,
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.delete_outline,
                                size: 14, color: AppColors.white),
                            SizedBox(width: 4),
                            Text(
                              'Delete',
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPhoto() {
    if (contact.imagePath == null) {
      return Container(
        color: AppColors.darkBlue,
        alignment: const Alignment(0, 0),
        child: const Icon(Icons.person, color: AppColors.gold, size: 40),
      );
    }
    // the picker gives back a path on the device, so the photo is read
    // from the file system, not from the assets bundle
    return Image.file(
      File(contact.imagePath!),
      fit: BoxFit.cover,
    );
  }
}

// One "icon + text" line inside the gold panel.
class InfoLine extends StatelessWidget {
  final IconData icon;
  final String text;

  const InfoLine({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 14, color: AppColors.darkBlue),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 10,
              color: AppColors.darkBlue,
            ),
          ),
        ),
      ],
    );
  }
}

// The live preview shown at the top of the add-contact sheet.
// It rebuilds on every keystroke, which is what the brief means by
// "This Text Displays the User ... on user Change from the controller".
class ContactPreview extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  final String? imagePath;

  const ContactPreview({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: SizedBox(
            width: 90,
            height: 110,
            child: imagePath == null
                ? Container(
                    color: AppColors.darkBlue,
                    alignment: const Alignment(0, 0),
                    child: const Icon(
                      Icons.person,
                      color: AppColors.gold,
                      size: 36,
                    ),
                  )
                : Image.file(File(imagePath!), fit: BoxFit.cover),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PreviewLine(text: name, isTitle: true),
              const SizedBox(height: 10),
              PreviewLine(text: email),
              const SizedBox(height: 10),
              PreviewLine(text: phone),
            ],
          ),
        ),
      ],
    );
  }
}

// One underlined line of the preview. Empty values keep the underline
// so the layout does not jump while the user types.
class PreviewLine extends StatelessWidget {
  final String text;
  final bool isTitle;

  const PreviewLine({super.key, required this.text, this.isTitle = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text.isEmpty ? ' ' : text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: isTitle
              ? AppTextStyles.titleMedium
              : const TextStyle(fontSize: 14, color: AppColors.gold),
        ),
        const SizedBox(height: 4),
        Container(height: 1, color: AppColors.gold),
      ],
    );
  }
}
