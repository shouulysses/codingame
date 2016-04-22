/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

var inputs = readline().split(' ');
var XR = parseInt(inputs[0]); // width of the building. right limit
var YD = parseInt(inputs[1]); // height of the building. down limit
var N = parseInt(readline()); // maximum number of turns before game over.
var inputs = readline().split(' ');
var X0 = parseInt(inputs[0]);
var Y0 = parseInt(inputs[1]);
XL = 0; // left limit
YU = 0; // up limit

// game loop
while (true) {
    var bombDir = readline(); // the direction of the bombs from batman's current location (U, UR, R, DR, D, DL, L or UL)
    if(bombDir.indexOf("U") != -1)
    {
        YD = Y0;
        Y0 = Math.floor((Y0 + YU)/2); 
    }
    if(bombDir.indexOf("D") != -1){
        YU = Y0;
        Y0 = Math.ceil((Y0 + YD)/2);
    }
    if(bombDir.indexOf("L") != -1){ 
        XR = X0;
        X0 = Math.floor((X0 + XL)/2);
    }
    if(bombDir.indexOf("R") != -1){  
        XL = X0;
        X0 = Math.ceil((X0 + XR)/2);   
    }
    print(X0 + " " + Y0); // the location of the next window Batman should jump to.
}
