import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_doctor_app/core/exports/bloc_exports.dart';
import 'package:petcure_doctor_app/modules/home_module/view/home_page.dart';
import 'package:petcure_doctor_app/modules/time_slot_management_module/provider/time_slot_management_provider.dart';
import 'package:petcure_doctor_app/modules/time_slot_management_module/widgets/time_slot_management_page_content.dart';
import 'package:petcure_doctor_app/widgets/loaders/overlay_loader.dart';
import 'package:petcure_doctor_app/widgets/snackbars/custom_snack_bar.dart';
import 'package:provider/provider.dart';

class TimeSlotManagementPage extends StatefulWidget {
  const TimeSlotManagementPage({super.key});

  @override
  State<TimeSlotManagementPage> createState() => _TimeSlotManagementPageState();

  static MaterialPageRoute route() =>
      MaterialPageRoute(builder: (context) => const TimeSlotManagementPage());
}

class _TimeSlotManagementPageState extends State<TimeSlotManagementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Time Slot Management')),
      body: BlocListener<ConfirmLeaveBloc, ConfirmLeaveState>(
        listener: (context, state) {
          switch (state) {
            case ConfirmLeaveLoading():
              OverlayLoader.show(context, message: 'Confirming leave...');
              break;
            case ConfirmLeaveSuccess(response: final response):
              OverlayLoader.hide();
              CustomSnackBar.showSuccess(context, message: response.message);
              Navigator.pushAndRemoveUntil(
                context,
                HomePage.route(),
                (route) => false,
              );
              break;
            case ConfirmLeaveFailure(error: final error):
              OverlayLoader.hide();
              CustomSnackBar.showError(context, message: error);
              break;
            default:
              break;
          }
        },
        child: ChangeNotifierProvider(
          create: (_) => TimeSlotManagementProvider(),
          child: const TimeSlotManagementPageContent(),
        ),
      ),
    );
  }
}
