#include<iostream>
#include <string>
#include "crop.h"
#include "farmAdmin.h"
#ifndef CROP_CPP
#define CROP_CPP
using namespace std;
crop::crop(){
	id=0;
	name="";
	type="";
	hdate="";
	pdate="";
	description="";
}
crop::crop(int iD,string nam,string typ,string hdte,string pdte,string desc){
	this->id=iD;
	this->name=nam;
	this->type=typ;
	this->hdate=hdte;
	this->pdate=pdte;
	this->description=desc;
	
}
void crop::setId(int iD){
	this->id=iD;
}
void crop::setName(string nme){
	this->name=nme;
}
void crop::setType(string typ){
	this->type=typ;
}
void crop::setHdate(string hdte){
	this->hdate=hdte;
}
void crop::setPdate(string pdte){
	this->pdate=pdte;
}
int crop::getId(){
	return this->id;
}
string crop::getName(){
	return this->name;
}
string crop::setType(){
	return this->type;
}
string crop::setHdate(){
	return this->hdate;
}
string crop::setPdate(){
	return this->pdate;
}
void crop::seasonal(){
	cout<<"\n\n***************************************************************"
	<<"\n\t\t Seasonal Crop Mangement"
	<<"\n******************************************************************"
	<<"\n [1] Winter (April-May)"
	<<"\n [2] Summer (August-October)"
	<<"\n Enter Cropping time: ";
	int opt;
	cin>>opt;
	switch(opt){
		case 1:
			pdate="winter";
			hdate="January-March";
			int option;
			cout<<"\n [1] Wheat"
			<<"\n [2] Peas"
			<<"\n [3] Potatoes"
			<<"\n Choose the plant you want to simulate: ";
			cin>>option;
			switch(option){
				case 1:
					name="Wheat";
					break;
				case 2:
					name="Peas";
					break;
				case 3:
					name="Potatoes";
					break;
				default:
					cout<<"Invalid input"<<endl;
					seasonal();
					
			}
		case 2:
			pdate="summer";
			hdate="November-December";
			cout<<"\n [1] Maize"
			<<"\n [2] Beans"
			<<"\n [3] Pumpkin"
			<<"\n [4] Sorghum"
			<<"\n [4] Watermelon"
			<<"\n [5] Groundnuts"
			<<"\n Choose the plant you want to simulate: ";
			cin>>option;
			switch(option){
				case 1:
					name="Maize";
					cout<<"Describe how you will workout the intercropping of Maize and Beans?"<<endl;
					getline(cin,description);
					break;
				case 2:
					name="Beans";
					
					break;
				case 3:
					name="Pumpkin";
					cout<<"Describe how you will workout the intercropping of Maize and Pumpkin?"<<endl;
					getline(cin,description);
					break;
				case 4:
					name="Sorghum";
					cout<<"Describe how you will workout the intercropping of Maize and Sorghum?"<<endl;
					getline(cin,description);
					break;
				case 5:
					name="Watermelon";
					cout<<"Describe how you will workout the intercropping of Maize and Watermelon?"<<endl;
					getline(cin,description);
					break;
				case 6:
					name="Groundnuts";
					cout<<"Describe how you will workout the intercropping of Maize and Groundnuts?"<<endl;
					getline(cin,description);
					break;
				default:
					cout<<"Invalid input"<<endl;
					seasonal();
					
			}
	}
}
void crop::menu(){
	cout<<"\n\n*****************************************************************"
	<<"\n\t Welcome to Machobane Farming System Simulator"
	<<"\n*****************************************************************"
	<<"  \n\t Please Make your Selection to login"
	<<"   \n[1] Farm Admin"
	<<"   \n[2] Farmer"
	<<"   \n[3] Exit Program"
	<<"   \nEnter Your Choice: ";
	int opt;
	cin>>opt;
	admin obj;
	switch(opt){
		case 1:
			obj.adminMenu();
			menu();
			break;
		case 2:
			cout<<"Farmer!"<<endl;
			menu();
			break;
		case 3:
			cout<<"Exiting...!"<<endl;
			menu();
			break;
		default:
			cout<<"Invalid Input! Please enter options given!"<<endl;
			menu();
			break;
		
	}
	
	
}
void crop::display(){
	
}


#endif
