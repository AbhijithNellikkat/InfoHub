import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/models/model.dart';
import 'package:news_app/services/news_services_api.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Text(
            'Discover',
            style:
                GoogleFonts.poppins(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Text(
            'Find intresting article and news',
            style: GoogleFonts.poppins(color: Colors.grey),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: FutureBuilder<List<Article>>(
              future: NewsApiServices().fetchNewsArticle(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        '${snapshot.data?[index].title}',
                        style: GoogleFonts.poppins(),
                      ),
                      subtitle: Text(
                        '${snapshot.data?[index].description}',
                        style: GoogleFonts.poppins(),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const Divider(color: Colors.transparent),
                  itemCount: snapshot.data!.length,
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}



// leading: snapshot.data?[index].urlToImage != null
//                           ? Container(
//                               width: 100,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(20),
//                                 image: DecorationImage(
//                                   image: NetworkImage(
//                                       snapshot.data![index].urlToImage),
//                                 ),
//                               ),
//                             )
//                           : const SizedBox(),