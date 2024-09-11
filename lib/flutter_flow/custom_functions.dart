bool getAppointmentPaidInfo(dynamic paidamount) {
  if (paidamount == "") {
    return true;
  } else {
    return false;
  }
}

String getAppointmentStatusInfo(int appointmentStatus) {
  if (appointmentStatus == 0) {
    return "Pending";
  } else {
    return "Completed";
  }
}

String formatDate(String dateTime) {
  String date = dateTime.split('T').first;
  List<String> dateComponent = date.split('-');

  Map<String, String> months = {
    '01': 'Jan',
    '02': 'Feb',
    '03': 'Mar',
    '04': 'Apr',
    '05': 'May',
    '06': 'Jun',
    '07': 'Jul',
    '08': 'Aug',
    '09': 'Sep',
    '10': 'Oct',
    '11': 'Nov',
    '12': 'Dec',
  };

  String day = dateComponent[2];
  String month = months[dateComponent[1]]!;
  String year = dateComponent[0];

  return '$month $day, $year';
}

List<dynamic> generateBusinessCard(
  List<dynamic> businessCard,
  List<dynamic> group,
) {
  List businessCardList = [];

  for (int i = 0; i < group.length; i++) {
    List sortCard = [];
    for (var card in businessCard) {
      if (card['group_name'] == group[i]['name']) {
        sortCard.add(card);
      }
    }
    Map data = {"name": group[i]['name'], 'data': sortCard};
    businessCardList.add(data);
  }

  return businessCardList;
}

String getAppointmentFormatedTime(
  String fromTime,
  String toTime,
) {
  String from = fromTime.split(" ").first;
  String to = toTime.split(" ").first;
  String period = toTime.split(" ").last;
  int to_hour = int.parse(to.split(":").first);

  if (period != to) {
    return "$from - $to $period";
  } else {
    if (to_hour <= 12) {
      return "$from - $to AM";
    } else {
      return "$from - $to PM";
    }
  }
}

List<double> generateChartList(List<String> income) {
  // create function for convert List<String> to List<double> and return that double List
  List<double> chartList = [];
  for (String value in income) {
    chartList.add((double.parse(value) != 0) ? double.parse(value) : 0);
  }
  return chartList;
}

List<String> generateMonthList() {
  return [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
  ];
}

List<dynamic> generateBusinessGroupList(List<dynamic> groupList) {
  List groups = ['All'];

  for (var group in groupList) {
    groups.add(group['name']);
  }

  return groups;
}

List<dynamic> generateTicketsTypeList(List<dynamic> groupList) {
  List groups = ['All'];

  for (var group in groupList) {
    groups.add(group['name']);
  }

  return groups;
}

List<dynamic> sortListData(List<dynamic> data) {
  return data.reversed.toList();
}

int decreaseIndex(int id) {
  return id - 1;
}

bool textFieldValidator(String value) {
  if (value.trim() == '') {
    return false;
  } else {
    return true;
  }
}

List<dynamic> enquiryListSort(List<dynamic> data) {
  data.sort((a, b) => b['id'].compareTo(a['id']));

  return data;
}

bool isGroupNameValid(
  List<dynamic> data,
  String groupName,
) {
  for (var data in data) {
    String name = data['name'];
    if (name == groupName) {
      return false;
    }
  }
  return true;
}

bool businessCardValidator(
  List<dynamic> data,
  String url,
  List<dynamic> group,
) {
  for (var card in data) {
    if (card['url'] == url) {
      return false;
    }
  }

  return true;
}

List<dynamic>? generateSubscriptionPlan(List<dynamic> data) {
  List<Map<String, dynamic>> planList = [];
  for (var item in data) {
    List<String> featuresList = [];
    item['features'].forEach((key, value) {
      if (value == 1) {
        String formattedFeature = key
            .split('_')
            .map((word) => word[0].toUpperCase() + word.substring(1))
            .join(' ');

        featuresList.add(formattedFeature);
      }
    });
    Map<String, dynamic> planMap = {
      "id": item['id'],
      "name": item['name'],
      "currency": item['currency'],
      "price": item['price'],
      "no_of_vcards": item['no_of_vcards'],
      "duration": (item['frequency'] == 1) ? '/Monthly' : '/Yearly',
      "features": featuresList,
    };
    planList.add(planMap);
  }
  return planList;
}

bool isSubscriptionExpire(List<dynamic> data) {
  for (var plan in data) {
    if (plan['current_active_subscription'] == true) {
      return true;
    }
  }
  return false;
}

String getCurrencySymbol(String currencyCode) {
  switch (currencyCode.toUpperCase()) {
    case 'USD':
      return '\$';
    case 'EUR':
      return '€';
    case 'GBP':
      return '£';
    case 'JPY':
      return '¥';
    case 'AUD':
      return 'A\$';
    case 'CAD':
      return 'C\$';
    case 'CHF':
      return 'CHF';
    case 'CNY':
      return '元';
    case 'SEK':
      return 'kr';
    case 'NZD':
      return 'NZ\$';
    case 'KRW':
      return '₩';
    case 'SGD':
      return 'S\$';
    case 'NOK':
      return 'kr';
    case 'MXN':
      return 'Mex\$';
    case 'INR':
      return '₹';
    case 'BRL':
      return 'R\$';
    case 'RUB':
      return '₽';
    case 'ZAR':
      return 'R';
    case 'TRY':
      return '₺';
    case 'HKD':
      return 'HK\$';
    case 'IDR':
      return 'Rp';
    case 'MYR':
      return 'RM';
    case 'PHP':
      return '₱';
    case 'THB':
      return '฿';
    case 'HUF':
      return 'Ft';
    case 'CZK':
      return 'Kč';
    case 'PLN':
      return 'zł';
    case 'DKK':
      return 'kr';
    case 'ISK':
      return 'kr';
    case 'HRK':
      return 'kn';
    case 'RON':
      return 'lei';
    case 'BGN':
      return 'лв';
    case 'ARS':
      return '\$';
    case 'CLP':
      return '\$';
    case 'COP':
      return '\$';
    case 'PEN':
      return 'S/.';
    case 'UYU':
      return '\$U';
    case 'VES':
      return 'Bs.';
    case 'BOB':
      return 'Bs';
    case 'CRC':
      return '₡';
    case 'GTQ':
      return 'Q';
    case 'DOP':
      return 'RD\$';
    case 'HNL':
      return 'L';
    case 'NIO':
      return 'C\$';
    case 'PAB':
      return 'B/.';
    case 'PYG':
      return '₲';
    default:
      return currencyCode; // Return the currency code itself if no symbol is found
  }
}
