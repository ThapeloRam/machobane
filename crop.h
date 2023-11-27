#include<iostream>
#include <string>
#ifndef CROP_H
#define CROP_H
using namespace std;
class crop{
	private:
		int id;
		string name;
		string type;
		string hdate; // harvet date
		string pdate; // planting date
		string description;
	public:
		crop();
		crop(int,string,string,string,string,string);
		void setId(int);
		void setName(string);
		void setType(string);
		void setHdate(string);
		void setPdate(string);
		int getId();
		string getName();
		string setType();
		string setHdate();
		string setPdate();
		void seasonal();
		void menu();
		void display();
		
};

		
	


#endif
