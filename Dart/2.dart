class Spacescraft{
  String name;
  DateTime? launchDate;
  int ? get launchYear => launchDate?.year;
  Spacescraft(this.name, this.launchDate){

  }
  Spacescraft.unlaunched(String name) : this(name, null);

  void describe(){
    print('Spacescraft');
    var launchDate = this.launchDate;
    if(launchDate != null){
      int years = DateTime.now().difference(launchDate).inDays ~/365;
      print('Launched:$launchYear($years year ago)');
    }else{
      print('Unlaunched');
    }
  }
}
void main(){
  var voyager = Spacescraft('nameJack', DateTime(1981, 9,6));
  voyager.describe();
}
