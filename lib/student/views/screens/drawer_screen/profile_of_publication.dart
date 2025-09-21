import 'package:achuya_erp/app_color.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';

class PublicationProfileScreen extends StatefulWidget {
  @override
  _PublicationProfileScreenState createState() =>
      _PublicationProfileScreenState();
}

class _PublicationProfileScreenState extends State<PublicationProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final Color themeColor = AppColor.primary; // Your main theme color

  final List<Map<String, dynamic>> articles = [
    {
      'title': 'Breaking: Market Update',
      'author': 'John Doe',
      'date': 'Sep 19, 2025',
      'image':
      'https://images.unsplash.com/photo-1504384308090-c894fdcc538d?auto=format&fit=crop&w=80&q=80',
      'content':
      'This is a detailed update on the current market situation with all the relevant statistics and analysis.',
      'tags': ['Business', 'Politics'],
    },
    {
      'title': 'New AI Law Passed',
      'author': 'Jane Smith',
      'date': 'Sep 18, 2025',
      'image':
      'https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=80&q=80',
      'content':
      'The government has passed new regulations on artificial intelligence to ensure safety and ethical use.',
      'tags': ['Technology', 'Politics'],
    },
    {
      'title': 'Health Tips for 2025',
      'author': 'Alex Writer',
      'date': 'Sep 15, 2025',
      'image':
      'https://images.unsplash.com/photo-1515377905703-c4788e51af15?auto=format&fit=crop&w=80&q=80',
      'content':
      'Top health experts share tips to maintain good health and wellness in the coming year.',
      'tags': ['Health'],
    },
  ];

  final List<Map<String, String>> team = [
    {
      'name': 'John Doe',
      'role': 'Senior Editor',
      'image': 'https://randomuser.me/api/portraits/men/32.jpg',
      'bio':
      'John Doe has over 15 years of experience in journalism and leads the editorial team with passion.',
    },
    {
      'name': 'Jane Smith',
      'role': 'Tech Writer',
      'image': 'https://randomuser.me/api/portraits/women/44.jpg',
      'bio':
      'Jane specializes in technology news and has a knack for breaking down complex topics.',
    },
    {
      'name': 'Alex Writer',
      'role': 'Health Correspondent',
      'image': 'https://randomuser.me/api/portraits/men/54.jpg',
      'bio':
      'Alex covers health and wellness stories and has been a trusted voice in health journalism.',
    },
  ];

  final List<String> tags = [
    'Politics',
    'Health',
    'Technology',
    'Sports',
    'World',
    'Business',
    'Education',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildHeader() {
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl:
          'https://images.unsplash.com/photo-1509021436665-8f07dbf5bf1d?auto=format&fit=crop&w=800&q=80',
          height: 250,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Container(
          height: 250,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(0.6),
                Colors.transparent,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 20,
          right: 20,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CircleAvatar(
                radius: 38,
                backgroundColor: AppColor.white,
                child: CircleAvatar(
                  radius: 35,
                  backgroundImage: CachedNetworkImageProvider(
                    'https://images.unsplash.com/photo-1563694983011-6f4d90358083?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGxvZ298ZW58MHx8MHx8fDA%3D',
                  ),
                ),
              ),
              SizedBox(width: 18),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'The Daily Post',
                      style: TextStyle(
                        color: AppColor.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        shadows: [Shadow(blurRadius: 8, color: Colors.black54)],
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      '"Your trusted daily news"',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                        shadows: [Shadow(blurRadius: 6, color: Colors.black45)],
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.people, color: Colors.white70, size: 18),
                        SizedBox(width: 6),
                        Text(
                          '200k Followers',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                            shadows: [Shadow(blurRadius: 6, color: Colors.black45)],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildAboutSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About The Daily Post',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.grey[900]),
          ),
          SizedBox(height: 8),
          Text(
            'The Daily Post is your go-to source for fast, reliable, and comprehensive news coverage. We bring you the latest updates in politics, technology, health, and more.',
            style: TextStyle(fontSize: 15, color: Colors.grey[800]),
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Icon(Icons.public, color: themeColor),
              SizedBox(width: 8),
              Text(
                'Type: News & Magazine',
                style: TextStyle(fontSize: 14, color: Colors.grey[900]),
              ),
            ],
          ),
          SizedBox(height: 6),
          Row(
            children: [
              Icon(Icons.link, color: themeColor),
              SizedBox(width: 8),
              Text(
                'www.dailypost.com',
                style: TextStyle(
                    fontSize: 14,
                    color: themeColor,
                    decoration: TextDecoration.underline),
              ),
            ],
          ),
          SizedBox(height: 6),
          Row(
            children: [
              Icon(Icons.email, color: themeColor),
              SizedBox(width: 8),
              Text(
                'contact@dailypost.com',
                style: TextStyle(fontSize: 14, color: Colors.grey[900]),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildArticlesTab() {
    return ListView.separated(
      padding: EdgeInsets.all(16),
      itemCount: articles.length,
      separatorBuilder: (_, __) => SizedBox(height: 14),
      itemBuilder: (context, index) {
        final article = articles[index];
        return Card(
          elevation: 3,
          color: AppColor.white,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: ListTile(
            contentPadding: EdgeInsets.all(12),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: article['image']!,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              article['title']!,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: Text('${article['date']} | ${article['author']}'),
            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: themeColor),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ArticleDetailScreen(article: article),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildTeamTab() {
    return ListView.separated(
      padding: EdgeInsets.all(16),
      itemCount: team.length,
      separatorBuilder: (_, __) => SizedBox(height: 16),
      itemBuilder: (context, index) {
        final member = team[index];
        return ListTile(
          leading: CircleAvatar(
            radius: 28,
            backgroundImage: NetworkImage(member['image']!),
          ),
          title: Text(
            member['name']!,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          subtitle: Text(member['role']!),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => TeamMemberProfileScreen(member: member),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildTagsTab() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: tags
            .map(
              (tag) => InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => TagArticlesScreen(
                    tag: tag,
                    articles:
                    articles.where((article) {
                      final tagsList = (article['tags'] is List)
                          ? List<String>.from(article['tags'])
                          : <String>[];
                      return tagsList.contains(tag);
                    }).toList()

                  ),
                ),
              );
            },
            child: Chip(
              label: Text(tag),
              backgroundColor: themeColor.withOpacity(0.15),
              labelStyle: TextStyle(
                color: themeColor,
                fontWeight: FontWeight.w600,
              ),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            ),
          ),
        )
            .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(child: _buildHeader()),
            SliverToBoxAdapter(child: _buildAboutSection()),
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverTabBarDelegate(
                TabBar(
                  controller: _tabController,
                  labelColor: themeColor,
                  unselectedLabelColor: Colors.grey[600],
                  indicatorColor: themeColor,
                  indicatorWeight: 3,
                  tabs: [
                    Tab(text: "Articles"),
                    Tab(text: "Team"),
                    Tab(text: "Tags"),
                  ],
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            _buildArticlesTab(),
            _buildTeamTab(),
            _buildTagsTab(),
          ],
        ),
      ),
    );
  }
}

class _SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _SliverTabBarDelegate(this._tabBar);

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: AppColor.white,
      child: _tabBar,
      padding: EdgeInsets.symmetric(horizontal: 16),
    );
  }

  @override
  bool shouldRebuild(_SliverTabBarDelegate oldDelegate) => false;
}

// --------- New Screens ---------

class ArticleDetailScreen extends StatelessWidget {
  final Map<String, dynamic> article;

  const ArticleDetailScreen({required this.article});

  @override
  Widget build(BuildContext context) {
    final Color themeColor = AppColor.primary;

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColor.white),
        title: Text(article['title'],style: GoogleFonts.poppins(color: AppColor.white),),
        backgroundColor: themeColor,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl: article['image'],
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 12),
          Text(
            article['title'],
            style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 6),
          Text(
            'By ${article['author']} • ${article['date']}',
            style: GoogleFonts.poppins(color: Colors.grey[700], fontSize: 14),
          ),
          SizedBox(height: 16),
          Text(
            article['content'],
            style: GoogleFonts.poppins(fontSize: 16, height: 1.5),
          ),
          SizedBox(height: 24),
          Wrap(
            spacing: 8,
            children: (article['tags'] as List<String>).map((tag) {
              return Chip(
                label: Text(tag),
                backgroundColor: themeColor.withOpacity(0.15),
                labelStyle: GoogleFonts.poppins(
                  color: themeColor,
                  fontWeight: FontWeight.w600,
                ),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class TeamMemberProfileScreen extends StatelessWidget {
  final Map<String, String> member;

  const TeamMemberProfileScreen({required this.member});

  @override
  Widget build(BuildContext context) {
    final Color themeColor = AppColor.primary;

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColor.white),
        title: Text(member['name']!,style: GoogleFonts.poppins(color: AppColor.white),),
        backgroundColor: themeColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(member['image']!),
            ),
            SizedBox(height: 16),
            Text(
              member['name']!,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            Text(
              member['role']!,
              style: TextStyle(
                  fontSize: 18, color: Colors.grey[700], fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 24),
            Text(
              member['bio'] ?? '',
              style: TextStyle(fontSize: 16, height: 1.4),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class TagArticlesScreen extends StatelessWidget {
  final String tag;
  final List<Map<String, dynamic>> articles;

  const TagArticlesScreen({required this.tag, required this.articles});

  @override
  Widget build(BuildContext context) {
    final Color themeColor = AppColor.primary;
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColor.white),
        title: Text('Articles tagged "$tag"',style: GoogleFonts.poppins(color: AppColor.white),),
        backgroundColor: themeColor,
      ),
      body: articles.isEmpty
          ? Center(
        child: Text(
          'No articles found for "$tag"',
          style: TextStyle(fontSize: 18, color: Colors.grey[600]),
        ),
      )
          : ListView.separated(
        padding: EdgeInsets.all(16),
        itemCount: articles.length,
        separatorBuilder: (_, __) => SizedBox(height: 14),
        itemBuilder: (context, index) {
          final article = articles[index];
          return Card(
            elevation: 3,
            color: AppColor.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              contentPadding: EdgeInsets.all(12),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: article['image']!,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                article['title']!,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: Text('${article['date']} | ${article['author']}'),
              trailing:
              Icon(Icons.arrow_forward_ios, size: 18, color: themeColor),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ArticleDetailScreen(article: article),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
