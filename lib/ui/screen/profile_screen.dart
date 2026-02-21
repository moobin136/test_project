import 'package:flutter/material.dart';
import 'package:test_project/ui/widgets/global_appbar.dart';
import 'package:test_project/ui/widgets/screen_background.dart';

class ProfileScreen extends StatelessWidget {
  // ignore: use_super_parameters
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textThem = Theme.of(context).textTheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const TMAppBar(
        isProfileScreenOpen: true,
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: ScreenBackground(
          child: Padding(
            padding: EdgeInsets.only(
              top: 16,
              right: 16,
              left: 16,
              bottom: MediaQuery.of(context).viewInsets.bottom + 8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 80),
                Text(
                  'Update Your Profile',
                  style: textThem.displaySmall?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                // _bieldPhotoPicker(textThem: textThem),
                const SizedBox(height: 8),
                _bieldPhotoPicker(textThem),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Update Profile'),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(hintText: 'First Name'),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Last Name'),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Phon Number'),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(hintText: 'Password'),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                    onPressed: _onTapUpdate, child: const Text('Update'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapUpdate() {
    //! todo
  }

  Widget _bieldPhotoPicker(TextTheme textThem) {
    return Row(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(211, 117, 117, 117),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8),
              topLeft: Radius.circular(8),
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
              child: Text(
                'Photos',
                style: textThem.labelLarge?.copyWith(
                    color: Colors.white, fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                textAlign: TextAlign.start,
                'Selected your Photos',
                style:
                    textThem.labelLarge?.copyWith(fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
