import 'package:flutter/material.dart';

import 'usertype.dart';
import 'package:date_time_picker/date_time_picker.dart';

import '../../Widgets/topbar.dart';


class Personal extends StatefulWidget {
  final formGlobalKey = GlobalKey < FormState > ();

  final String userName;
  final String password;
  final String email;
  Personal(this.userName, this.password, this.email);

  TextEditingController fullnameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController countryController = TextEditingController();


  @override
  _PersonalState createState() => _PersonalState();
}

class _PersonalState extends State<Personal> {
  final formGlobalKey = GlobalKey < FormState > ();

  int _value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formGlobalKey,
        child: Column(
          children: <Widget>[
            const expansionWidget(),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 75,
              child: Container(
                color: Colors.white70,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(40,0,40,0),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                            child: const Text('Sign Up',
                              style: TextStyle(
                                color: Color(0xff1ba1a5),
                                decoration: TextDecoration.underline,
                                fontSize: 20,
                              ),
                            ),
                            onTap: () => {}
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        TextFormField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration.collapsed(
                              hintText: 'Full Name'.toUpperCase(),
                              hintStyle: const TextStyle(color: Color(0xffC4C4C4))
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB( 30, 18, 30, 0),
                          child: Divider(
                            color: Color(0xffC4C4C4),
                            height:0,
                            thickness: 2,
                            indent:5,
                            endIndent: 5,
                          ),
                        ),
                        // TextFormField(
                        //   textAlign: TextAlign.center,
                        //   onTap: (){
                        //     // Below line stops keyboard from appearing
                        //     FocusScope.of(context).requestFocus(new FocusNode());
                        //
                        //     // Show Date Picker Here
                        //
                        //   },
                        //   decoration: InputDecoration.collapsed(
                        //       hintText: 'Date of Birth'.toUpperCase(),
                        //       hintStyle: const TextStyle(color: Color(0xffC4C4C4))
                        //   ),
                        // ),
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 0, 50, 18),
                        child: DateTimePicker(
                          type: DateTimePickerType.date,
                          dateMask: 'yyyy MMM, d',
                          initialValue: DateTime.now().toString(),
                          firstDate: DateTime(1960),
                          lastDate: DateTime(2100),
                          icon: Icon(Icons.event),
                          timeLabelText: 'Enter your Date of Birth',
                          fieldHintText: 'DOB',
                          onChanged: (val) => print(val),
                          validator: (val) {
                            print(val);
                            return null;
                          },
                          textAlign: TextAlign.center,
                          onSaved: (val) => print(val),
                        ),
                      ),
                        // const Padding(
                        //   padding: EdgeInsets.symmetric( horizontal: 30, vertical: 0),
                        //   child: Divider(
                        //     color: Color(0xffC4C4C4),
                        //     height:25,
                        //     thickness: 2,
                        //     indent:5,
                        //     endIndent: 5,
                        //   ),
                        // ),
                        TextFormField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration.collapsed(
                              hintText: 'Country'.toUpperCase(),
                              hintStyle: const TextStyle(color: Color(0xffC4C4C4))
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB( 30, 8, 30, 0),
                          child: Divider(
                            color: Color(0xffC4C4C4),
                            height:25,
                            thickness: 2,
                            indent:5,
                            endIndent: 5,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Gender'.toUpperCase(), style: const TextStyle(color: Color(0xffC4C4C4), fontSize: 16) ),
                            const SizedBox(width:15),
                            MyRadioListTile<int>(
                              value: 0,
                              groupValue: _value,
                              leading: 'M',
                              onChanged: (value) => setState(() => _value = value!),
                            ),
                            MyRadioListTile<int>(
                              value: 1,
                              groupValue: _value,
                              leading: 'F',
                              onChanged: (value) => setState(() => _value = value!),
                            ),

                          ],
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                          child: ElevatedButton(
                            onPressed: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return Type(widget.userName, widget.password, widget.email, widget.fullnameController.text,
                                  widget.dobController.text, widget.countryController.text, _value);
                                }),
                              )
                            },
                            child: Text ('Next'.toUpperCase()),
                            style: ElevatedButton.styleFrom(
                                primary: const Color(0xff1ba1a5),
                                minimumSize: const Size(150, 40)
                            ),
                          ),
                        ),

                      ],
                    ),
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

class MyRadioListTile<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final String leading;
  final Widget? title;
  final ValueChanged<T?> onChanged;

  const MyRadioListTile({Key? key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.leading,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = this.title;
    return InkWell(
      onTap: () => onChanged(value),
      child: Container(
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Row(
          children: [
            _customRadioButton,
            const SizedBox(width: 4),
            if (title != null) title,
          ],
        ),
      ),
    );
  }

  Widget get _customRadioButton {
    final isSelected = value == groupValue;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : const Color(0xffc4c4c4),
        border: Border.all(
          color: isSelected ? Colors.blue : const Color(0xffc4c4c4),
        ),
      ),
      child: Text(
        leading,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
    );
  }
}