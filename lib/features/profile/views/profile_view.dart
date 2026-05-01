import 'package:flutter/material.dart';
import 'package:food/features/profile/models/profile_data_model.dart';
import 'package:food/features/profile/widgets/profile_action_button.dart';
import 'package:food/features/profile/widgets/profile_info_tile.dart';
import 'package:food/features/profile/widgets/profile_payment_card.dart';
import 'package:gap/gap.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  static const ProfileDataModel _profileData = ProfileDataModel(
    name: 'Ayman Mahmoud',
    email: 'Ayman@gmail.com',
    address: 'Banha , Egypt',
    passwordMask: '*********',
    cardType: 'VISA',
    cardAlias: 'Debit card',
    cardNumberMask: '4527 **** **** 2015',
    avatarAsset: 'assets/test/me.jpg',
  );

  late ProfileDataModel _currentProfileData;

  @override
  void initState() {
    _currentProfileData = _profileData;
    super.initState();
  }

  Future<void> _openEditProfileSheet() async {
    final updatedProfile = await showModalBottomSheet<ProfileDataModel>(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFF07361A),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
      ),
      builder: (context) {
        return _EditProfileSheet(
          initialData: _currentProfileData,
          onSave: (updatedData) => Navigator.pop(context, updatedData),
        );
      },
    );

    if (updatedProfile != null) {
      if (!mounted) return;
      setState(() {
        _currentProfileData = updatedProfile;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF04551F),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 20,
                    ),
                    visualDensity: VisualDensity.compact,
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.settings,
                      color: Colors.white,
                      size: 20,
                    ),
                    visualDensity: VisualDensity.compact,
                  ),
                ],
              ),
              const Gap(8),
              Center(
                child: Container(
                  width: 78,
                  height: 78,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: const Color(0xFFE3EEE7),
                      width: 2,
                    ),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset(
                    _currentProfileData.avatarAsset,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Gap(28),
              ProfileInfoTile(label: 'Name', value: _currentProfileData.name),
              const Gap(20),
              ProfileInfoTile(label: 'Email', value: _currentProfileData.email),
              const Gap(20),
              ProfileInfoTile(
                label: 'Delivery address',
                value: _currentProfileData.address,
              ),
              const Gap(20),
              ProfileInfoTile(
                label: 'Password',
                value: _currentProfileData.passwordMask,
                trailing: const Icon(
                  Icons.lock_outline,
                  color: Color(0xFFD8ECE0),
                  size: 16,
                ),
              ),
              const Gap(18),
              const Divider(color: Color(0xFF4D8A62), thickness: 1),
              const Gap(14),
              ProfilePaymentCard(
                cardType: _currentProfileData.cardType,
                cardAlias: _currentProfileData.cardAlias,
                maskedNumber: _currentProfileData.cardNumberMask,
              ),
              const Gap(36),
              Row(
                children: [
                  ProfileActionButton(
                    label: 'Edit Profile',
                    icon: Icons.edit_outlined,
                    isPrimary: true,
                    onPressed: _openEditProfileSheet,
                  ),
                  const Gap(10),
                  ProfileActionButton(
                    label: 'Log out',
                    icon: Icons.logout,
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EditProfileSheet extends StatefulWidget {
  const _EditProfileSheet({required this.initialData, required this.onSave});

  final ProfileDataModel initialData;
  final ValueChanged<ProfileDataModel> onSave;

  @override
  State<_EditProfileSheet> createState() => _EditProfileSheetState();
}

class _EditProfileSheetState extends State<_EditProfileSheet> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _addressController;
  late final TextEditingController _passwordController;
  bool _obscurePassword = true;

  @override
  void initState() {
    _nameController = TextEditingController(text: widget.initialData.name);
    _emailController = TextEditingController(text: widget.initialData.email);
    _addressController = TextEditingController(
      text: widget.initialData.address,
    );
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    final passwordMask = _buildPasswordMask(_passwordController.text);

    widget.onSave(
      widget.initialData.copyWith(
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        address: _addressController.text.trim(),
        passwordMask: passwordMask,
      ),
    );
  }

  String _buildPasswordMask(String rawPassword) {
    final trimmed = rawPassword.trim();
    if (trimmed.isEmpty) {
      return widget.initialData.passwordMask;
    }
    final maskLength = trimmed.length.clamp(6, 20).toInt();
    return List.filled(maskLength, '*').join();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      duration: const Duration(milliseconds: 180),
      curve: Curves.easeOut,
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 18, 16, 16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Edit Profile',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Gap(16),
                _buildEditField(
                  controller: _nameController,
                  label: 'Name',
                  validator: _requiredValidator,
                ),
                const Gap(10),
                _buildEditField(
                  controller: _emailController,
                  label: 'Email',
                  validator: _emailValidator,
                  keyboardType: TextInputType.emailAddress,
                ),
                const Gap(10),
                _buildEditField(
                  controller: _addressController,
                  label: 'Delivery address',
                  validator: _requiredValidator,
                ),
                const Gap(10),
                _buildEditField(
                  controller: _passwordController,
                  label: 'Password',
                  obscureText: _obscurePassword,
                  hintText: 'Leave empty to keep current password',
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() => _obscurePassword = !_obscurePassword);
                    },
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: const Color(0xFFB9D5C3),
                    ),
                  ),
                ),
                const Gap(18),
                SizedBox(
                  width: double.infinity,
                  height: 46,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: _submit,
                    child: const Text(
                      'Save Changes',
                      style: TextStyle(
                        color: Color(0xFF1B5A31),
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEditField({
    required TextEditingController controller,
    required String label,
    String? Function(String?)? validator,
    bool obscureText = false,
    String? hintText,
    Widget? suffixIcon,
    TextInputType? keyboardType,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      keyboardType: keyboardType,
      style: const TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        hintStyle: const TextStyle(color: Color(0xFF95B5A2), fontSize: 12),
        errorStyle: const TextStyle(color: Color(0xFFFFC3C3)),
        labelStyle: const TextStyle(color: Color(0xFFB9D5C3)),
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: const Color(0xFF0C4A26),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF3F7D59)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.white70),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE67D7D)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFFFC3C3)),
        ),
      ),
    );
  }

  String? _requiredValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Required field';
    }
    return null;
  }

  String? _emailValidator(String? value) {
    final trimmed = value?.trim() ?? '';
    if (trimmed.isEmpty) return 'Required field';
    if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(trimmed)) {
      return 'Invalid email';
    }
    return null;
  }
}
