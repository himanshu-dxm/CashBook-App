
import 'DateTime.dart';

class Transactions {
  final String transactionId;
  final String title;
  final double amount;
  final String category;
  final MyDateTime dateTime;
  final String timestamp;

  Transactions({
    required this.transactionId,
    required this.title,
    required this.amount,
    required this.category,
    required this.dateTime,
    required this.timestamp,
  });

  factory Transactions.fromJson(Map<String,dynamic> json) => Transactions(

    transactionId: json['transactionId'],
    title: json['title'],
    amount: json['amount'],
    category: json['category'],
    dateTime: json['dateTime'],
    timestamp: json['timestamp'],

  );

  Map<String, dynamic> toJson() => {
    // final Map<String,dynamic> data = new Map<String, dynamic>();
    "title": title,
    "amount": amount,
    "category": this.category,
    "dateTime": this.dateTime.toJson(),
    "transactionId": this.transactionId,
    "timestamp":this.timestamp,
  };


}

// thinking of db to be

/*
* transactions {
	t1 {
		title
		amount
		category : food,self,party,play,stationery,etc
		type : income/expenditure
		dateTime {
			date
			month
			year
			hour
			min
		}
		timestamp
	}
}
*
* */