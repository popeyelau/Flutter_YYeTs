class Profile {
  String upgrade;
  String uid;
  String sex;
  String phoneNumber;
  int didChanged;
  String phoneArea;
  String userpic;
  String groupName;
  int isInternalGroup;
  String token;
  String point;
  String nickname;
  String email;

  Profile(
      {this.upgrade,
      this.uid,
      this.sex,
      this.phoneNumber,
      this.didChanged,
      this.phoneArea,
      this.userpic,
      this.groupName,
      this.isInternalGroup,
      this.token,
      this.point,
      this.nickname,
      this.email});

  Profile.initialState() {
    nickname = "Login";
    userpic =
        "http://files.zmzjstu.com/ftp/avatar/2018/0721/9810ce1e3d9b7bc442495c334b35427a_b.jpg";
    groupName = "初级会员";
  }

  Profile.fromJson(Map<String, dynamic> json) {
    upgrade = json['upgrade'];
    uid = json['uid'];
    sex = json['sex'];
    phoneNumber = json['phone_number'];
    didChanged = json['did_changed'];
    phoneArea = json['phone_area'];
    userpic = json['userpic'];
    groupName = json['group_name'];
    isInternalGroup = json['is_internal_group'];
    token = json['token'];
    point = json['point'];
    nickname = json['nickname'];
    email = json['email'];
  }
}
