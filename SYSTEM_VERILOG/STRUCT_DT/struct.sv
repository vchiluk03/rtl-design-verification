/*********************************************
- Tokyo-2020 happened, 170 countries participated in 350 events and earned some number of 
    gold,silver and bronze medals.
- As games progress, they do the ranking.
    - Either based on gold medals or total medals.
- In our example, first we will randomly assigning number of gold,silver and bronze medals to each country.
    - Based on that random value assignment, we want to do the ranking.
	
- 350 events : So total number of gold, silver and bronze medals possible are 350 each.
	- We need to constrait this in such a way that, total gold medals should be 350.
												- total silver medals should be 350.
												- total bronze medals should be 350.
			- For this, we should define one class.
*************************************************************/
`define COUNTRIES 10
`define EVENTS 	  50
`define SIZE	  6

typedef struct {
    string country_name;
    bit [`SIZE-1:0] gold;
    bit [`SIZE-1:0] silver;
    bit [`SIZE-1:0] bronze;
}medals_t; //data type created which holds country name, 
			//and type and number of medals they earned.

class sample;
	rand bit [`SIZE-1:0] goldA[`COUNTRIES-1:0];
	rand bit [`SIZE-1:0] silverA[`COUNTRIES-1:0];
	rand bit [`SIZE-1:0] bronzeA[`COUNTRIES-1:0];
	
//Define constraint for setting total count of each medal should be 350.
constraint count_C {
	  goldA.sum()   with (int'(item)) == `EVENTS;
      silverA.sum() with (int'(item)) == `EVENTS;
      bronzeA.sum() with (int'(item)) == `EVENTS;
}
endclass

module top;
medals_t medalsA[`COUNTRIES-1:0]; //Total 170 countries
medals_t medalsQ[$];
sample s = new();

initial begin 
    //randomly assigning each country with different medals count.
	assert(s.randomize()); 
		//The sample packet will be randomized and generate some random values for gold array,
			//silver array and bronze array. Also the sum of each array is 350.
		//Assign these values to our struct array.
	foreach(medalsA[i]) begin
		medalsA[i].country_name = $sformatf("country_%0d",i);
		medalsA[i].gold = s.goldA[i];
		medalsA[i].silver = s.silverA[i];
		medalsA[i].bronze = s.bronzeA[i];
	end
	
	//Displaying the medalsA(array).
	$display("medalsA = %p",medalsA);
	$display("s.goldA=%p",s.goldA);
	$display("s.silverA=%p",s.silverA);
	$display("s.bronzeA=%p",s.bronzeA);
	
	//Then sort the Data base as per our requirement.
	medalsA.sort() with (item.gold);
		//using struct.gold as reference, do the sorting.
	$display("medalsA after normal sort(ascending order)=%p",medalsA);
	
	//Do the same with reverse sorting (descending order). 
	medalsA.rsort() with (item.gold);
	$display("medalsA after reverse sort(descending order)=%p",medalsA);
	
	//Taking total number of medals for each country as a reference, do the reverse sorting.
	medalsA.rsort with (item.gold+item.silver+item.bronze);
	$display("medalsA after reverse sorting by taking total number of medals as ref:\n%p",medalsA);
	
	//Find the countries who have more than 5 gold medals.
	medalsQ = medalsA.find() with (item.gold > 5);
	$display("Printing queue, which has countries with gold medals > 5\n%p",medalsQ);
end

endmodule