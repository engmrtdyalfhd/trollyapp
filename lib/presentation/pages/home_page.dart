import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'متجر إلكتروني',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Cairo', // خط عربي
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final PageController _carouselController = PageController();

  // بيانات الفئات
  final List<Map<String, dynamic>> categories = [
    {'name': 'الفئات', 'icon': Icons.category, 'color': Colors.blue},
    {'name': 'الدختر طلباً', 'icon': Icons.star, 'color': Colors.orange},
    {'name': 'مليونيتر توسان', 'icon': Icons.car_repair, 'color': Colors.green, 'price': '350 ر.ب'},
    {'name': 'المثبت', 'icon': Icons.build, 'color': Colors.purple},
    {'name': 'الطعم', 'icon': Icons.restaurant, 'color': Colors.red},
    {'name': 'خضروات طازجة', 'icon': Icons.eco, 'color': Colors.teal},
    {'name': 'الدوم', 'icon': Icons.park, 'color': Colors.brown},
  ];

  // بيانات المنتجات
  final List<Map<String, dynamic>> products = [
    {
      'name': 'الطعم الاذا مع جلجينية الحاولتي', 
      'price': '800 ر.س', 
      'image': 'assets/product1.jpg',
      'tag': 'إعادة السنة'
    },
    {
      'name': 'حلجينة سمسم', 
      'price': '800 ر.س', 
      'image': 'assets/product2.jpg',
      'tag': 'إعادة السنة'
    },
    {
      'name': 'عرض الخل', 
      'price': '450 ر.س', 
      'image': 'assets/product3.jpg',
      'tag': 'عرض خاص'
    },
    {
      'name': 'خضروات طازجة', 
      'price': '200 ر.س', 
      'image': 'assets/product4.jpg',
      'tag': 'جديد'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          title:  Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage('https://via.placeholder.com/40'),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('مرحباً نادر', style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.location_on, size: 16, color: Colors.blue),
                          SizedBox(width: 4),
                          Text('حدد موقعك الآن', style: TextStyle(fontSize: 12, color: Colors.blue)),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.payment, size: 16, color: Colors.blue),
                        SizedBox(width: 4),
                        Text('350 ر.ب', style: TextStyle(fontSize: 12, color: Colors.blue)),
                      ],
                    ),
                  ),
                ],
              ),
          actions: [
            IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.black),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(Icons.search, color: Colors.grey),
                SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'ابحث عن المنتجات',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
              // قسم الترحيب
             
              SizedBox(height: 20),
              
              // صور الشرائح
              Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[200],
                ),
                child: PageView(
                  controller: _carouselController,
                  children: [
                    Image.asset('assets/images/Group 1082 (2).png', fit: BoxFit.cover),
                    Image.asset('assets/images/Rectangle 998 (7).png', fit: BoxFit.cover),
                    Image.asset('assets/images/Rectangle 999 (2).png', fit: BoxFit.cover),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return Container(
                    width: 8,
                    height: 8,
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index == 0 ? Colors.blue : Colors.grey[300],
                    ),
                  );
                }),
              ),
              SizedBox(height: 24),
              
              // الفئات
              Text('الفئات', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 12),
              Container(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 80,
                      margin: EdgeInsets.only(left: index == 0 ? 0 : 12),
                      child: Column(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: categories[index]['color'].withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(categories[index]['icon'], 
                                color: categories[index]['color']),
                          ),
                          SizedBox(height: 8),
                          Text(
                            categories[index]['name'],
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 12),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          if (categories[index]['price'] != null)
                            Text(
                              categories[index]['price'],
                              style: TextStyle(fontSize: 10, color: Colors.grey),
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 24),
              
              // المنتجات المميزة
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('المنتجات المميزة', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  TextButton(
                    onPressed: () {},
                    child: Text('عرض الكل', style: TextStyle(color: Colors.blue)),
                  ),
                ],
              ),
              SizedBox(height: 12),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductCard(product: products[index]);
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'الرئيسية',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'جميع الفئات',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_offer),
              label: 'العروض',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'المفضلة',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz),
              label: 'المزيد',
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  color: Colors.grey[200],
                  image: DecorationImage(
                    image: NetworkImage('https://via.placeholder.com/150'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              if (product['tag'] != null)
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      product['tag'],
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product['name'],
                  style: TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Text(
                  product['price'],
                  style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('إضافة إلى السلة'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
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
}