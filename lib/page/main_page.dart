import 'package:course_app/enum/app_loading_staus.dart';
import 'package:course_app/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import '../model/course_model.dart';
import '../provider/course_provider.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.addListener(_scrollListener);

      var provider = Provider.of<CourseProvider>(context, listen: false);
      provider.loadCourse();
    });
    super.initState();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      var provdier = Provider.of<CourseProvider>(context, listen: false);
      provdier.onPageChange();
    }
  }

  @override
  Widget build(BuildContext context) {
    buildCard({required CourseModel course}) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        margin: EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                color: Colors.grey.shade200,
                padding: EdgeInsets.all(8),
                child: Image.network(
                  course.image,
                  height: 50,
                  width: 50,
                ),
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course.title,
                  style: TextStyle(height: 1.1, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 6,
                ),
                Text("Jhon Doe"),
                Row(
                  children: [
                    RatingBar.builder(
                      initialRating: course.rating.rate,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                      ignoreGestures: true,
                      itemSize: 16,
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber.shade400,
                      ),
                      onRatingUpdate: (rating) {},
                    ),
                    Text(
                      "(${course.rating.rate}) (${course.rating.count})",
                      style: TextStyle(color: Colors.black.withOpacity(.8)),
                    ),
                    Spacer(),
                    Text(
                      "\$${course.price.ceil()}",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    )
                  ],
                )
              ],
            )),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
        title: Text(
          "Academy",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(
              onPressed: () {
                var authProvider =
                    Provider.of<AuthProvider>(context, listen: false);
                authProvider.logout(context: context);
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Consumer<CourseProvider>(builder: (context, courseProvider, _) {
        if (courseProvider.connectionStatus == AppConnectionStatus.loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return SingleChildScrollView(
          controller: _scrollController,
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 12,
              ),
              Text(
                "Showing ${courseProvider.courseList.length} Courses",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: courseProvider.courseList.length,
                  itemBuilder: (context, index) {
                    return buildCard(course: courseProvider.courseList[index]);
                  }),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        );
      }),
    );
  }
}
