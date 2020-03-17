import 'dart:io';



class Person{
  String name;
  int type; // 2 is a learner, 1 is a mentor
  int startTime,endTime; // takes input in the format as 1600 for 04:00 PM
  String interest;

  Person(String pName){  //constructor
    this.name = pName;
  }

  void setMentorOrLearner(){
    print("\n 1. Mentor");
    print("\n 2. Learner");
    print("\n Choose your category : ");
    type = int.parse(stdin.readLineSync());
  }

  void setAvailableTime(){
    print("\n Enter the time range when you'll be available");
    print(" Use 24hr format. for example, enter 1600 for 04:00PM");
    print("\n Starting time: ");
    startTime = int.parse(stdin.readLineSync());
    print(" Ending time: ");
    endTime = int.parse(stdin.readLineSync());
  }

  void addStacks(){
    print("\n Enter your interest: ");
    interest = stdin.readLineSync();
  }

  void getMentor(List<Person> listPer, learnerStartTime, learnerEndTime){
    int flag = 0;
    print("\n The mentors available to you are :");
    for(int i = 0; i < listPer.length; i++)
      if(listPer[i].type == 1 && listPer[i].interest == interest && listPer[i].startTime < learnerStartTime && listPer[i].endTime > learnerEndTime){
        print(listPer[i].name);
        flag = 1;   //If any mentors are founds, set flag value
      }
    if(flag == 0)
      print("\t\t Sorry none of the mentors are available as per the requirements.");  //If no mentors are found, display this
  }
}

List<Person> listPerson = List<Person>();

void main() {

    String check;

    do {
    print("\n NEW ENTRY");
    print(" Enter name: "); 
    String myName = stdin.readLineSync();

    Person myPerson = Person(myName); //to temporarily store values
    myPerson.setMentorOrLearner();
    myPerson.addStacks();

    if(myPerson.type == 1){
      myPerson.setAvailableTime();  //Set time for mentor
    }

    listPerson.add(myPerson); //Add the objet to the list

    int myStartTime, myEndTime;
    
    if(myPerson.type == 2){         //if a learner, ask time and send to getMentor()
    print("\n Enter the time range when you'll be available");
    print(" Use 24hr format. for example, enter 1600 for 04:00PM");
    print("\n Starting time: ");
    myStartTime = int.parse(stdin.readLineSync());
    print(" Ending time: ");
    myEndTime = int.parse(stdin.readLineSync());
    myPerson.getMentor(listPerson,myStartTime,myEndTime);
    }

    print("\n Do you wish to add another profile? (Y/n): ");
    check = stdin.readLineSync();


    } while (check == "Y");
    
}