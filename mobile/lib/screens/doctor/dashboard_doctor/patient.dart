import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/utils/ip_app.dart';

class PatientScreenInDoctorPage extends StatefulWidget {
  const PatientScreenInDoctorPage({super.key});

  @override
  State<PatientScreenInDoctorPage> createState() =>
      _PatientScreenInDoctorPageState();
}

class _PatientScreenInDoctorPageState extends State<PatientScreenInDoctorPage> {
  late Map<String, dynamic> patient;
  late String status;
  late String action;
  late String note;
  late int id;
  bool isShowButton = false;
  final ipDevice = BaseClient().ip;

  String formatDate(List<dynamic> date) {
    if (date.length != 3) return '';
    try {
      int year = date[0] as int;
      int month = date[1] as int;
      int day = date[2] as int;
      DateTime dateTime = DateTime(year, month, day);
      return "${dateTime.year.toString().padLeft(4, '0')}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";
    } catch (e) {
      return 'Invalid date';
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
    patient = arguments['patient'] as Map<String, dynamic>;
    status = arguments['status'] as String;
    action = arguments['action'] as String;
    note = arguments['note'] as String;
    id = arguments['id'] as int;
    setState(() {
      if (status == 'waiting' && action == 'allow') {
        isShowButton = true;
      }
    });
  }

  Future<void> _handleChangeStatus(String status) async {
    final responseChangeStatus = await http.put(Uri.parse(
        'http://$ipDevice:8080/api/appointment/changestatus/$id/$status'));
    if (responseChangeStatus.statusCode == 200) {
      Navigator.of(context).pop("updatedStatus");
      setState(() {
        isShowButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient Detail'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hiển thị hình ảnh bệnh nhân
              Center(
                child: Image.network(
                  'http://$ipDevice:8080/images/patients/${patient['image']}', // Thay thế bằng URL của ảnh từ dữ liệu bệnh nhân
                  width: MediaQuery.of(context).size.width * 0.8,
                  // height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),

              // Hiển thị thông tin cơ bản của bệnh nhân
              Text(
                'Full Name: ${patient["fullName"]}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                'Gender: ${patient["gender"]}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              Text(
                'Birthday: ${formatDate(patient["birthday"])}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              Text(
                'Address: ${patient["address"]}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              Text(
                'Note: ${note}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),

              // Hiển thị thông tin y tế của bệnh nhân
              const Text(
                'Medical History:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: patient["medicals"].length,
                itemBuilder: (context, index) {
                  var medical = patient["medicals"][index];
                  return ListTile(
                    title: Text(
                      medical["name"],
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(medical["content"]),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: isShowButton
          ? BottomAppBar(
              elevation: 0,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      _handleChangeStatus("no show");
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Container(
                      height: 55,
                      width: 150,
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFFFF9999),
                            Color(0xFFFF6666),
                          ],
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'No Show',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            textBaseline: TextBaseline
                                .ideographic, // Đặt textBaseline là ideographic
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _handleChangeStatus("completed");
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Container(
                      height: 55,
                      width: 150,
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFF9AC3FF),
                            Color(0xFF93A6FD),
                          ],
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Complete',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            textBaseline: TextBaseline.ideographic,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Container(
              height: 75,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: status == 'waiting'
                      ? [
                          const Color(0xFF9AC3FF),
                          const Color(0xFF93A6FD),
                        ]
                      : [
                          const Color(0xFFFF9999),
                          const Color(0xFFFF6666),
                        ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: Text(
                  status == 'waiting'
                      ? 'Upcoming Appointment'
                      : 'The Appointment has Ended',
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
    );
  }
}
