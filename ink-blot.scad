
// Creative Prompt
//
//Situation generator: A sting operation at the post office
//Oblique generator: Once the search is in progress, something will be found
//Emoji generator: :black_circle:️ :cross: :fountain_pen:
//anniebart generator: a bill splitter


// bill creation
h = rands(10,40,1)[0]; // random bill split
difference() {
    translate([h,-5,-5]) { color("white") cube([60-h,55,5]); }
    translate([42,32,-6]) { resize([15,15,2]) linear_extrude(15) import("postal-stamp-svgrepo-com.svg", convexity=3); } // svg import
}

translate([52,46,0]) { 
    rotate([0,0,270]) linear_extrude(2) text("this is a split bill", size=4, font = ":style=Bold"); } // extruded text
translate([-10,-5,-5]) { color("white") cube([h+9,55,5]); }
    

// ink blot creation
difference() {
    for  (i = [0:10]) {
        x = rands(15, 30, 1)[0];
        y = rands(15, 30, 1)[0];
        c = rands(0, 0.5, 1)[0];        
        rand = round(rands(1,1,1)[0]);
        
        // spheres
        if (rand == 0) {
            r = rands(3,10,1)[0];
            difference() {
                translate([x,y,0]) { color([c,c,c]) sphere(r, $fs = 0.1); }
                translate([0,0,5]) { color([c,c,c]) cube([60,50,5]); }
            }
            
        // rounded cubes
        } else if (rand == 1) {
            w = rands(5,15,1)[0];
            d = rands(5,15,1)[0];
            r = rands(1,360,1)[0];
            translate([x,y,0]) { 
                rotate([0,0,r]) 
                color([c,c,c]) minkowski() { // easier to say than rorschach
                    cube([w, d, 4]); 
                    cylinder(r=2,h=1);
                }
            }
            
        // fantastic sphere&cylinder merging
        } else if (rand==2) {
            translate([x,y,0]) { 
                color([c,c,c]) resize([10,30,10]) 
                union() { 
                    sphere(5); 
                    rotate([0,270,0]) cylinder(20, 5, 5); 
                }
            }
        }
    }
    color("grey") translate([0,0,-20]) { cube([60,50,15]); }
}

// pen creation
x = rands(15,25,1)[0];
y = rands(15,25,1)[0];
color("blue") {
    translate([x,y,2]) { cylinder(5, 0, 3); }
    difference() {
        translate([x,y,7]) { cylinder(20, 3, 3); }
        color("white") translate([x+2,y-2,15]) { rotate([90,0,90]) scale([1,1.5,1]) linear_extrude(2) text("+", size=5); } // engraved cross using text and scaling
    }
    translate([x,y,27]) { sphere(3); }
}

