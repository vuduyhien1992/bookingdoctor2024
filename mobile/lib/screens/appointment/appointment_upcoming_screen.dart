import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile/models/patient.dart';
import 'package:mobile/services/appointment_service.dart';
import 'package:http/http.dart' as http;
import '../../models/appointment.dart';
import '../../services/patient_service.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import '../../utils/ip_app.dart';

class AppointmentUpcomingScreen extends StatefulWidget {
  const AppointmentUpcomingScreen({super.key});

  @override
  State<AppointmentUpcomingScreen> createState() =>
      _AppointmentUpcomingScreen();
}

class _AppointmentUpcomingScreen extends State<AppointmentUpcomingScreen> {
  final ipDevice = BaseClient().ip;
  late int? appointmentId;
  late int? patientId;
  late String? patientName;
  late String? gender;
  late int? age;
  late Future<Appointment> _appointmentFutureWaiting;
  late Future<Patient> _patientFuture;
  final FocusNode _focusNode = FocusNode();


  String getDayOfWeek(String date) {
    // List các tên thứ trong tuần
    List<String> daysOfWeek = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];

    DateTime day01 = DateTime.parse(date);
    // Lấy chỉ số thứ của ngày
    int dayIndex = day01.weekday - 1; // Chú ý: DateTime.weekday trả về 1 cho Thứ Hai và 7 cho Chủ Nhật

    // Trả về tên thứ tương ứng
    return daysOfWeek[dayIndex];
  }

  int calculateAge(String birthday) {
    DateTime birthDate = DateFormat('yyyy-MM-dd').parse(birthday);

    DateTime currentDate = DateTime.now();

    int age = currentDate.year - birthDate.year;

    if (currentDate.month < birthDate.month ||
        (currentDate.month == birthDate.month && currentDate.day < birthDate.day)) {
      age--;
    }
    return age;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
    appointmentId = arguments['appointmentId'];
    patientId = arguments['patientId'];
    _appointmentFutureWaiting =
        AppointmentClient().fetchAppointmentById(appointmentId!);
    _patientFuture = PatientClient().getPatientById(patientId!);

    _patientFuture.then((patient) {
      setState(() {
        patientId = patient.id;
        patientName = patient.fullName;
        gender = patient.gender;
        age = calculateAge(patient.birthday.toString());
      });

    });


  }

  late TextEditingController txtCancelledReason = TextEditingController();

  void handleCancelledSubmit(Map data) async {
      final response = await http.put(
        Uri.parse('http://$ipDevice:8080/api/appointment/cancelled-appointment/${data['id']}/${data['reason']}/${data['status']}'),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        AwesomeDialog(
          context: context,
          animType: AnimType.bottomSlide,
          dialogType: DialogType.success,
          body: Center(child: Text(
            'Hủy lịch thành công!',
            style: TextStyle(fontStyle: FontStyle.normal),
            textAlign: TextAlign.center,
          ),),
          btnOkOnPress: () {
          },
        )..show();
      } else {
        AwesomeDialog(
          context: context,
          animType: AnimType.bottomSlide,
          dialogType: DialogType.error,
          body: Center(child: Text(
            'Hủy lịch thất bại! Vui lòng thử lại',
            style: TextStyle(fontStyle: FontStyle.normal),
            textAlign: TextAlign.center,
          ),),
          btnOkOnPress: () {
            Navigator.pushNamed(context, '/home');
          },
        )..show();
      }



  }



  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          //backgroundColor: Colors.blue,
          title: const Text('Appointment Upcoming',
              style: TextStyle(color: Colors.black, fontSize: 22)),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.more_horiz_sharp),
              onPressed: () {},
            ),
          ],
        ),
        body: FutureBuilder<Appointment>(
            future: _appointmentFutureWaiting,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData) {
                return const Center(child: Text('Doctor not found'));
              } else {
                Appointment item = snapshot.data!;
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(25),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xFFEAEEFF),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ]),
                        child: Row(
                          children: [
                            ClipRRect(
                              child: Opacity(
                                opacity: 0.6,
                                child: Container(
                                  width: 80,
                                  height: 80,
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: Colors.lightBlueAccent,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Image.network(
                                    'http://$ipDevice:8080/images/doctors/${item.image}',
                                    width: 25,
                                    height: 25,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${item.title} ${item.fullName}',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    Text('${item.departmentName} |'),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text('${item.price} VND'),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const Row(children: [
                                  Icon(
                                    Icons.location_pin,
                                    color: Colors.cyan,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text('590, CMT8, Q3, HCM'),
                                ])
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Schedule Appointment',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.calendar_month),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text('${getDayOfWeek(item.medicalExaminationDay)}: ${item.medicalExaminationDay}',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18.0,
                                      ))
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.access_time),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text(item.clinicHours,
                                      style: const TextStyle(
                                        // color: Colors.blueAccent,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18.0,
                                      ))
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Patient Information',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Padding(padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Table(columnWidths: const {
                              0: FixedColumnWidth(100), // Độ rộng cột đầu tiên
                            }, children: [
                              TableRow(
                                children: [
                                  const Padding(
                                    padding:
                                    EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      'Full Name',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      patientName!,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Padding(
                                    padding:
                                    EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      'Age',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                    EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      '${age!}',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Padding(
                                    padding:
                                    EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      'Gender',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                    EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      '${gender!}',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Padding(
                                    padding:
                                    EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      'Problem',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                    EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      item.note,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Text('Reason cancelled', style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),),
                          const SizedBox(
                            height: 25,
                          ),
                          TextField(
                            focusNode: _focusNode,
                            controller: txtCancelledReason,
                            decoration: const InputDecoration(
                              // border: OutlineInputBorder(),
                              hintText: 'Enter your reason cancelled',
                            ),
                            onSubmitted: (value) {
                              // Hide the keyboard when the user submits
                              _focusNode.unfocus();
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                  //)
                );
              }
            }),
        bottomNavigationBar: BottomAppBar(
            elevation: 0,
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: InkWell(
              onTap: () {
                print(appointmentId);
                var data = {
                    'id': appointmentId,
                    'reason': txtCancelledReason.text,
                    'status' :'cancelled'
                };
                handleCancelledSubmit(data);
              },
              child: Container(
                height: 50,
                width: 150,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFFF4081), // Đầu gradient color
                      Color(0xFFF50057), // Cuối gradient color
                    ],
                  ),
                ),
                child: const Text(
                  'CANCEL',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
            )),
      ),
    );
  }


}
