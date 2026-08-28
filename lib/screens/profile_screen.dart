import 'package:ecommerce_app/models/user_profile.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const user = UserProfile(name: "Super User", photo: "https://i.pravatar.cc/150");
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              user.photo,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return const CircularProgressIndicator(color: Colors.deepPurple);
              },
              errorBuilder: (context, error, stackTrace) => Center(child: Icon(Icons.image_not_supported)),
            ),
          ),
          const SizedBox(height: 20,),
          Text(user.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
        ],
      ),
    );
  }  
}