import 'package:flutter/material.dart';

import '../models/user_profile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserProfile user = const UserProfile(
    name: "Super User",
    photo: "https://i.pravatar.cc/300",
  );

  Future<void> _editName() async {
    final controller = TextEditingController(text: user.name);
    final result = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Modifier le nom'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            labelText: 'Nom',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Annuler')),
          ElevatedButton(onPressed: () => Navigator.of(context).pop(controller.text.trim()), child: const Text('Enregistrer')),
        ],
      ),
    );

    if (result != null && result.isNotEmpty) {
      setState(() {
        user = UserProfile(name: result, photo: user.photo);
      });
    }
  }

  Widget _buildAvatar(double size) {
    return ClipOval(
      child: SizedBox(
        width: size,
        height: size,
        child: Image.network(
          user.photo,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: SizedBox(
                width: size * 0.4,
                height: size * 0.4,
                child: const CircularProgressIndicator(color: Colors.deepPurple),
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.deepPurple.shade100,
              child: Center(
                child: Text(user.name,
                  style: TextStyle(fontSize: size * 0.32, fontWeight: FontWeight.bold, color: Colors.deepPurple.shade800),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        actions: [
          IconButton(
            tooltip: 'Modifier',
            onPressed: _editName,
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Center(
          child: Column(
            children: [
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                  child: Column(
                    children: [
                      _buildAvatar(120),
                      const SizedBox(height: 16),
                      Text(user.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                      const SizedBox(height: 16),
                      ElevatedButton.icon(
                        onPressed: _editName,
                        icon: const Icon(Icons.edit),
                        label: const Text('Modifier le profil'),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ListTile(
                leading: const Icon(Icons.history),
                title: const Text('Historique des commandes'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.location_on),
                title: const Text('Adresses'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _editName,
        icon: const Icon(Icons.edit),
        label: const Text('Modifier'),
      ),
    );
  }
}
