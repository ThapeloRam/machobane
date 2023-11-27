# include <iostream>
#include <vector>
using namespace std;

// a crop class
class crop{
	string name;
	string yield;
	string soil_fertility;
	string moisture_level;

	public:
    // Constructor
    crop(string Name,string y,string sf,string ml) : name(Name), yield(y), soil_fertility(sf), moisture_level(ml) {}

    // Getters
    string getName() const { return name; }
    string getYield() const { return yield; }
    string getSoilFertility() const { return soil_fertility; }
    string getMoistureLevel() const { return moisture_level; }

    // Setters
    void setName(string Name) { name = Name; }
    void setYield(string y) { yield = y; }
    void setSoilFertility(string sf) { soil_fertility = sf; }
    void setMoistureLevel( string ml) { moisture_level = ml; }


};

// a function to calculate the crop yield
 string calculateYield(string moistureLevel, string soilFertility) {
    if (moistureLevel == "high" && soilFertility == "high") {
        return "Yield = high\n";
    } else if (moistureLevel == "low" || soilFertility == "low") {
        return " Yield = low\n";
    } else {
        return "Yield = medium\n";
    }
}


// a vector to store summer_crops
vector<crop> summer_crops;

// a vector to store crops
vector<crop> Winter_crops;



// the Harvest function for winter
void Harvest_winter(){

	int action_harvest;
	// Access the crops
	crop new_crop("None", "None", "None", "None");  // testing with a none crop
	Winter_crops.push_back(new_crop);               // testing with a none crop
	cout<<"*********************Harvesting winter Crops*********************\n";
    for (int i = 0; i < Winter_crops.size(); i++) {
        cout << "Crop " << i+1 << ":" << endl;
        cout << "Name: " << Winter_crops[i].getName() <<endl;
        cout << "Soil Fertility: " << Winter_crops[i].getSoilFertility() <<endl;
        cout << "Moisture Level: " << Winter_crops[i].getMoistureLevel() <<endl;
    }

    cout<< "press one to Harvest: ";
    cin>>action_harvest;
    if(action_harvest==1){
    	cout<<"*************************Done with harvesting********************\n";

    	for (int i = 0; i < Winter_crops.size(); i++) {
        cout << "Crop " << i+1 << ":" << endl;
        cout << "Name: " << Winter_crops[i].getName() <<endl;
        cout<< calculateYield( Winter_crops[i].getMoistureLevel(), Winter_crops[i].getSoilFertility());
        cout << "Soil Fertility: " << Winter_crops[i].getSoilFertility() <<endl;
        cout << "Moisture Level: " << Winter_crops[i].getMoistureLevel() <<endl;
    }

	}

}


// the Harvest function for summer
void Harvest_summer(){
	int action_harvest;
	// Access the crops
	crop new_crop("None", "None", "None", "None");  // testing with a none crop
	summer_crops.push_back(new_crop);               // testing with a none crop
	cout<<"*********************Harvesting summer Crops*********************\n";
    for (int i = 0; i < summer_crops.size(); i++) {
        cout << "Crop " << i+1 << ":" << endl;
        cout << "Name: " << summer_crops[i].getName() <<endl;
        cout << "Yield: " <<summer_crops[i].getYield() <<endl;
        cout << "Soil Fertility: " << summer_crops[i].getSoilFertility() <<endl;
        cout << "Moisture Level: " << summer_crops[i].getMoistureLevel() <<endl;
    }


    // Option to harvest
    cout<< "press one to Harvest";
    cin>>action_harvest;
    if(action_harvest==1){
    	cout<<"*************************Done with harvesting********************\n";

    	for (int i = 0; i < Winter_crops.size(); i++) {
        cout << "Crop " << i+1 << ":" << endl;
        cout << "Name: " << summer_crops[i].getName() <<endl;
        cout<< calculateYield( summer_crops[i].getMoistureLevel(), summer_crops[i].getSoilFertility());
        cout << "Soil Fertility: " << summer_crops[i].getSoilFertility() <<endl;
        cout << "Moisture Level: " << summer_crops[i].getMoistureLevel() <<endl;
    }

	}

}



// a function for planting winter crops
void Plant_winter(){

   int crop_to_plant;
   string fertility;
   string Moisture;

	//initializing crops
	crop new_crop("None", "None", "None", "None");


	cout<<"which plants do you want to plant\n"
	       "1.Wheat\n"
	       "2.Peas\n"
	       "3.Potatoes\n";
   cin>> crop_to_plant;

  switch (crop_to_plant) {
    case 1:
        // setting the crop name
        new_crop.setName("Wheat");

        // setting the crop fertility
        cout << "What is the Soil Fertility(low,medium,high): ";
        cin >> fertility;
        new_crop.setSoilFertility(fertility);

        // setting the crop MoistureLevel
        cout << "What is the Moisture Level(low,medium,high): ";
        cin >> Moisture;
        new_crop.setMoistureLevel(Moisture);

        Winter_crops.push_back(crop("Wheat", "High", fertility, Moisture));

        cout<< "planting Wheat..."<<endl;
        break;


    case 2:
        // setting the crop name
        new_crop.setName("Peas");

        // setting the crop fertility
        cout << "What is the Soil Fertility(low,medium,high): ";
        cin >> fertility;
        new_crop.setSoilFertility(fertility);

        // setting the crop MoistureLevel
        cout << "What is the Moisture Level(low,medium,high): ";
        cin >> Moisture;
        new_crop.setMoistureLevel(Moisture);

        Winter_crops.push_back(crop("Peas", "High", fertility, Moisture));
        cout<< "planting Peas..."<<endl;
        break;

    case 3:
        // setting the crop name
        new_crop.setName("Potatoes");

        // setting the crop fertility
        cout << "What is the Soil Fertility(low,medium,high): ";
        cin >> fertility;
        new_crop.setSoilFertility(fertility);

        // setting the crop MoistureLevel
        cout << "What is the Moisture Level(low,medium,high): ";
        cin >> Moisture;
        new_crop.setMoistureLevel(Moisture);

        Winter_crops.push_back(crop("Potatoes", "High", fertility, Moisture));
        cout<< "planting Potatoes..."<<endl;
        break;
    default:
        cout << "Invalid option. Please enter 1, 2, or 3.";
        break;
}





}

void Plant_summer(){

   int crop_to_plant;
   string fertility;
   string Moisture;

	//initializing crops
	crop new_crop("None", "None", "None", "None");


	cout<<"which plants do you want to plant\n"
	       "1.Maize\n"
	       "2.Beans\n"
	       "3.Pumpkin\n"
		   "4.Sorghum\n"
		   "5.Watermelon\n"
		   "Groundnuts\n";
   cin>> crop_to_plant;

  switch (crop_to_plant) {
    case 1:
        // setting the crop name
        new_crop.setName("Maize");

        // setting the crop fertility
        cout << "What is the Soil Fertility(low,medium,high): ";
        cin >> fertility;
        new_crop.setSoilFertility(fertility);

        // setting the crop MoistureLevel
        cout << "What is the Moisture Level(low,medium,high): ";
        cin >> Moisture;
        new_crop.setMoistureLevel(Moisture);

        summer_crops.push_back(crop("Maize", "High", fertility, Moisture));

        cout<< "planting Beans..."<<endl;
        break;


    case 2:
        // setting the crop name
        new_crop.setName("Beans");

        // setting the crop fertility
        cout << "What is the Soil Fertility(low,medium,high): ";
        cin >> fertility;
        new_crop.setSoilFertility(fertility);

        // setting the crop MoistureLevel
        cout << "What is the Moisture Level(low,medium,high): ";
        cin >> Moisture;
        new_crop.setMoistureLevel(Moisture);

        summer_crops.push_back(crop("Beans", "High", fertility, Moisture));
        cout<< "planting Beans..."<<endl;
        break;

    case 3:
        // setting the crop name
        new_crop.setName("Pumpkin");

        // setting the crop fertility
        cout << "What is the Soil Fertility(low,medium,high): ";
        cin >> fertility;
        new_crop.setSoilFertility(fertility);

        // setting the crop MoistureLevel
        cout << "What is the Moisture Level(low,medium,high): ";
        cin >> Moisture;
        new_crop.setMoistureLevel(Moisture);

        summer_crops.push_back(crop("Pumpkin", "High", fertility, Moisture));
        cout<< "planting Pumpkin..."<<endl;
        break;

        case 4:
        // setting the crop name
        new_crop.setName("Sorghum");

        // setting the crop fertility
        cout << "What is the Soil Fertility(low,medium,high): ";
        cin >> fertility;
        new_crop.setSoilFertility(fertility);

        // setting the crop MoistureLevel
        cout << "What is the Moisture Level(low,medium,high): ";
        cin >> Moisture;
        new_crop.setMoistureLevel(Moisture);

        summer_crops.push_back(crop("Sorghum", "High", fertility, Moisture));
        cout<< "planting Sorghum..."<<endl;
        break;
    case 5:
        // setting the crop name
        new_crop.setName("Watermelons");

        // setting the crop fertility
        cout << "What is the Soil Fertility(low,medium,high): ";
        cin >> fertility;
        new_crop.setSoilFertility(fertility);

        // setting the crop MoistureLevel
        cout << "What is the Moisture Level(low,medium,high): ";
        cin >> Moisture;
        new_crop.setMoistureLevel(Moisture);

        summer_crops.push_back(crop("Watermelons", "High", fertility, Moisture));
        cout<< "planting Watermelons..."<<endl;
        break;
    case 6:
        // setting the crop name
        new_crop.setName("Groundnuts");

        // setting the crop fertility
        cout << "What is the Soil Fertility(low,medium,high): ";
        cin >> fertility;
        new_crop.setSoilFertility(fertility);

        // setting the crop MoistureLevel
        cout << "What is the Moisture Level(low,medium,high): ";
        cin >> Moisture;
        new_crop.setMoistureLevel(Moisture);

        summer_crops.push_back(crop("Groundnuts", "High", fertility, Moisture));
        cout<< "planting Groundnuts..."<<endl;
        break;
    default:
        cout << "Invalid option. Please enter 1, 2, or 3.";
        break;
}

}

void crop_details(){
	// Display for the Winter crops
 cout<<"*************************_Winter_crops_**************************************\n";
 	for (int i = 0; i < Winter_crops.size(); i++) {
        cout << "Crop " << i+1 << ":" << endl;
        cout << "Name: " << Winter_crops[i].getName() <<endl;
        cout<<" The Expected "<< calculateYield( Winter_crops[i].getMoistureLevel(), Winter_crops[i].getSoilFertility());
        cout << "Soil Fertility: " << Winter_crops[i].getSoilFertility() <<endl;
        cout << "Moisture Level: " << Winter_crops[i].getMoistureLevel() <<endl;
		}
		// Display for the Winter crops
	cout<<"*************************_Summer_crops_**************************************\n";
		for (int i = 0; i < Winter_crops.size(); i++) {
        cout << "Crop " << i+1 << ":" << endl;
        cout << "Name: " << summer_crops[i].getName() <<endl;
        cout<< calculateYield( summer_crops[i].getMoistureLevel(), summer_crops[i].getSoilFertility());
        cout << "Soil Fertility: " << summer_crops[i].getSoilFertility() <<endl;
        cout << "Moisture Level: " << summer_crops[i].getMoistureLevel() <<endl;
    }


}






void Month_display()
{
	cout<<"####################################_MAIN_####################################\n";
		string months[12] = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};

    // Print the months
    for(int i = 0; i < 12; i++) {
    cout <<i+1<<". "<< months[i] << endl;
    }
}

int main()
{
		int date_month;
	do{

	 Month_display();
	cout<<"13. Display Crop status\n";


    // selecting the Month
    cout<<"please enter the Month OR display Crop Status: ";
    cin>>date_month;

    // planting winter plants
    if(date_month == 4 || date_month == 5){
    	Plant_winter();

	}

	// planting summer plants
	if(date_month == 8 || date_month == 9 || date_month == 10){
    	Plant_summer();

	}

		// winter havesting
	if(date_month == 1 || date_month == 2 || date_month == 3 ){
		Harvest_winter();
	}
	// Summer havesting
	if(date_month == 11 || date_month == 12){
		Harvest_summer();
	}

    	// Displaying Crop status
	if(date_month == 13){
		crop_details();
   }
}

while(date_month!=0);




	return 0;
}
