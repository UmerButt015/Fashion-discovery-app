import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with TickerProviderStateMixin {
  int _selectedTab = 0; // 0 = Email Address, 1 = Phone Number

  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _birthdayController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _passwordVisible = false;
  bool _isFormValid = false;

  // Individual field validity
  bool _emailValid = false;
  bool _usernameValid = false;
  bool _birthdayValid = false;
  bool _passwordValid = false;

  // Animation controller for button color
  late AnimationController _buttonAnimController;
  late Animation<Color?> _buttonColorAnim;
  late Animation<Color?> _buttonTextColorAnim;

  @override
  void initState() {
    super.initState();

    _buttonAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _buttonColorAnim = ColorTween(
      begin: const Color(0xFFD0D0D5),
      end: const Color(0xFF2979FF),
    ).animate(
      CurvedAnimation(parent: _buttonAnimController, curve: Curves.easeInOut),
    );

    _buttonTextColorAnim = ColorTween(
      begin: const Color(0xFF8E8E93),
      end: Colors.white,
    ).animate(
      CurvedAnimation(parent: _buttonAnimController, curve: Curves.easeInOut),
    );

    _emailController.addListener(_validateForm);
    _usernameController.addListener(_validateForm);
    _birthdayController.addListener(_validateForm);
    _passwordController.addListener(_validateForm);
  }

  // ─── VALIDATION ────────────────────────────────────────
  void _validateForm() {
    final emailRegex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w{2,}$');
    final passwordRegex = RegExp(
      r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#\$&*~%^]).{6,}$',
    );

    setState(() {
      _emailValid = emailRegex.hasMatch(_emailController.text.trim());
      _usernameValid = _usernameController.text.trim().length >= 2;
      _birthdayValid = _birthdayController.text.trim().isNotEmpty;
      _passwordValid = passwordRegex.hasMatch(_passwordController.text);

      final newValid =
          _emailValid && _usernameValid && _birthdayValid && _passwordValid;

      if (newValid != _isFormValid) {
        _isFormValid = newValid;
        if (_isFormValid) {
          _buttonAnimController.forward();
        } else {
          _buttonAnimController.reverse();
        }
      }
    });
  }

  Color _fieldIconColor(bool valid, String value) {
    if (value.isEmpty) return const Color(0xFFBDBDBD);
    return valid ? const Color(0xFF2979FF) : const Color(0xFFBDBDBD);
  }

  Color _fieldBorderColor(bool valid, String value) {
    if (value.isEmpty) return const Color(0xFFE0E0E0);
    return valid ? const Color(0xFF2979FF) : const Color(0xFFE0E0E0);
  }

  @override
  void dispose() {
    _buttonAnimController.dispose();
    _emailController.dispose();
    _usernameController.dispose();
    _birthdayController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // ─── BUILD ─────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),

              // ── Back button ────────────────────────────
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                      color: Color(0xFF1A1A2E),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // ── Title ──────────────────────────────────
              const Text(
                'Welcome!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF1A1A2E),
                  letterSpacing: -0.5,
                ),
              ),

              const SizedBox(height: 12),

              // ── Subtitle ───────────────────────────────
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF8E8E93),
                    height: 1.5,
                  ),
                  children: [
                    TextSpan(
                      text:
                          'Please complete the required information, and then press the ',
                    ),
                    TextSpan(
                      text: 'Next',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1A1A2E),
                      ),
                    ),
                    TextSpan(text: ' button'),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // ── Tab Bar ────────────────────────────────
              Row(
                children: [
                  _buildTab('Email Address', 0),
                  const SizedBox(width: 24),
                  _buildTab('Phone Number', 1),
                ],
              ),

              const SizedBox(height: 24),

              // ── Email Field ────────────────────────────
              _buildTextField(
                controller: _emailController,
                hint: 'E-mail',
                placeholder: 'email@example.com',
                icon: Icons.email_outlined,
                isValid: _emailValid,
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 14),

              // ── Username Field ─────────────────────────
              _buildTextField(
                controller: _usernameController,
                hint: 'Username',
                placeholder: 'JohnApple',
                icon: Icons.person_outline,
                isValid: _usernameValid,
              ),

              const SizedBox(height: 14),

              // ── Birthday Field ─────────────────────────
              _buildBirthdayField(),

              const SizedBox(height: 14),

              // ── Password Field ─────────────────────────
              _buildPasswordField(),

              const SizedBox(height: 10),

              // ── Password hint ──────────────────────────
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 4),
                  child: Text(
                    'Password must include a number, a letter, and\na special character.',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF8E8E93),
                      height: 1.5,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 28),

              // ── Next Button (animated) ─────────────────
              AnimatedBuilder(
                animation: _buttonAnimController,
                builder: (context, child) {
                  return GestureDetector(
                    onTap: _isFormValid ? _onNextPressed : null,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 100),
                      width: double.infinity,
                      height: 54,
                      decoration: BoxDecoration(
                        color: _buttonColorAnim.value,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow:
                            _isFormValid
                                ? [
                                  BoxShadow(
                                    color: const Color(
                                      0xFF2979FF,
                                    ).withOpacity(0.35),
                                    blurRadius: 20,
                                    offset: const Offset(0, 8),
                                  ),
                                ]
                                : [],
                      ),
                      child: Center(
                        child: Text(
                          'Next',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: _buttonTextColorAnim.value,
                            letterSpacing: 0.3,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 20),

              // ── Sign In link ───────────────────────────
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account? ',
                    style: TextStyle(fontSize: 13, color: Color(0xFF8E8E93)),
                  ),
                  GestureDetector(
                    onTap: () => context.go('/home'),
                    child: const Text(
                      'Signin',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1A1A2E),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  // ─── TAB ───────────────────────────────────────────────
  Widget _buildTab(String label, int index) {
    final isSelected = _selectedTab == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedTab = index),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
              color:
                  isSelected
                      ? const Color(0xFF1A1A2E)
                      : const Color(0xFF8E8E93),
            ),
          ),
          const SizedBox(height: 6),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            height: 2,
            width: isSelected ? (label.length * 8.5) : 0,
            decoration: BoxDecoration(
              color: const Color(0xFF1A1A2E),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }

  // ─── GENERIC TEXT FIELD ────────────────────────────────
  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required String placeholder,
    required IconData icon,
    required bool isValid,
    TextInputType keyboardType = TextInputType.text,
    List<TextInputFormatter>? inputFormatters,
  }) {
    final value = controller.text;
    final borderColor = _fieldBorderColor(isValid, value);
    final iconColor = _fieldIconColor(isValid, value);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: borderColor,
          width: value.isNotEmpty && isValid ? 1.5 : 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const SizedBox(width: 14),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            child: Icon(
              icon,
              key: ValueKey(iconColor.value),
              color: iconColor,
              size: 20,
            ),
          ),
          Container(
            width: 1,
            height: 24,
            margin: const EdgeInsets.symmetric(horizontal: 12),
            color: const Color(0xFFE0E0E0),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Text(
                  hint,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF8E8E93),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextField(
                  controller: controller,
                  keyboardType: keyboardType,
                  inputFormatters: inputFormatters,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF1A1A2E),
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    hintText: placeholder,
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFFBDBDBD),
                    ),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: const EdgeInsets.only(bottom: 10),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ─── DATE PICKER ───────────────────────────────────────
  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000, 1, 1),
      firstDate: DateTime(1900),
      lastDate: now,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF2979FF),
              onPrimary: Colors.white,
              onSurface: Color(0xFF1A1A2E),
              surface: Colors.white,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: const Color(0xFF2979FF),
                textStyle: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            dialogTheme: DialogThemeData(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      final formatted =
          '${picked.day.toString().padLeft(2, '0')}/'
          '${picked.month.toString().padLeft(2, '0')}/'
          '${picked.year}';
      _birthdayController.text = formatted;
      _validateForm();
    }
  }

  // ─── BIRTHDAY FIELD ────────────────────────────────────
  Widget _buildBirthdayField() {
    final value = _birthdayController.text;
    final borderColor = _fieldBorderColor(_birthdayValid, value);
    final iconColor = _fieldIconColor(_birthdayValid, value);

    return GestureDetector(
      onTap: _pickDate,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: borderColor,
            width: value.isNotEmpty && _birthdayValid ? 1.5 : 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            const SizedBox(width: 14),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              child: Icon(
                Icons.calendar_today_outlined,
                key: ValueKey(iconColor.value),
                color: iconColor,
                size: 20,
              ),
            ),
            Container(
              width: 1,
              height: 24,
              margin: const EdgeInsets.symmetric(horizontal: 12),
              color: const Color(0xFFE0E0E0),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Birthday',
                      style: TextStyle(
                        fontSize: 11,
                        color: Color(0xFF8E8E93),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      value.isEmpty ? 'DD/MM/YYYY' : value,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color:
                            value.isEmpty
                                ? const Color(0xFFBDBDBD)
                                : const Color(0xFF1A1A2E),
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

  // ─── PASSWORD FIELD ────────────────────────────────────
  Widget _buildPasswordField() {
    final value = _passwordController.text;
    final borderColor = _fieldBorderColor(_passwordValid, value);
    final iconColor = _fieldIconColor(_passwordValid, value);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: borderColor,
          width: value.isNotEmpty && _passwordValid ? 1.5 : 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const SizedBox(width: 14),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            child: Icon(
              Icons.lock_outline,
              key: ValueKey(iconColor.value),
              color: iconColor,
              size: 20,
            ),
          ),
          Container(
            width: 1,
            height: 24,
            margin: const EdgeInsets.symmetric(horizontal: 12),
            color: const Color(0xFFE0E0E0),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                const Text(
                  'Password',
                  style: TextStyle(
                    fontSize: 11,
                    color: Color(0xFF8E8E93),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextField(
                  controller: _passwordController,
                  obscureText: !_passwordVisible,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF1A1A2E),
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: const InputDecoration(
                    hintText: '••••••••••',
                    hintStyle: TextStyle(
                      fontSize: 18,
                      color: Color(0xFFBDBDBD),
                      letterSpacing: 2,
                    ),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.only(bottom: 10),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => setState(() => _passwordVisible = !_passwordVisible),
            child: Padding(
              padding: const EdgeInsets.only(right: 14),
              child: Icon(
                _passwordVisible
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: const Color(0xFFBDBDBD),
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ─── NEXT BUTTON ACTION ────────────────────────────────
  // ✅ GoRouter navigation: SignUp → Home
  void _onNextPressed() {
    context.go('/home');
  }
}
