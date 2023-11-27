#include<iostream>
#include<string>
#include "crop.h"
#include "farmAdmin.h"
#ifndef FARMADMIN_CPP
#define FARMADMIN_CPP
using namespace std;

admin::admin(){
	id=0;
	name="";
	gender="";
	dob="";
}
admin::admin(int iD,string nam,string gen,string doB){
	this->id=iD;
	this->name=nam;
	this->gender=gen;
	this->dob=doB;
}
void admin::setID(int iD){
	this->id=iD;
}
void admin::setName(string nam){
	this->name=nam;
}
void admin::setGender(string gen){
	this->gender=gen;
}
void admin::setDOB(string doB){
	this->dob=doB;
}
int admin::getID(){
	return this->id;
}
string admin::getName(){
	return this->name;
}
string admin::getGender(){
	return this->gender;
}
string admin::getDOB(){
	return this->dob;
}
void admin::adminMenu(){
	cout<<"\n*************************************************************"
	<<"\n\t\t Welcome to MFS Admin Panel"
	<<"\n*************************************************************"
	<<"\n [1] Seasonal Crop Management"
	<<"\n [2] Intercropping and Relay Cropping System"
	<<"\n [3] Soil Fertility and Moisture Management"
	<<"\n [4] Crop Yield and Sustainability"
	<<"\n [5] Main Program-Integrating Seasonal Cycles"
	<<"\n [6] Exit"
	<<"\n Enter Choice: ";
	int opt;
	cin>>opt;
	crop obj;
	switch(opt){
		case 1:
			cout<<"Seasonal Crop!"<<endl;
			obj.seasonal();
			adminMenu();
			break;
		case 2:
			cout<<"Intercropping and Relay Cropping System!"<<endl;
			adminMenu();
			break;
		case 3:
			cout<<"Soil Fertility and Moisture Management!"<<endl;
			adminMenu();
			break;
		case 4:
			cout<<"Crop Yield and Sustainability!"<<endl;
			adminMenu();
			break;
		case 5:
			cout<<"Main Program-Integrating Seasonal Cycles!"<<endl;
			adminMenu();
			break;
		case 6:
			obj.menu();
			break;
	}
}
void admin::display(){
	
}	

#endif
