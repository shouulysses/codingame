var participants = parseInt(readline());
var price = parseInt(readline());
var budget = [];
var solution = [];
var total = 0;


for (var i = 0; i < participants; i++) {
    budget[i] = parseInt(readline());
    total += budget[i];
 
    solution[i] = 0;
}
var remaining = participants;
// sort the input
budget.sort(function(a, b){return a-b});

// if average > max, impossible
var average = Math.ceil(price/participants);
var max = Math.max(...budget);
if (average > max || price > total){
    impossible = true;
    print("IMPOSSIBLE");
}else{
    while (price >= participants)
    {
        average = Math.floor(price/remaining);
        for (var i = 0; i < participants; i++)
        {
            if (average < budget[i])
            {
                budget[i] -= average;
                solution[i] += average;
                price -= average;
            }else if (budget[i] > 0){
                solution[i] += budget[i];
                price -= budget[i]
                budget[i] = 0
                remaining--;
            }
        }
    }
    // dealing with the remainder
    for (var j = 0; j < budget.length; j++)
    {
        if(j >= (budget.length-price) && price !== 0){
            solution[j]++;
        }
        print(solution[j]);
    }
}
