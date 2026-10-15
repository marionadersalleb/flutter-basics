import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

import '../common/app_assets.dart';
import '../common/app_colors.dart';
import '../models/contact.dart';
import 'contact_card.dart';
import 'shared_widgets.dart';

// The bottom sheet the floating action button opens.
// It returns the new Contact through Navigator.pop, or null if the
// user closed it without saving.
class AddContactSheet extends StatefulWidget {
  const AddContactSheet({super.key});

  @override
  State<AddContactSheet> createState() => _AddContactSheetState();
}

class _AddContactSheetState extends State<AddContactSheet> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // controllers live outside build so they survive every rebuild
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  String? pickedImagePath;

  @override
  void initState() {
    super.initState();
    // the preview at the top must follow what the user types, so every
    // controller triggers a rebuild on change
    nameController.addListener(onFieldChanged);
    emailController.addListener(onFieldChanged);
    phoneController.addListener(onFieldChanged);
  }

  void onFieldChanged() {
    setState(() {});
  }

  @override
  void dispose() {
    // controllers hold resources, not disposing them leaks memory
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? file = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
    );
    if (file == null) return;
    setState(() {
      pickedImagePath = file.path;
    });
  }

  void saveContact() {
    if (!formKey.currentState!.validate()) return;

    Navigator.of(context).pop(
      Contact(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        phone: phoneController.text.trim(),
        imagePath: pickedImagePath,
      ),
    );
  }

  String? validateNotEmpty(String? value, String field) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter the $field';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter the email';
    }
    final RegExp regex = RegExp(r'^[\w.\-]+@[\w\-]+\.[a-zA-Z]{2,}$');
    if (!regex.hasMatch(value.trim())) {
      return 'Invalid Email';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      // this padding lifts the sheet above the keyboard
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.darkBlue,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // the small grab handle
                Container(
                  width: 48,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.gold,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 20),

                // ---- the lottie button that opens the gallery ----
                InkWell(
                  onTap: pickImage,
                  borderRadius: BorderRadius.circular(16),
                  child: SizedBox(
                    height: 110,
                    child: Lottie.asset(
                      AppAssets.imagePickerAnimation,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(height: 8),

                // ---- the live preview ----
                ContactPreview(
                  name: nameController.text,
                  email: emailController.text,
                  phone: phoneController.text,
                  imagePath: pickedImagePath,
                ),
                const SizedBox(height: 24),

                AppTextFormField(
                  hintText: 'Enter User Name',
                  controller: nameController,
                  validator: (value) => validateNotEmpty(value, 'name'),
                ),
                const SizedBox(height: 12),

                AppTextFormField(
                  hintText: 'Enter User Email',
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: validateEmail,
                ),
                const SizedBox(height: 12),

                AppTextFormField(
                  hintText: 'Enter User Phone',
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  validator: (value) => validateNotEmpty(value, 'phone'),
                ),
                const SizedBox(height: 20),

                AppElevatedButton(
                  text: 'Enter user',
                  onPressed: saveContact,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
