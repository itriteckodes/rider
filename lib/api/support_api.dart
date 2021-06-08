import 'package:driver/api/api.dart';
import 'package:driver/helpers/auth.dart';
import 'package:driver/models/Method.dart';
import 'package:driver/models/Ticket.dart';
import 'package:driver/models/WithdrawRequest.dart';
import 'package:driver/values/Strings.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SupportApi {
  static tickets() async {
    EasyLoading.show();
    var url = Strings.baseUrl + 'ticket/get';

    url += '?api_token=' + Auth.user().apiToken;

    var data = {};

    var response = await Api.execute(url: url, data: data);

    EasyLoading.dismiss();

    if (!response['error']) {
      List tickets = [];
      for (var ticket in response['tickets']) {
        tickets.add(Ticket(ticket));
      }
      return tickets;
    } else {
      print(response['error_data']);
    }
  }

  static ticket(ticketId) async {
    EasyLoading.show();
    var url = Strings.baseUrl + 'ticket/replies';

    url += '?api_token=' + Auth.user().apiToken;

    var data = {'ticket_id': ticketId};

    var response = await Api.execute(url: url, data: data);

    EasyLoading.dismiss();

    if (!response['error']) {
      Ticket ticket = Ticket(response['ticket']);
      return ticket;
    } else {
      print(response['error_data']);
    }
  }

  static addTicket(ticket) async {
    EasyLoading.show();
    var url = Strings.baseUrl + 'ticket/store';

    url += '?api_token=' + Auth.user().apiToken;

    var data = {'ticket': ticket};

    var response = await Api.execute(url: url, data: data);

    EasyLoading.dismiss();

    if (!response['error']) {
      Fluttertoast.showToast(msg: 'Ticket Created successfuly');
      return true;
    } else {
      Fluttertoast.showToast(msg: response['error_data']);
      return false;
    }
  }

  static addReply(reply, ticket) async {
    EasyLoading.show();
    var url = Strings.baseUrl + 'ticket/reply/store';

    url += '?api_token=' + Auth.user().apiToken;

    var data = {'ticket_id': ticket.id, 'message': reply};

    var response = await Api.execute(url: url, data: data);

    EasyLoading.dismiss();

    if (!response['error']) {
      Ticket ticket = Ticket(response['ticket']);
      return ticket;
    } else {
      Fluttertoast.showToast(msg: response['error_data']);
      return false;
    }
  }

  static request(
    accountId,
    amount,
    description,
  ) async {
    EasyLoading.show();
    var url = Strings.baseUrl + 'withdraw/request';

    url += '?api_token=' + Auth.user().apiToken;

    var data = {'withdrawaccount_id': accountId, 'amount': amount, 'descritpion': description};

    var response = await Api.execute(url: url, data: data);

    EasyLoading.dismiss();

    if (!response['error']) {
      Fluttertoast.showToast(msg: 'Withdraw request sent');
      return true;
    } else {
      Fluttertoast.showToast(msg: response['error_data']);
      return false;
    }
  }

  static history() async {
    EasyLoading.show();
    var url = Strings.baseUrl + 'withdraw/request/history';

    url += '?api_token=' + Auth.user().apiToken;

    var data = {};

    var response = await Api.execute(url: url, data: data);

    EasyLoading.dismiss();

    if (!response['error']) {
      List requests = [];
      for (var request in response['requests']) {
        requests.add(WithdrawRequest(request));
      }
      return requests;
    } else {
      Fluttertoast.showToast(msg: response['error_data']);
      return false;
    }
  }

  static methods() async {
    EasyLoading.show();
    var url = Strings.baseUrl + 'withdraw/method';

    url += '?api_token=' + Auth.user().apiToken;

    var data = {};

    var response = await Api.execute(url: url, data: data);

    EasyLoading.dismiss();

    if (!response['error']) {
      List methods = [];
      for (var method in response['accounts']) {
        methods.add(Method(method));
      }
      return methods;
    } else {
      print(response['error_data']);
    }
  }
}
