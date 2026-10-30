import 'package:flutter/material.dart';
import '../main.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const SizedBox(height: 20),
          const CircleAvatar(
            radius: 55,
            backgroundColor: Color(0xFFF4E1E5),
            child: Icon(
              Icons.person,
              size: 65,
              color: primaryColor,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Azi',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'azaliya@example.com',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black54),
          ),
          const SizedBox(height: 32),
          const Text(
            'Settings',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Card(
            color: Colors.white,
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(
                    Icons.notifications_outlined,
                    color: primaryColor,
                  ),
                  title: const Text('Notifications'),
                  trailing: Switch(
                    value: true,
                    activeThumbColor: primaryColor,
                    onChanged: (value) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            value
                                ? 'Notifications enabled'
                                : 'Notifications disabled',
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(
                    Icons.language,
                    color: primaryColor,
                  ),
                  title: const Text('Language'),
                  subtitle: const Text('English'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('English is selected'),
                      ),
                    );
                  },
                ),
                const Divider(height: 1),
                const ListTile(
                  leading: Icon(
                    Icons.info_outline,
                    color: primaryColor,
                  ),
                  title: Text('About the app'),
                  subtitle: Text('My Cosmetics · Version 1.0'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
