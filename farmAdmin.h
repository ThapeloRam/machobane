#include<iostream>
#include<string>
#include "crop.h"
#ifndef FARMADMIN_H
#define FARMADMIN_H
using namespace std;
class admin{
	private:
		int id;
		string name;
		string gender;
		string dob;
	public:
		admin();
		admin(int,string,string,string);
		void setID(int);
		void setName(string);
		void setGender(string);
		void setDOB(string);
		int getID();
		string getName();
		string getGender();
		string getDOB();
		void adminMenu();
		void display();	
};

#endif
