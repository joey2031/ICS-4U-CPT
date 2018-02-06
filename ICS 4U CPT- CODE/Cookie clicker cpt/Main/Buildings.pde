class buildings {
  String name, info; // look at actuall game!
  private int numbOf;
  private double multiplier, CBATB;
  private float addCps, price, totalCps;

  buildings() {
    name = "";
    info = "";
    numbOf = 0;
    multiplier = 0; // price will increase by a certin % everytime the building is bought
    addCps = 0;
    price = 0;
    CBATB = 0;
    totalCps = 0;
  }
  buildings(String nameOfBuilding, String information, float p, double multi, float addCookiesPerSecond, double cookiesBakedAllTimeOfBuild, int numbOfBuild, float tCPS) {
    name = nameOfBuilding; // Might not need this.
    info = information;
    price = p; // I was having problems with the objects. It looks like unlike java you cant have the same names of constructor and class variables, doing this fixes these problems.
    multiplier = multi; // processing thinks there is no point of giving the varables the same names
    addCps = addCookiesPerSecond;
    CBATB = cookiesBakedAllTimeOfBuild; // cookies backed all time for THAT building
    numbOf = numbOfBuild; // number of that type of buildings you own.
    totalCps = tCPS;
  }


  public String getName() {
    return name;
  }

  public String getInfo() { // I may not be doing this right.
    return info;
  }

  public float getPrice() {
    return price;
  }
  public double getMultiplier() {
    return multiplier;
  }
  public float getAddcps() {
    return addCps;
  }

  public double getCBATB() {
    return CBATB;
  }

  public int getnumbOf() {
    return numbOf;
  }

  public float getTotalCps() {
    return totalCps;
  }


  public void setnumbOf(int numbOf) {
    this.numbOf = numbOf;
  }
  public void setPrice(float Price) {
    this.price = Price;
  }

  public void setAddcps (float addCookiesPerSecond) {
    this.addCps = addCookiesPerSecond;
  }

  public void setTotalCps(float tCPS) {
    this.totalCps = tCPS;
  }

}
