import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_team4_app/newsPage/articles_details_page.dart';
import 'package:new_team4_app/newsPage/model/article_model.dart';
import 'package:new_team4_app/newsPage/service/api_service.dart';

class NewsList extends StatefulWidget {
  const NewsList({Key? key}) : super(key: key);

  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> with TickerProviderStateMixin {
  TabController? _tabControllerNews;
  String? email = Get.arguments;
  ApiService client = ApiService();

  @override
  void initState() {
    super.initState();
    _tabControllerNews = TabController(
      initialIndex: 1,
      length: 3,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabControllerNews!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: const Color(0xffedf2fb),
        elevation: 0, // appbar 밑에 그림자 제거
        title: const Text(
          'News',
          style: TextStyle(
            color: Colors.black,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/credit-M_logo_sp.png'),
              ),
              accountName: Text('$email님'),
              accountEmail: Text('CREDIT-M에 오신것을 환영합니다.'),
              decoration: BoxDecoration(
                  color: Color(0xff347af0),
                  borderRadius: const BorderRadius.only()),
            ),
            ListTile(
              leading: Icon(
                Icons.mp_sharp,
                color: Colors.black,
              ),
              title: Text('영업점 찾기'),
              onTap: () => Get.offNamed('/map', arguments: email),
            ),
            ListTile(
              leading: Icon(
                Icons.logout_outlined,
                color: Colors.black,
              ),
              title: const Text('로그아웃'),
              onTap: () {
                // AuthController.instance.logOut();
              },
            ),
          ],
        ),
      ),
      body: FutureBuilder(
          future: client.getArticle(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
            if (snapshot.hasData) {
              List<Article>? articles = snapshot.data;
              return GridView.builder(
                itemCount: articles?.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  // mainAxisSpacing: 0,
                  // crossAxisSpacing: 0,
                ),
                itemBuilder: (context, index) =>
                    customListTile(articles![index], context),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}

Widget customListTile(Article article, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ArticlePage(article: article)));
    },
    child: Container(
      width: MediaQuery.of(context).size.width * 0.3,
      height: 300,
      margin: EdgeInsets.all(12.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 3.0,
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            article.urlToImage != null
                ? Image(
                    image: NetworkImage(article.urlToImage!),
                    fit: BoxFit.cover,
                  )
                : Image(
                    image: NetworkImage(
                        'https://source.unsplash.com/weekly?coding'),
                    fit: BoxFit.cover,
                  ),
            // SizedBox(
            //   height: 8.0,
            // ),
            // Container(
            //   padding: EdgeInsets.all(6.0),
            //   decoration: BoxDecoration(
            //     color: Colors.red,
            //     borderRadius: BorderRadius.circular(30.0),
            //   ),
            //   child: Text(
            //     article.source!.name!,
            //     style: TextStyle(
            //       color: Colors.white,
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              article.title!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
              ),
            )
          ],
        ),
      ),
    ),
  );
}
