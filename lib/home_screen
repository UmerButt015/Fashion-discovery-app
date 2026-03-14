import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// ─────────────────────────────────────────────────────────
// DATA MODELS
// ─────────────────────────────────────────────────────────
class ProductCard {
  final String name;
  final String price;
  final Color backgroundColor;
  final String imagePath;
  final double heightFactor;

  const ProductCard({
    required this.name,
    required this.price,
    required this.backgroundColor,
    required this.imagePath,
    required this.heightFactor,
  });
}

class FeaturedShoeCard {
  final String name;
  final String price;
  final List<String> images;

  const FeaturedShoeCard({
    required this.name,
    required this.price,
    required this.images,
  });
}

// ─────────────────────────────────────────────────────────
// HOME SCREEN
// ─────────────────────────────────────────────────────────
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _bottomNavIndex = 0;
  int _selectedTabIndex = 0;
  bool _showFilterTags = false;
  int _selectedFilterIndex = 0;

  final List<String> _filterTags = ['For You', 'Men', 'Women', 'Jackets'];

  // ── LEFT COLUMN ───────────────────────────────────────
  final List<ProductCard> _leftCards = const [
    ProductCard(
      name: 'Box Fit Minecraft Tee',
      price: 'R4 999.99',
      backgroundColor: Color(0xFFEDEDED),
      imagePath: 'assets/images/shoe.png',
      heightFactor: 1.08,
    ),
    ProductCard(
      name: 'Colour Between Lines',
      price: 'R16 999.99',
      backgroundColor: Color(0xFFF3F3F3),
      imagePath: 'assets/images/jacket_person.png',
      heightFactor: 1.22,
    ),
  ];

  // ── RIGHT COLUMN ──────────────────────────────────────
  final List<ProductCard> _rightCards = const [
    ProductCard(
      name: 'Box Fit Minecraft Tee',
      price: 'R4 999.99',
      backgroundColor: Color(0xFFEC8080),
      imagePath: 'assets/images/person.png',
      heightFactor: 1.88,
    ),
    ProductCard(
      name: 'A-H-D Oversized Tee',
      price: 'R899.99',
      backgroundColor: Color(0xFFEDEDED),
      imagePath: 'assets/images/shoe.png',
      heightFactor: 0.42,
    ),
  ];

  // ── FEATURED SHOE CAROUSEL ────────────────────────────
  final List<FeaturedShoeCard> _featuredShoes = const [
    FeaturedShoeCard(
      name: 'Nike – Off White × Virgil Abloh 2019',
      price: 'R4 999.99',
      images: [
        'assets/images/shoe.png',
        'assets/images/shoe2.png',
        'assets/images/shoe3.png',
      ],
    ),
    FeaturedShoeCard(
      name: 'Adidas Ultraboost Limited Edition',
      price: 'R3 499.99',
      images: [
        'assets/images/shoe2.png',
        'assets/images/shoe.png',
        'assets/images/shoe3.png',
      ],
    ),
    FeaturedShoeCard(
      name: 'Jordan 1 Retro High OG',
      price: 'R5 299.99',
      images: [
        'assets/images/shoe3.png',
        'assets/images/shoe2.png',
        'assets/images/shoe.png',
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final sw = mq.size.width;
    final sh = mq.size.height;
    final topPad = mq.padding.top;
    final bottomPad = mq.padding.bottom;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: topPad),
          _buildTopBar(sw),
          Container(height: 1, color: const Color(0xFFF0F0F0)),
          SizedBox(height: sh * 0.013),
          _buildSearchBar(sw),
          if (_showFilterTags) ...[
            SizedBox(height: sh * 0.015),
            _buildFilterTags(sw),
          ],
          SizedBox(height: sh * 0.012),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeroImage(sw, sh),
                  SizedBox(height: sh * 0.024),
                  _buildHeroContent(sw, sh), // ← contains both buttons
                  SizedBox(height: sh * 0.032),
                  _buildForYouLabel(sw),
                  SizedBox(height: sh * 0.018),
                  _buildStaggeredGrid(sw),
                  SizedBox(height: sh * 0.036),
                  _buildFeaturedLabel(sw),
                  SizedBox(height: sh * 0.018),
                  _buildFeaturedShoeCarousel(sw, sh),
                  SizedBox(height: sh * 0.04),
                ],
              ),
            ),
          ),
          _buildBottomNav(sw, bottomPad),
        ],
      ),
    );
  }

  // ─── TOP BAR ──────────────────────────────────────────
  Widget _buildTopBar(double sw) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: sw * 0.05),
      child: Row(
        children: [
          _buildTabItem('For You', 0, sw),
          SizedBox(width: sw * 0.07),
          _buildTabItem('Explore', 1, sw),
        ],
      ),
    );
  }

  Widget _buildTabItem(String label, int index, double sw) {
    final sel = _selectedTabIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedTabIndex = index),
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.only(top: 14, bottom: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: sw * 0.04,
                fontWeight: sel ? FontWeight.w700 : FontWeight.w400,
                color: sel ? const Color(0xFF1A1A2E) : const Color(0xFF9E9E9E),
              ),
            ),
            const SizedBox(height: 7),
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              height: 2.5,
              width: sel ? sw * 0.15 : 0,
              decoration: BoxDecoration(
                color: const Color(0xFF2979FF),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ─── SEARCH BAR ────────────────────────────────────────
  Widget _buildSearchBar(double sw) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sw * 0.048),
      child: Container(
        height: sw * 0.108,
        decoration: BoxDecoration(
          color: const Color(0xFFF7F7F7),
          borderRadius: BorderRadius.circular(sw * 0.028),
        ),
        child: Row(
          children: [
            SizedBox(width: sw * 0.035),
            Icon(
              Icons.search_rounded,
              color: const Color(0xFFB8B8B8),
              size: sw * 0.048,
            ),
            SizedBox(width: sw * 0.022),
            Expanded(
              child: Text(
                'Search your product...',
                style: TextStyle(
                  fontSize: sw * 0.034,
                  color: const Color(0xFFBBBBBB),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => setState(() => _showFilterTags = !_showFilterTags),
              child: Container(
                margin: EdgeInsets.only(right: sw * 0.025),
                width: sw * 0.08,
                height: sw * 0.08,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(sw * 0.018),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.09),
                      blurRadius: 6,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(
                    Icons.tune_rounded,
                    size: sw * 0.042,
                    color:
                        _showFilterTags
                            ? const Color(0xFF2979FF)
                            : const Color(0xFFB8B8B8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ─── FILTER TAGS ───────────────────────────────────────
  Widget _buildFilterTags(double sw) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sw * 0.048),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
          children: List.generate(_filterTags.length, (i) {
            final sel = _selectedFilterIndex == i;
            return GestureDetector(
              onTap: () => setState(() => _selectedFilterIndex = i),
              child: Container(
                margin: EdgeInsets.only(right: sw * 0.03),
                padding: EdgeInsets.symmetric(
                  horizontal: sw * 0.042,
                  vertical: sw * 0.02,
                ),
                decoration: BoxDecoration(
                  color:
                      sel ? const Color(0xFF2979FF) : const Color(0xFFF0F0F0),
                  borderRadius: BorderRadius.circular(sw * 0.06),
                  border:
                      sel
                          ? null
                          : Border.all(
                            color: const Color(0xFFE0E0E0),
                            width: 1,
                          ),
                ),
                child: Text(
                  _filterTags[i],
                  style: TextStyle(
                    fontSize: sw * 0.032,
                    fontWeight: sel ? FontWeight.w600 : FontWeight.w400,
                    color: sel ? Colors.white : const Color(0xFF6B6B6B),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  // ─── HERO BANNER IMAGE ─────────────────────────────────
  Widget _buildHeroImage(double sw, double sh) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sw * 0.048),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(sw * 0.05),
        child: SizedBox(
          width: double.infinity,
          height: sh * 0.35,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFFEF8080), Color(0xFFFFD6D3)],
                  ),
                ),
              ),
              Center(
                child: Image.asset(
                  'assets/images/person.png',
                  fit: BoxFit.contain,
                  width: sw * 0.65,
                  errorBuilder:
                      (_, __, ___) => Icon(
                        Icons.person,
                        size: sw * 0.42,
                        color: Colors.white.withOpacity(0.7),
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ─── HERO CONTENT ──────────────────────────────────────
  // ✅ Only change from original: buttons row now has TWO buttons
  //    - "Shop Now"  (dark navy, original)
  //    - "Trending"  (blue, NEW — navigates to /trending-brands)
  Widget _buildHeroContent(double sw, double sh) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sw * 0.048),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Heading ──────────────────────────────────
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Emerging ',
                  style: TextStyle(
                    fontSize: sw * 0.072,
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic,
                    color: const Color(0xFF1A1A2E),
                    height: 1.1,
                  ),
                ),
                TextSpan(
                  text: 'Designers',
                  style: TextStyle(
                    fontSize: sw * 0.072,
                    fontWeight: FontWeight.w900,
                    color: const Color(0xFF1A1A2E),
                    height: 1.1,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: sh * 0.012),

          // ── Subtitle ─────────────────────────────────
          Text(
            'Explore small businesses and discover unique,\none-of-a-kind looks.',
            style: TextStyle(
              fontSize: sw * 0.034,
              color: const Color(0xFF6B6B6B),
              height: 1.55,
            ),
          ),

          SizedBox(height: sh * 0.022),

          // ── Button Row: Shop Now  +  Trending ────────
          Row(
            children: [
              // ── Shop Now (original, unchanged) ───────
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: sw * 0.05,
                    vertical: sh * 0.014,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1A1A2E),
                    borderRadius: BorderRadius.circular(sw * 0.09),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Shop Now',
                        style: TextStyle(
                          fontSize: sw * 0.037,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          letterSpacing: 0.3,
                        ),
                      ),
                      SizedBox(width: sw * 0.025),
                      Icon(
                        Icons.arrow_forward_rounded,
                        color: Colors.white,
                        size: sw * 0.044,
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(width: sw * 0.030),

              // ── Trending Brands (NEW blue button) ─────
              // Same pill shape, same height, blue fill, fire icon
              GestureDetector(
                onTap: () => context.push('/trending-brands'),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: sw * 0.042,
                    vertical: sh * 0.014,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2979FF),
                    borderRadius: BorderRadius.circular(sw * 0.09),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF2979FF).withOpacity(0.35),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.local_fire_department_rounded,
                        color: Colors.white,
                        size: sw * 0.042,
                      ),
                      SizedBox(width: sw * 0.018),
                      Text(
                        'Trending',
                        style: TextStyle(
                          fontSize: sw * 0.035,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ─── FOR YOU LABEL ─────────────────────────────────────
  Widget _buildForYouLabel(double sw) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sw * 0.048),
      child: Text(
        'For You:',
        style: TextStyle(
          fontSize: sw * 0.05,
          fontWeight: FontWeight.w800,
          color: const Color(0xFF1A1A2E),
        ),
      ),
    );
  }

  // ─── FEATURED SECTION LABEL ───────────────────────────
  Widget _buildFeaturedLabel(double sw) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sw * 0.048),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Featured Drops:',
            style: TextStyle(
              fontSize: sw * 0.05,
              fontWeight: FontWeight.w800,
              color: const Color(0xFF1A1A2E),
            ),
          ),
          Text(
            'See All',
            style: TextStyle(
              fontSize: sw * 0.034,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF2979FF),
            ),
          ),
        ],
      ),
    );
  }

  // ─── STAGGERED 2-COLUMN GRID (unchanged) ──────────────
  Widget _buildStaggeredGrid(double sw) {
    final double hPad = sw * 0.048;
    final double gap = sw * 0.030;
    final double cardW = (sw - hPad * 2 - gap) / 2;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hPad),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: cardW,
            child: Column(
              children: [
                _buildCard(
                  card: _leftCards[0],
                  cardW: cardW,
                  cardH: cardW * _leftCards[0].heightFactor,
                  isPersonCard: false,
                ),
                SizedBox(height: gap),
                _buildCard(
                  card: _leftCards[1],
                  cardW: cardW,
                  cardH: cardW * _leftCards[1].heightFactor,
                  isPersonCard: false,
                ),
              ],
            ),
          ),
          SizedBox(width: gap),
          SizedBox(
            width: cardW,
            child: Column(
              children: [
                _buildCard(
                  card: _rightCards[0],
                  cardW: cardW,
                  cardH: cardW * _rightCards[0].heightFactor,
                  isPersonCard: true,
                ),
                SizedBox(height: gap),
                _buildCard(
                  card: _rightCards[1],
                  cardW: cardW,
                  cardH: cardW * _rightCards[1].heightFactor,
                  isPersonCard: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ─── SINGLE PRODUCT CARD (unchanged) ──────────────────
  Widget _buildCard({
    required ProductCard card,
    required double cardW,
    required double cardH,
    required bool isPersonCard,
  }) {
    final double radius = cardW * 0.075;
    final double overlayH = cardW * 0.20;
    final double avatarD = overlayH * 0.72;
    final double fontSize = cardW * 0.066;

    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: SizedBox(
        width: cardW,
        height: cardH,
        child: Stack(
          children: [
            Positioned.fill(
              child:
                  isPersonCard
                      ? Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xFFEC7575), Color(0xFFFFD0CF)],
                          ),
                        ),
                      )
                      : Container(color: card.backgroundColor),
            ),
            Positioned.fill(
              child: Image.asset(
                card.imagePath,
                fit: isPersonCard ? BoxFit.cover : BoxFit.contain,
                alignment:
                    isPersonCard ? Alignment.topCenter : Alignment.center,
                errorBuilder:
                    (_, __, ___) => Center(
                      child: Icon(
                        isPersonCard
                            ? Icons.person_outline_rounded
                            : Icons.shopping_bag_outlined,
                        size: cardW * 0.35,
                        color:
                            isPersonCard
                                ? Colors.white.withOpacity(0.5)
                                : Colors.grey.withOpacity(0.4),
                      ),
                    ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: overlayH,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.0),
                      Colors.black.withOpacity(0.70),
                    ],
                  ),
                ),
                padding: EdgeInsets.only(
                  left: cardW * 0.045,
                  right: cardW * 0.045,
                  bottom: cardW * 0.038,
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: avatarD,
                        height: avatarD,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 1.8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/girl.png',
                            fit: BoxFit.cover,
                            errorBuilder:
                                (_, __, ___) => Container(
                                  color: const Color(0xFF9C4E8F),
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.white,
                                    size: avatarD * 0.55,
                                  ),
                                ),
                          ),
                        ),
                      ),
                      SizedBox(width: cardW * 0.028),
                      Expanded(
                        child: Text(
                          card.name,
                          style: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            height: 1.2,
                            shadows: const [
                              Shadow(color: Colors.black38, blurRadius: 6),
                            ],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: cardW * 0.018),
                      Text(
                        card.price,
                        style: TextStyle(
                          fontSize: fontSize,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          shadows: const [
                            Shadow(color: Colors.black38, blurRadius: 6),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ─── FEATURED SHOE CAROUSEL (unchanged) ───────────────
  Widget _buildFeaturedShoeCarousel(double sw, double sh) {
    return SizedBox(
      height: sh * 0.42,
      child: PageView.builder(
        padEnds: false,
        controller: PageController(viewportFraction: 0.88),
        physics: const BouncingScrollPhysics(),
        itemCount: _featuredShoes.length,
        itemBuilder: (_, i) {
          return Padding(
            padding: EdgeInsets.only(
              left: i == 0 ? sw * 0.048 : sw * 0.015,
              right: sw * 0.015,
            ),
            child: _FeaturedShoeCardWidget(
              data: _featuredShoes[i],
              cardH: sh * 0.42,
            ),
          );
        },
      ),
    );
  }

  // ─── BOTTOM NAV (unchanged) ────────────────────────────
  Widget _buildBottomNav(double sw, double bottomPad) {
    return Container(
      width: double.infinity,
      height: sw * 0.165 + bottomPad,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 16,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(bottom: bottomPad),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _navItem(
              Icons.shopping_bag_outlined,
              Icons.shopping_bag,
              'Shop',
              0,
              sw,
            ),
            _navItem(
              Icons.shopping_cart_outlined,
              Icons.shopping_cart,
              'Cart',
              1,
              sw,
            ),
            _navItem(
              Icons.person_outline_rounded,
              Icons.person_rounded,
              'Profile',
              2,
              sw,
            ),
          ],
        ),
      ),
    );
  }

  Widget _navItem(
    IconData icon,
    IconData activeIcon,
    String label,
    int index,
    double sw,
  ) {
    final active = _bottomNavIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _bottomNavIndex = index),
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: sw * 0.22,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              active ? activeIcon : icon,
              size: sw * 0.062,
              color: active ? const Color(0xFF2979FF) : const Color(0xFFB8B8B8),
            ),
            SizedBox(height: sw * 0.01),
            Text(
              label,
              style: TextStyle(
                fontSize: sw * 0.028,
                fontWeight: active ? FontWeight.w600 : FontWeight.w400,
                color:
                    active ? const Color(0xFF2979FF) : const Color(0xFFB8B8B8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────
// FEATURED SHOE CARD WIDGET (unchanged)
// ─────────────────────────────────────────────────────────
class _FeaturedShoeCardWidget extends StatefulWidget {
  final FeaturedShoeCard data;
  final double cardH;

  const _FeaturedShoeCardWidget({required this.data, required this.cardH});

  @override
  State<_FeaturedShoeCardWidget> createState() =>
      _FeaturedShoeCardWidgetState();
}

class _FeaturedShoeCardWidgetState extends State<_FeaturedShoeCardWidget> {
  late final PageController _ctrl;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    _ctrl = PageController();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;

    final double radius = widget.cardH * 0.055;
    final double overlayH = widget.cardH * 0.22;
    final double avatarD = overlayH * 0.55;
    final double dotAreaH = widget.cardH * 0.065;
    final double nameFontSz = sw * 0.033;
    final double priceFontSz = sw * 0.033;

    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: SizedBox(
        width: double.infinity,
        height: widget.cardH,
        child: Stack(
          children: [
            Positioned.fill(child: Container(color: const Color(0xFF1C1C1E))),
            Positioned.fill(
              child: PageView.builder(
                controller: _ctrl,
                physics: const BouncingScrollPhysics(),
                itemCount: widget.data.images.length,
                onPageChanged: (i) => setState(() => _page = i),
                itemBuilder:
                    (_, i) => Image.asset(
                      widget.data.images[i],
                      fit: BoxFit.cover,
                      errorBuilder:
                          (_, __, ___) => Container(
                            color: const Color(0xFF2A2A2E),
                            child: Icon(
                              Icons.shopping_bag_outlined,
                              size: sw * 0.22,
                              color: Colors.white.withOpacity(0.2),
                            ),
                          ),
                    ),
              ),
            ),
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0.35, 1.0],
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.80),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: overlayH + dotAreaH * 0.18,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(widget.data.images.length, (i) {
                  final active = _page == i;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    margin: EdgeInsets.symmetric(horizontal: sw * 0.010),
                    width: active ? sw * 0.058 : sw * 0.022,
                    height: sw * 0.022,
                    decoration: BoxDecoration(
                      color:
                          active
                              ? const Color(0xFF2979FF)
                              : Colors.white.withOpacity(0.55),
                      borderRadius: BorderRadius.circular(sw * 0.015),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: overlayH,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: sw * 0.042,
                ).copyWith(bottom: sw * 0.038),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: avatarD,
                        height: avatarD,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.35),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/girl.png',
                            fit: BoxFit.cover,
                            errorBuilder:
                                (_, __, ___) => Container(
                                  color: const Color(0xFF9C4E8F),
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.white,
                                    size: avatarD * 0.55,
                                  ),
                                ),
                          ),
                        ),
                      ),
                      SizedBox(width: sw * 0.030),
                      Expanded(
                        child: Text(
                          widget.data.name,
                          style: TextStyle(
                            fontSize: nameFontSz,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            height: 1.25,
                            shadows: const [
                              Shadow(color: Colors.black54, blurRadius: 8),
                            ],
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: sw * 0.022),
                      Text(
                        widget.data.price,
                        style: TextStyle(
                          fontSize: priceFontSz,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          shadows: const [
                            Shadow(color: Colors.black54, blurRadius: 8),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
