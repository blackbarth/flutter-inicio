import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  ChatMessage(this.data, this.mine);

  final Map<String, dynamic> data;
  final bool mine;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Row(
        children: <Widget>[
          !mine ?
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(data['senderPhotoUrl']),
            ),
          ): Container(),
          Expanded(
            child: Column(
              crossAxisAlignment: mine ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: <Widget>[
                data['imgUrl'] != null
                    ? Image.network(data['imgUrl'], width: 250,)
                    : Text(
                        data['text'],
                        style: TextStyle(fontSize: 16.0),
                  textAlign: mine ? TextAlign.end : TextAlign.start,
                      ),
                Text(
                  data['senderName'],
                  style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
          mine ?
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(data['senderPhotoUrl']),
            ),
          ): Container(),
        ],
      ),
    );
  }
}
