import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SliverPage extends StatefulWidget {
  const SliverPage({super.key});

  @override
  State<SliverPage> createState() => _SliverPageState();
}

class _SliverPageState extends State<SliverPage> {
  List<Member> _members = [];
  List<Map> _tnames = [];

  @override
  initState() {
    _getList();
    super.initState();
  }

  _getList() async {
    setState(() => _members.clear());
    const url = 'https://h5.48.cn/resource/jsonp/allmembers.php?gid=10';
    final res = await Dio().get(url);
    final members = res.data['rows'].map<Member>((row) {
      return Member(
        id: row['sid'],
        name: row['sname'],
        team: row['tname'],
        tcolor: row['tcolor'],
        pid: row['pid'],
        pname: row['pname'],
        nickname: row['nickname'],
        company: row['company'],
        join_day: row['join_day'],
        height: row['height'],
        birth_day: row['birth_day'],
        star_sign_12: row['star_sign_12'],
        star_sign_48: row['star_sign_48'],
        birth_place: row['birth_place'],
        speciality: row['speciality'],
        hobby: row['hobby'],
      );
    });
    List<Map> tnames = [];
    res.data['rows'].forEach((row) {
      Map tnameMap = {'tname': row['tname'], 'tcolor': row['tcolor']};
      if (!tnames.any((e) => e['tname'] == row['tname'])) {
        tnames.add(tnameMap);
      }
    });
    setState(() {
      _members = members.toList();
      _tnames = tnames;
    });
  }

  // SliverList形式
  _buildTeamList(String tname) {
    final tm = _members.where((m) => m.team == tname).toList();
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final m = tm[index];
          return InkWell(
            onTap: () => Get.to(() => DetailPage(member: m)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: m.avatarUrl,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Image.network(m.avatarUrl),
                  ),
                ),
                Text(m.name),
              ],
            ),
          );
        },
        childCount: tm.length,
      ),
      // 规定最大尺寸
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 120,
      ),
      // 规定数量
      // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //   crossAxisCount: 4,
      // ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SNH48', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.pink,
      ),

      // Sliver 形式
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () => _getList(),
          child: Scrollbar(
            child: CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(),
                ..._tnames
                    .map((e) {
                      int tcolor = int.parse('0xff${e['tcolor']}');
                      return [
                        SliverPersistentHeader(
                          delegate: MyDelegate(e['tname'], Color(tcolor)),
                          pinned: true,
                        ),
                        _buildTeamList(e['tname']),
                      ];
                    })
                    .expand((i) => i)
                    .toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyDelegate extends SliverPersistentHeaderDelegate {
  final String title;
  final Color color;

  MyDelegate(this.title, this.color);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      width: 32,
      color: color,
      // 将字体拉伸大最大
      child: FittedBox(child: Text(title)),
    );
  }

  @override
  double get maxExtent => 32;

  @override
  double get minExtent => 32;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // 优化用 scu 同样的效果
    return true;
  }
}

class DetailPage extends StatelessWidget {
  final Member member;

  const DetailPage({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text(member.name)),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            // backgroundColor: Colors.pink[100],
            backgroundColor: Color(int.parse('0xff${member.tcolor}')),
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                member.name,
                style: const TextStyle(color: Colors.black),
              ),
              background: Center(
                child: Padding(
                  padding: const EdgeInsets.all(70),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Hero(
                      tag: member.avatarUrl,
                      child: Material(
                        elevation: 8.0,
                        shape: const CircleBorder(),
                        child: ClipOval(
                          child: Image.network(
                            member.avatarUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // 默认效果是视差滚动
              collapseMode: CollapseMode.pin,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              _buildInfo('名字', member.name),
              _buildInfo('加入所属', member.pname),
              _buildInfo('昵称', member.nickname),
              _buildInfo('加入时间', member.join_day),
              _buildInfo('身高', member.height),
              _buildInfo('生日', member.birth_day),
              _buildInfo('星座', member.star_sign_12),
              _buildInfo('出生地', member.birth_place),
              _buildInfo('特长', member.speciality),
              _buildInfo('兴趣爱好', member.hobby),
              _buildInfo('兴趣爱好', member.hobby),
              _buildInfo('兴趣爱好', member.hobby),
              _buildInfo('兴趣爱好', member.hobby),
            ]),
          )
        ],
      ),
    );
  }

  _buildInfo(String label, String text) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label),
            Text(text, textAlign: TextAlign.end),
          ],
        ),
      ),
    );
  }
}

class Member {
  final String id;
  final String name;
  final String team;
  final String tcolor;
  final String pid;
  final String pname;
  final String nickname;
  final String company;
  final String join_day;
  final String height;
  final String birth_day;
  final String star_sign_12;
  final String star_sign_48;
  final String birth_place;
  final String speciality;
  final String hobby;

  Member({
    required this.id,
    required this.name,
    required this.team,
    required this.tcolor,
    required this.pid,
    required this.pname,
    required this.nickname,
    required this.company,
    required this.join_day,
    required this.height,
    required this.birth_day,
    required this.star_sign_12,
    required this.star_sign_48,
    required this.birth_place,
    required this.speciality,
    required this.hobby,
  });

  @override
  String toString() {
    return "$id: $name";
  }

  String get avatarUrl => "https://www.snh48.com/images/member/zp_$id.jpg";
}






      // 传统 ListView 方式
      // body: ListView.builder(
      //   itemCount: _members.length,
      //   itemBuilder: ((context, index) {
      //     final m = _members[index];
      //     return ListTile(
      //       title: Text(m.name),
      //       subtitle: Text(m.id),
      //       leading: ClipOval(
      //         child: CircleAvatar(
      //           backgroundColor: Colors.white,
      //           child: Image.network(m.avatarUrl),
      //         ),
      //       ),
      //     );
      //   }),
      // ),

  //     // SliverList形式
  // SliverList _buildTeamList(String tname) {
  //   final tm = _members.where((m) => m.team == tname).toList();
  //   return SliverList(
  //     delegate: SliverChildBuilderDelegate(
  //       (context, index) {
  //         final m = tm[index];
  //         return ListTile(
  //           title: Text(m.name),
  //           subtitle: Text(m.id),
  //           leading: ClipOval(
  //             child: CircleAvatar(
  //               backgroundColor: Colors.white,
  //               child: Image.network(m.avatarUrl),
  //             ),
  //           ),
  //           trailing: Text(m.team),
  //         );
  //       },
  //       childCount: tm.length,
  //     ),
  //   );
  // }

                  // 头像
                    // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.stretch,
                  //   children: [
                  //     Expanded(
                  //       child: Image.network(
                  //         'https://images.unsplash.com/photo-1611601147557-cdc89476ec4a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGluayUyMGFlc3RoZXRpY3xlbnwwfHwwfHw%3D&w=200&q=80',
                  //         fit: BoxFit.cover,
                  //       ),
                  //     ),
                  //     Container(height: 2, color: Colors.pink[100]),
                  //     const Expanded(child: SizedBox())
                  //   ],
                  // ),