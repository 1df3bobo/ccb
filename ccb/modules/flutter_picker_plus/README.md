# flutter_picker_plus

**Note: this plugin is continuous work from [flutter_picker](https://pub.dev/packages/flutter_picker).**

Flutter picker plus. Include NumberPicker, DateTimePicker, ArrayPicker, and default linkage Picker. Provide flexible parameters to meet various needs. At the same time, you can extend more functions through custom adapters.

![image](https://github.com/octologs/flutter_picker_plus/blob/main/raw/views.gif?raw=true)

## Supported Languages

- Arabic
- Bengali
- Chinese
- English
- French
- German
- Greek
- Hindi
- Indonesian
- Italian
- Japanese
- Korean
- Portuguese
- Romanian
- Russian
- Spanish
- Turkish
- Urdu
- Javanese
- Vietnamese
- Slovenian

Supporting more than [10+ most spoken languages](https://en.wikipedia.org/wiki/List_of_languages_by_total_number_of_speakers)

## How to Use

```dart

    showPicker(BuildContext context) {
      Picker picker = new Picker(
        adapter: PickerDataAdapter<String>(pickerdata: new JsonDecoder().convert(PickerData)),
        changeToFirst: true,
        textAlign: TextAlign.left,
        columnPadding: const EdgeInsets.all(8.0),
        onConfirm: (Picker picker, List value) {
          print(value.toString());
          print(picker.getSelectedValues());
        }
      );
      picker.show(_scaffoldKey.currentState);
    }

    showPickerModal(BuildContext context) {
      new Picker(
        adapter: PickerDataAdapter<String>(pickerdata: new JsonDecoder().convert(PickerData)),
        changeToFirst: true,
        hideHeader: false,
        onConfirm: (Picker picker, List value) {
          print(value.toString());
          print(picker.adapter.text);
        }
      ).showModal(this.context); //_scaffoldKey.currentState);
    }

    showPickerIcons(BuildContext context) {
      new Picker(
        adapter: PickerDataAdapter(data: [
          new PickerItem(text: Icon(Icons.add), value: Icons.add, children: [
            new PickerItem(text: Icon(Icons.more)),
            new PickerItem(text: Icon(Icons.aspect_ratio)),
            new PickerItem(text: Icon(Icons.android)),
            new PickerItem(text: Icon(Icons.menu)),
          ]),
          new PickerItem(text: Icon(Icons.title), value: Icons.title, children: [
            new PickerItem(text: Icon(Icons.more_vert)),
            new PickerItem(text: Icon(Icons.ac_unit)),
            new PickerItem(text: Icon(Icons.access_alarm)),
            new PickerItem(text: Icon(Icons.account_balance)),
          ]),
          new PickerItem(text: Icon(Icons.face), value: Icons.face, children: [
            new PickerItem(text: Icon(Icons.add_circle_outline)),
            new PickerItem(text: Icon(Icons.add_a_photo)),
            new PickerItem(text: Icon(Icons.access_time)),
            new PickerItem(text: Icon(Icons.adjust)),
          ]),
          new PickerItem(text: Icon(Icons.linear_scale), value: Icons.linear_scale, children: [
            new PickerItem(text: Icon(Icons.assistant_photo)),
            new PickerItem(text: Icon(Icons.account_balance)),
            new PickerItem(text: Icon(Icons.airline_seat_legroom_extra)),
            new PickerItem(text: Icon(Icons.airport_shuttle)),
            new PickerItem(text: Icon(Icons.settings_bluetooth)),
          ]),
          new PickerItem(text: Icon(Icons.close), value: Icons.close),
        ]),
        title: new Text("Select Icon"),
        onConfirm: (Picker picker, List value) {
          print(value.toString());
          print(picker.getSelectedValues());
        }
    ).show(_scaffoldKey.currentState);
  }

  showPickerDialog(BuildContext context) {
    new Picker(
        adapter: PickerDataAdapter<String>(pickerdata: new JsonDecoder().convert(PickerData)),
        hideHeader: true,
        title: new Text("Select Data"),
        onConfirm: (Picker picker, List value) {
          print(value.toString());
          print(picker.getSelectedValues());
        }
    ).showDialog(context);
  }

  showPickerArray(BuildContext context) {
    new Picker(
        adapter: PickerDataAdapter<String>(pickerdata: new JsonDecoder().convert(PickerData2), isArray: true),
        hideHeader: true,
        title: new Text("Please Select"),
        onConfirm: (Picker picker, List value) {
          print(value.toString());
          print(picker.getSelectedValues());
        }
    ).showDialog(context);
  }

  showPickerNumber(BuildContext context) {
    new Picker(
        adapter: NumberPickerAdapter(data: [
          NumberPickerColumn(begin: 0, end: 999),
          NumberPickerColumn(begin: 100, end: 200),
        ]),
        delimiter: [
          PickerDelimiter(child: Container(
            width: 30.0,
            alignment: Alignment.center,
            child: Icon(Icons.more_vert),
          ))
        ],
        hideHeader: true,
        title: new Text("Please Select"),
        onConfirm: (Picker picker, List value) {
          print(value.toString());
          print(picker.getSelectedValues());
        }
    ).showDialog(context);
  }

```

## PickerData Example

### Array

```dart

const PickerData2 = '''
[
    [
        1,
        2,
        3,
        4
    ],
    [
        11,
        22,
        33,
        44
    ],
    [
        "aaa",
        "bbb",
        "ccc"
    ]
]
    ''';
```

### Linkage

```dart
const PickerData = '''
[
    {
        "a": [
            {
                "a1": [
                    1,
                    2,
                    3,
                    4
                ]
            },
            {
                "a2": [
                    5,
                    6,
                    7,
                    8
                ]
            },
            {
                "a3": [
                    9,
                    10,
                    11,
                    12
                ]
            }
        ]
    },
    {
        "b": [
            {
                "b1": [
                    11,
                    22,
                    33,
                    44
                ]
            },
            {
                "b2": [
                    55,
                    66,
                    77,
                    88
                ]
            },
            {
                "b3": [
                    99,
                    1010,
                    1111,
                    1212
                ]
            }
        ]
    },
    {
        "c": [
            {
                "c1": [
                    "a",
                    "b",
                    "c"
                ]
            },
            {
                "c2": [
                    "aa",
                    "bb",
                    "cc"
                ]
            },
            {
                "c3": [
                    "aaa",
                    "bbb",
                    "ccc"
                ]
            }
        ]
    }
]
    ''';
```
