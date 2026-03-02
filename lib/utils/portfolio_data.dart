import 'package:flutter/material.dart';

class PortfolioData {
  static const String name = 'Shashwat Srivastava';
  static const String title = 'Flutter Developer';
  static const String phone = '8076090538';
  static const String email = 'sswtsrv@gmail.com';
  static const String location = 'Kolkata, India';
  static const String linkedin = 'https://linkedin.com/in/shashwat-srivastava-flutter';
  static const String summary =
      'I am a dynamic Flutter Developer with over 2.6+ years of experience in creating and optimizing cross-platform mobile applications. My expertise includes extensive use of Flutter and Dart, real-time communication systems, and Firebase integration. I emphasize performance and responsive UI while collaborating effectively within teams. I leverage AI tools to enhance productivity, ensuring clean code practices and driving innovation throughout the mobile app lifecycle.';

  static const List<Map<String, dynamic>> experience = [
    {
      'company': 'UNITBIT PRIVATE LIMITED',
      'location': 'Kolkata, India',
      'role': 'Flutter Developer',
      'period': '08/2023 - Present',
      'description':
          'Designed, developed, and maintained multiple cross-platform mobile applications using Flutter 3.x and Dart 3. Developed and optimized real-money gaming, educational, and AI-powered chat applications with emphasis on performance architecture and responsive UI for enhanced user engagement.',
      'contributions': [
        'Built modular, reusable, and maintainable UI components using GetX for efficient state management and scalable development.',
        'Implemented WebSocket, and Firebase services (Cloud Messaging, and Authentication) to enable real-time synchronization and data persistence.',
        'Built modular, reusable, and maintainable UI components using GetX and MVC architecture patterns for efficient state management and scalable development.',
        'Integrated Firebase push notifications, match alerts, and Firebase Authentication.',
        'Developed and optimized real-money gaming, educational, and AI-powered chat applications with performance-focused architecture and responsive UI.',
        'Implemented SQLite-based offline caching, improving session recovery and offline accessibility for fantasy sports and gameplay applications.',
        'Collaborated closely with backend, UI/ UX, and QA teams to ensure seamless API integration, pixel-perfect design, and end-to-end user experience consistency.',
      ],
      'stats': [
        {'label': '2.6+', 'subLabel': 'Years Exp'},
        {'label': '11+', 'subLabel': 'Apps Built'},
        {'label': 'MVC', 'subLabel': 'Architecture'},
      ],
    },
  ];

  static const List<Map<String, dynamic>> education = [
    {
      'institution': 'Dr. A. P. J. Abdul Kalam Technical University',
      'location': 'Lucknow (College: Ghaziabad)',
      'degree': 'Bachelor of Technology in Computer Science and Engineering',
      'period': '08/2017 - 08/2021',
    },
  ];

  static const List<Map<String, dynamic>> techStacks = [
    {
      'title': 'Core Development',
      'icon': Icons.code_rounded,
      'tags': ['Flutter', 'Dart', 'Java', 'JavaScript', 'Android Studio', 'VS Code'],
      'usage': 0.95,
      'color': Color(0xFFA855F7),
    },
    {
      'title': 'Backend & Integration',
      'icon': Icons.alt_route_rounded,
      'tags': ['Google Firebase', 'FCM', 'API Integration', 'WebSocket', 'Google Places API'],
      'usage': 0.92,
      'color': Color(0xFF22D3EE),
    },
    {
      'title': 'Architecture & Practice',
      'icon': Icons.architecture_rounded,
      'tags': ['MVC Architecture', 'Clean Architecture', 'Clean Code', 'Agile Workflow', 'Scrum'],
      'usage': 0.94,
      'color': Color(0xFFEC4899),
    },
    {
      'title': 'Database & Storage',
      'icon': Icons.storage_rounded,
      'tags': ['SQLite', 'Caching', 'Data Persistence'],
      'usage': 0.88,
      'color': Color(0xFF10B981),
    },
    {
      'title': 'Version Control & AI',
      'icon': Icons.smart_toy_rounded,
      'tags': ['Github', 'Antigravity (GenAI)', 'Git'],
      'usage': 0.90,
      'color': Color(0xFF6366F1),
    },
  ];

  static const List<Map<String, dynamic>> industryProjects = [
    {
      'title': 'Daily Credit',
      'desc': 'Digital Credit Ledger Platform (similar to OkCredit) for merchant-customer transaction management.',
      'tags': ['Flutter', 'Flutter Web', 'GenAI-Assisted', 'Clean Architecture'],
      'users': 'FinTech',
      'period': '02/2026 - Present',
      'category': 'Finance',
      'colors': [Color(0xFF10B981), Color(0xFF22C55E)],
      'details': [
        'Architected and developed an end-to-end digital credit ledger system.',
        'Engineered mobile app using Flutter with optimized state management.',
        'Built responsive admin dashboard using Flutter Web.',
        'Leveraged Antigravity for enhanced efficiency.',
      ],
      'image': 'assets/images/dailyCredit.png',
    },
    {
      'title': 'Online Teachers Exchange',
      'desc': 'Full-stack recruitment platform for the education sector with multi-role support.',
      'tags': ['Flutter', 'Flutter Web', 'Multi-Role', 'Client Delivery'],
      'users': 'Education',
      'period': '01/2026 - Present',
      'category': 'Education',
      'colors': [Color(0xFF3B82F6), Color(0xFF6366F1)],
      'details': [
        'Architected recruitment platform for School Teachers, College Professors, and Tutors.',
        'Developed recruiter dashboards for job creation and candidate management.',
        'Built centralized Flutter Web Admin Panel for monitoring activity.',
        'Implemented advanced role-based access control.',
      ],
      'image': 'assets/images/otx.png',
    },
    {
      'title': 'SlateParakeet',
      'desc': 'Hyperlocal service discovery platform for finding nearby tailors via GPS.',
      'tags': ['Flutter', 'Location Intelligence', 'GPS', 'Radius-based Search'],
      'users': 'Local Service',
      'period': '11/2025 - 12/2025',
      'category': 'Location Based',
      'colors': [Color(0xFFF97316), Color(0xFFEF4444)],
      'details': [
        'Engineered radius-based search using latitude-longitude filtering.',
        'Implemented dynamic service listings with location-aware sorting.',
        'Optimized location accuracy and response time.',
      ],
      'image': 'assets/images/slateparakeet.png',
    },
    {
      'title': 'PowerTag',
      'desc': 'FASTag lifecycle management system for sales, issuance, and activation operations.',
      'tags': ['Flutter', 'FinTech', 'Operations', 'Mobile + Web'],
      'users': 'Corporate',
      'period': '10/2025 - 11/2025',
      'category': 'FinTech',
      'colors': [Color(0xFFEAB308), Color(0xFFF97316)],
      'details': [
        'Architected end-to-end system for FASTag sales and activation.',
        'Engineered mobile app for field agents for real-time onboarding.',
        'Designed scalable Flutter Web Admin Dashboard for sales monitoring.',
      ],
      'image': 'assets/images/powerTag.png',
    },
    {
      'title': 'Unibit Pool',
      'desc': 'Multiplayer Ludo Pool Game with live shot tracking and real-money gaming.',
      'tags': ['Flutter', 'WebSocket', 'Firebase RTDB', 'Custom Painter'],
      'users': 'Gaming',
      'period': '12/2024 - 02/2025',
      'category': 'Gaming',
      'colors': [Color(0xFF06B6D4), Color(0xFF3B82F6)],
      'details': [
        'Developed real-money pool game with live multiplayer gameplay.',
        'Designed interactive UIs using Flutter Custom Painter.',
        'Integrated WebSocket and Firebase RTDB for live shot tracking.',
      ],
      'image': 'assets/images/unibit pool.png',
    },
    {
      'title': 'Ludo 24',
      'desc': 'Real-money multiplayer Ludo application with tournaments and wallet transactions.',
      'tags': ['Flutter', 'GetX', 'REST API', 'Game Sync'],
      'users': 'Gaming',
      'period': '08/2024 - 11/2024',
      'category': 'Gaming',
      'colors': [Color(0xFFA855F7), Color(0xFFEC4899)],
      'details': ['Engineered cross-platform Ludo for real-money tournaments.', 'Employed GetX for efficient state management and sync.', 'Developed responsive wallet and leaderboard modules.'],
      'image': 'assets/images/ludo24.png',
    },
    {
      'title': 'Unibit Games',
      'desc': 'Real-money gaming platform with multiplayer sync and wallet management.',
      'tags': ['Flutter', 'WebSocket', 'Firebase RTDB', 'Gaming'],
      'period': '04/2024 - 09/2024',
      'category': 'Gaming',
      'colors': [Color(0xFF8B5CF6), Color(0xFFA855F7)],
      'image': 'assets/images/unibit games.png',
    },
    {
      'title': 'Unibit 11',
      'desc': 'Fantasy sports platform with real-time match data and team creation.',
      'tags': ['Flutter', 'GetX', 'SQLite', 'FCM'],
      'period': '11/2023 - 03/2024',
      'category': 'Sports',
      'colors': [Color(0xFF14B8A6), Color(0xFF06B6D4)],
      'image': 'assets/images/unibit11.png',
    },
    {
      'title': 'Edepto',
      'desc': 'Competitive exam preparation app with mock tests and test analytics.',
      'tags': ['Flutter', 'GetX', 'Firebase Auth', 'REST API'],
      'period': '08/2023 - 11/2023',
      'category': 'Education',
      'colors': [Color(0xFF6366F1), Color(0xFF3B82F6)],
      'image': 'assets/images/edepto.png',
    },
  ];

  static const List<Map<String, dynamic>> personalProjects = [
    {
      'title': 'Portfolio',
      'desc': 'Real-money gaming platform with multiplayer sync and wallet management.',
      'tags': ['Flutter', 'Dart', 'Antigravity'],
      'period': '04/2024 - 09/2024',
      'category': 'Gaming',
      'colors': [Color(0xFF8B5CF6), Color(0xFFA855F7)],
      'image': 'assets/images/portfolio.png',
      'link': 'https://github.com/DevYashFlutter/portfilio_full.git',
    },
    {
      'title': 'Google Contacts',
      'desc': 'Fantasy sports platform with real-time match data and team creation.',
      'tags': ['Flutter', 'GetX', 'SQLite', 'FCM'],
      'period': '11/2023 - 03/2024',
      'category': 'Sports',
      'colors': [Color(0xFF14B8A6), Color(0xFF06B6D4)],
      'image': 'assets/images/contact23.png',
      'link': 'https://github.com/DevYashFlutter/googleContact.git',
    },
  ];
}
