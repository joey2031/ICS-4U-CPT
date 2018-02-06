class Upgrades{
private String name, info;
private float price;


Upgrades() {
    name = "";
    info = "";
    price = 0;
  }
  Upgrades(String nameOfUpgrade, String information, float p) {
    name = nameOfUpgrade; // Might not need this.
    info = information;
    price = p; // I was having problems with the objects. It looks like unlike java you cant have the same names of constructor and class variables, doing this fixes these problems.
    //addCps = addCookiesPerSecond; I might not need this...
  }
  
   public String getName() {
    return name;
  }
  public String getInfo() {
    return info;
  }
     public float getPrice() {
    return price;
  }

}