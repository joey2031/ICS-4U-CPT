 class Achievement {
  String name, info; 

  Achievement() {
    name = "";
    info = "";
  }
  // constructor
  Achievement(String nameAchievement, String AchievementInfo) {
    name = nameAchievement;
    info = AchievementInfo;
  }


  public String getName() {
    return name;
  }
  public String getInfo() {
    return info;
  }
}