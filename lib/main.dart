import 'package:flutter/material.dart';
import 'adoption_criteria_screen.dart';
import 'adoption_form_screen.dart';
import 'adoption_status_screen.dart';
import 'announcement_screen.dart';
import 'archive_applications_screen.dart';
import 'home_screen.dart';
import 'message_admin_screen.dart';
import 'pet_detail_screen.dart';
import 'pet_filter_screen.dart';
import 'pet_gallery_screen.dart';
import 'pet_list_screen.dart';
import 'profile_screen.dart';
import 'report_pet_screen.dart';
import 'settings_screen.dart';
import 'user_activity_logs_screen.dart';
import 'view_feedback_screen.dart';
import 'login_screen.dart';
import 'register_screen.dart';
import 'admin_dashboard_screen.dart';

void main() {
  runApp(const PetAdoptionApp());
}

class PetAdoptionApp extends StatelessWidget {
  const PetAdoptionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Adoption Directory',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
        fontFamily: 'Arial',
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.teal),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 2,
        ),
      ),
      initialRoute: '/login',
      routes: {
        '/': (context) => const HomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/adoptionForm': (context) => const AdoptionFormScreen(),
        '/adoptionStatus': (context) => const AdoptionStatusScreen(),
        '/reportPet': (context) => const ReportPetScreen(),
        '/messageAdmin': (context) => const MessageAdminScreen(),
        '/adoptionCriteria': (context) => const AdoptionCriteriaScreen(),
        '/announcement': (context) => const AnnouncementScreen(),
        '/archiveApplications': (context) => const ArchiveApplicationsScreen(),
        '/userLogs': (context) => const UserActivityLogsScreen(),
        '/viewFeedback': (context) => const ViewFeedbackScreen(),
        '/petList': (context) => const PetListScreen(),
        '/petDetail': (context) => const PetDetailScreen(pet: {}),
        '/petGallery': (context) => const PetGalleryScreen(),
        '/petFilter': (context) => const PetFilterScreen(),
        '/adminDashboard': (context) => const AdminDashboardScreen(),
      },
    );
  }
}

// Optional utility class if needed for drawer setup later
class NavigationDrawerScreen {
  const NavigationDrawerScreen();
}
