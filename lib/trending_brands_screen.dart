import 'package:flutter/material.dart';

class TrendingBrandsScreen extends StatelessWidget {
  const TrendingBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Top Navigation with For You and World tabs
            Container(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 12,
                bottom: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // For You and World tabs
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 18,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: const Text(
                          'For You',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'World',
                        style: TextStyle(
                          color: Color(0xFF9A9A9A),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  // Notification icon and profile
                  Row(
                    children: [
                      Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F5F5),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.notifications_none,
                          size: 22,
                          color: Color(0xFF333333),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFFE0E0E0),
                            width: 2,
                          ),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/profile_girl.png',
                            fit: BoxFit.cover,
                            errorBuilder:
                                (context, error, stackTrace) => Container(
                                  color: const Color(0xFFE8E8E8),
                                  child: const Icon(
                                    Icons.person,
                                    color: Color(0xFF999999),
                                    size: 22,
                                  ),
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Search Bar
            Container(
              margin: const EdgeInsets.fromLTRB(20, 8, 20, 16),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xFFF8F8F8),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: const Color(0xFFE8E8E8), width: 1),
              ),
              child: const Row(
                children: [
                  Icon(Icons.search, color: Color(0xFF9A9A9A), size: 22),
                  SizedBox(width: 12),
                  Text(
                    'Search your product...',
                    style: TextStyle(
                      color: Color(0xFF9A9A9A),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),

            // Main Content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Profile Avatars Row
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 8,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildAvatarPair('Person1', [
                            'assets/person1_1.png',
                            'assets/person1_2.png',
                          ]),
                          _buildAvatarPair('Person2', [
                            'assets/person2_1.png',
                            'assets/person2_2.png',
                          ]),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Trending Brands Header
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Trending Brands',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF000000),
                              height: 1.1,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Loved by the community, picked by us — these brands are changing the game from the ground up.',
                            style: TextStyle(
                              fontSize: 15,
                              height: 1.4,
                              color: Colors.grey[700],
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Brand Cards
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          _buildBrandCard(
                            name: 'Amanda’s Boutique',
                            description:
                                'A modern designer with a youthful spirit, dedicated to hand-making every piece with care....',
                            initial: 'A',
                            imageAsset: 'assets/jacket_person.png',
                          ),
                          const SizedBox(height: 16),

                          _buildBrandCard(
                            name: 'Nike',
                            description: 'Just Do It',
                            initial: 'N',
                            imageAsset: 'assets/shoe.png',
                          ),
                          const SizedBox(height: 16),

                          _buildBrandCard(
                            name: 'LOST COINS',
                            description: '',
                            initial: 'L',
                            imageAsset: 'assets/shoe2.png',
                          ),
                          const SizedBox(height: 16),

                          _buildBrandCard(
                            name: 'Yousaf',
                            description: 'Wear the mood, not the label.',
                            initial: 'Y',
                            imageAsset: 'assets/shoe3.png',
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Explore the Global Scene
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 14,
                              horizontal: 24,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF5F5F5),
                              borderRadius: BorderRadius.circular(40),
                              border: Border.all(
                                color: const Color(0xFFE0E0E0),
                                width: 1,
                              ),
                            ),
                            child: const Row(
                              children: [
                                Text(
                                  'Explore the Global Scene',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Icon(
                                  Icons.arrow_forward,
                                  size: 18,
                                  color: Color(0xFF000000),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 32),

                    // For You Section
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'For You:',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF888888),
                              letterSpacing: 0.3,
                            ),
                          ),
                          const SizedBox(height: 20),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildBottomNavItem(Icons.store_outlined, 'Shop'),
                              _buildBottomNavItem(
                                Icons.shopping_cart_outlined,
                                'Cart',
                              ),
                              _buildBottomNavItem(
                                Icons.person_outline,
                                'Profile',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatarPair(String name, List<String> images) {
    return Column(
      children: [
        SizedBox(
          height: 56,
          width: 90,
          child: Stack(
            children: [
              // First avatar
              Positioned(
                left: 0,
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2.5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      images[0],
                      fit: BoxFit.cover,
                      errorBuilder:
                          (context, error, stackTrace) => Container(
                            color: const Color(0xFFE0E0E0),
                            child: const Icon(
                              Icons.person,
                              color: Color(0xFF999999),
                            ),
                          ),
                    ),
                  ),
                ),
              ),
              // Second avatar (overlapping)
              Positioned(
                left: 28,
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2.5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      images[1],
                      fit: BoxFit.cover,
                      errorBuilder:
                          (context, error, stackTrace) => Container(
                            color: const Color(0xFFD0D0D0),
                            child: const Icon(
                              Icons.person,
                              color: Color(0xFF888888),
                            ),
                          ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF333333),
          ),
        ),
      ],
    );
  }

  Widget _buildBrandCard({
    required String name,
    required String description,
    required String initial,
    required String imageAsset,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFEEEEEE), width: 1.2),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Brand image
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: const Color(0xFFF8F8F8),
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFFEEEEEE), width: 1),
            ),
            child: ClipOval(
              child: Image.asset(
                imageAsset,
                fit: BoxFit.cover,
                errorBuilder:
                    (context, error, stackTrace) => Center(
                      child: Text(
                        initial,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF999999),
                        ),
                      ),
                    ),
              ),
            ),
          ),
          const SizedBox(width: 16),

          // Brand details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF000000),
                  ),
                ),
                if (description.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.3,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: const Color(0xFFDDDDDD),
                      width: 1,
                    ),
                  ),
                  child: const Text(
                    'More',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF333333),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavItem(IconData icon, String label) {
    return Column(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFFEEEEEE), width: 1.5),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.02),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Icon(icon, size: 24, color: const Color(0xFF333333)),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Color(0xFF666666),
          ),
        ),
      ],
    );
  }
}
