import 'package:flutter/material.dart';
import 'package:petcure_doctor_app/modules/feedback_and_complaints_module/utils/feedback_and_complaints_helper.dart';
import 'package:petcure_doctor_app/modules/feedback_and_complaints_module/widgets/doctor_complaints_widget.dart';
import 'package:petcure_doctor_app/modules/feedback_and_complaints_module/widgets/doctor_feedbacks_widget.dart';

class FeedbackAndComplaintsPage extends StatefulWidget {
  const FeedbackAndComplaintsPage({super.key});

  @override
  State<FeedbackAndComplaintsPage> createState() =>
      _FeedbackAndComplaintsPageState();

  static MaterialPageRoute route() => MaterialPageRoute(
    builder: (context) => const FeedbackAndComplaintsPage(),
  );
}

class _FeedbackAndComplaintsPageState extends State<FeedbackAndComplaintsPage> {
  late final FeedbackAndComplaintsHelper _feedbackAndComplaintsHelper;

  @override
  void initState() {
    super.initState();
    _feedbackAndComplaintsHelper = FeedbackAndComplaintsHelper(
      context: context,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _feedbackAndComplaintsHelper.fetchDoctorFeedbacks();
      _feedbackAndComplaintsHelper.fetchDoctorComplaints();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey[50]!,
        appBar: AppBar(
          title: const Text('Feedbacks and Complaints'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Feedbacks'),
              Tab(text: 'Complaints'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            DoctorFeedbacksWidget(
              onRetry: _feedbackAndComplaintsHelper.fetchDoctorFeedbacks,
            ),
            DoctorComplaintsWidget(
              onRetry: _feedbackAndComplaintsHelper.fetchDoctorComplaints,
            ),
          ],
        ),
      ),
    );
  }
}
