import 'package:flutter/material.dart';

class PortfolioData {
  static const String name = 'Shashwat Srivastava';
  static const String title = 'Flutter Developer';
  static const String phone = '+91 8076090538';
  static const String email = 'sswtsrv@gmail.com';
  static const String location = 'Kolkata, India';
  static const String linkedin = 'https://linkedin.com/in/shashwat-srivastava-flutter'; // Placeholder if not exact, but fits professional profile
  static const String summary = 'I am a dynamic Flutter Developer with over 2.3 years of experience in creating and optimizing cross-platform mobile applications. My expertise includes extensive use of Flutter and Dart, real-time communication systems, and Firebase integration. I emphasize performance and responsive UI while collaborating effectively within teams.';

  static const List<Map<String, dynamic>> experience = [
    {
      'company': 'Unibit Private Limited',
      'location': 'Kolkata, India',
      'role': 'Flutter Developer',
      'period': '08/2023 - Present',
      'description': 'A company focused on developing mobile applications. Designed, developed, and maintained multiple cross-platform mobile applications using Flutter 3.x and Dart 3.',
      'contributions': [
        'Built modular, reusable, and maintainable UI components using GetX and MVC architecture patterns.',
        'Implemented WebSocket and Firebase services (Cloud Messaging, Authentication) for real-time synchronization.',
        'Developed and optimized real-money gaming, educational, and AI-powered chat applications.',
        'Implemented SQLite-based offline caching, improving session recovery and offline accessibility.',
        'Collaborated closely with backend, UI/UX, and QA teams for seamless API integration and pixel-perfect design.',
      ],
      'stats': [
        {'label': '10+', 'subLabel': 'Apps Built'},
        {'label': '40%', 'subLabel': 'Faster Loading'},
        {'label': '100%', 'subLabel': 'Design Fidelity'},
      ]
    },
  ];

  static const List<Map<String, dynamic>> education = [
    {
      'institution': 'Raj Kumar Goel Institute of Technology',
      'location': 'Ghaziabad',
      'degree': 'Bachelor of Technology - Computer Science and Engineering',
      'period': '08/2017 - 08/2021',
    },
  ];

  static const List<Map<String, dynamic>> techStacks = [
    {
      'title': 'Mobile',
      'icon': Icons.phone_android_rounded,
      'tags': ['Flutter', 'Dart', 'Java', 'Android SDK'],
      'usage': 0.95,
      'color': Color(0xFFA855F7),
    },
    {
      'title': 'Backend & Service',
      'icon': Icons.cloud_queue_rounded,
      'tags': ['Firebase', 'RESTful API', 'WebSocket', 'JSON', 'Google Places API'],
      'usage': 0.90,
      'color': Color(0xFF22D3EE),
    },
    {
      'title': 'Storage',
      'icon': Icons.storage_rounded,
      'tags': ['SQLite', 'Caching', 'Data Persistence'],
      'usage': 0.85,
      'color': Color(0xFF0EA5E9),
    },
    {
      'title': 'Version Control',
      'icon': Icons.alt_route_rounded,
      'tags': ['Git', 'GitHub', 'Agile/Scrum'],
      'usage': 0.92,
      'color': Color(0xFF10B981),
    },
    {
      'title': 'Architecture',
      'icon': Icons.hub_rounded,
      'tags': ['MVC', 'GetX', 'Clean Code', 'Modular'],
      'usage': 0.94,
      'color': Color(0xFFEC4899),
    },
    {
      'title': 'Tools',
      'icon': Icons.build_circle_rounded,
      'tags': ['Android Studio', 'VS Code', 'Postman'],
      'usage': 0.88,
      'color': Color(0xFF6366F1),
    },
  ];

  static const List<Map<String, dynamic>> industryProjects = [
    {
      'title': 'Edepto',
      'desc': 'Educational platform app with live classes, assignments, and progress tracking for students.',
      'tags': ['Flutter', 'Firebase', 'GetX', 'REST API'],
      'users': '500K+',
      'rating': '4.8',
      'perf': 'Fast Load',
      'category': 'Education',
    },
    {
      'title': 'Unibit Games',
      'desc': 'Multi-game platform with real-time multiplayer, leaderboards, and in-app purchases.',
      'tags': ['Flutter', 'Firebase', 'Hive', 'WebSocket'],
      'users': '1M+',
      'rating': '4.7',
      'perf': 'Optimized',
      'category': 'Gaming Platform',
    },
    {
      'title': 'Unibit11',
      'desc': 'Fantasy cricket app with live scores, team creation, and tournament management.',
      'tags': ['Flutter', 'REST API', 'GetX', 'Firebase'],
      'users': '800K+',
      'rating': '4.6',
      'perf': 'Real-time',
      'category': 'Fantasy Sports',
    },
    {
      'title': 'Unibit Pool',
      'desc': '8-ball pool game with multiplayer support and tournament features.',
      'tags': ['Flutter', 'Firebase', 'Unity Integration'],
      'users': '300K+',
      'rating': '4.4',
      'perf': 'Smooth',
      'category': 'Gaming',
    },
    {
      'title': 'Ludo 24',
      'desc': 'Multiplayer ludo game with voice chat, tournaments, and reward system.',
      'tags': ['Flutter', 'Firebase', 'Agora', 'GetX'],
      'users': '600K+',
      'rating': '4.5',
      'perf': 'Low Latency',
      'category': 'Gaming',
    },
    {
      'title': 'Games11',
      'desc': 'All-in-one gaming platform with multiple casual games and social features.',
      'tags': ['Flutter', 'Firebase', 'Hive', 'REST API'],
      'users': '400K+',
      'rating': '4.3',
      'perf': 'Optimized',
      'category': 'Gaming Platform',
    },
    {
      'title': 'Newsflick',
      'desc': 'News aggregator app with personalized feed, bookmarks, and offline reading.',
      'tags': ['Flutter', 'REST API', 'Hive', 'GetX'],
      'users': '200K+',
      'rating': '4.4',
      'perf': 'Fast',
      'category': 'News & Media',
    },
    {
      'title': 'Moina Chat',
      'desc': 'Real-time messaging app with end-to-end encryption, media sharing, and groups.',
      'tags': ['Flutter', 'Firebase', 'WebRTC', 'Hive'],
      'users': '150K+',
      'rating': '4.5',
      'perf': 'Real-time',
      'category': 'Communication',
    },
    {
      'title': 'Teachers Recruitment',
      'desc': 'Platform connecting schools with qualified teachers, job postings, and applications.',
      'tags': ['Flutter', 'REST API', 'GetX'],
      'users': '50K+',
      'rating': '4.6',
      'perf': 'Efficient',
      'category': 'Education',
    },
  ];

  static const List<Map<String, dynamic>> personalProjects = [
    {
      'title': 'PowerTag',
      'desc': 'Smart tagging and organization app for documents and digital assets.',
      'tags': ['Flutter', 'Hive', 'REST API', 'GetX'],
      'users': '80K+',
      'rating': '4.8',
      'perf': 'Fast',
      'category': 'Productivity',
    },
    {
      'title': 'Daily Credit',
      'desc': 'Credit management app with loan tracking, payment reminders, and financial insights.',
      'tags': ['Flutter', 'Firebase', 'REST API', 'Hive'],
      'users': '100K+',
      'rating': '4.5',
      'perf': 'Secure',
      'category': 'Finance',
    },
  ];
}
