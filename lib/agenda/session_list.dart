import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_devfest/agenda/session_detail.dart';
import 'package:flutter_devfest/home/session.dart';

class SessionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: false,
      itemCount: sessions.length,
      itemBuilder: (c, i) {
        // return Text("sdd");
        return Card(
          elevation: 0.0,
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SessionDetail(
                    session: sessions[i],
                  ),
                ),
              );
            },
            // dense: true,
            isThreeLine: true,
            trailing: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "${sessions[i].sessionTotalTime}\n",
                style: Theme.of(context)
                    .textTheme
                    .title
                    .copyWith(fontSize: 14, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: sessions[i].sessionStartTime,
                    style: Theme.of(context).textTheme.subtitle.copyWith(
                          fontSize: 12,
                        ),
                  ),
                ],
              ),
            ),
            leading: Hero(
              tag: sessions[i].speakerImage,
              child: CircleAvatar(
                backgroundImage:
                    CachedNetworkImageProvider(sessions[i].speakerImage),
              ),
            ),
            title: RichText(
              text: TextSpan(
                text: "${sessions[i].sessionTitle}\n",
                style: Theme.of(context).textTheme.title.copyWith(fontSize: 14),
                children: [
                  TextSpan(
                      text: sessions[i].speakerName,
                      style: Theme.of(context).textTheme.subtitle.copyWith(
                            fontSize: 12,
                          ),
                      children: []),
                ],
              ),
            ),
            subtitle: Text(
              sessions[i].speakerDesc,
              style: Theme.of(context).textTheme.caption.copyWith(
                    fontSize: 10.0,
                  ),
            ),
          ),
        );
      },
    );
  }
}
