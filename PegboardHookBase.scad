$fn=100;

HoleDiameter = 5;
HoleSpacingV = 25;
HoleSpacingH = 25;

module top_hook(){
    union(){
        translate([0,-2,2]){
            rotate([0,90,0]){
                rotate_extrude(angle=90, convexity=10){
                    translate([2,0,0]){
                        circle(r = 2);
                    }
                }
            }
        }
        translate([0,0,4.5]){
            cylinder(h=5,r=2, center=true);
        }
        translate([0,-4.5,0]){
            rotate([90,0,0]){
                cylinder(h=5,r=2, center=true);
            }
        }
    }
}

module bottom_peg(){
    union(){
        translate([0,-4,0]){
            rotate([90,0,0]){
                cylinder(h=7, r=2, center=true);
            }
        }
        translate([0,0,0]){
            sphere(2);
        }
    }
}

module peg_hook_assy(spaces = 1){
    vheight=spaces*25;
    union(){
        translate([0,0,vheight/2]){
            top_hook();
        }
        translate([0,0,-1*(vheight/2)]){           
            bottom_peg();
        }
        translate([0,-9,0]){
            cube([4,5,vheight+4], center=true);
        }
    }
}

module cable_comb_part(){
    peg_hook_assy(spaces=1);
    difference(){
        translate([0,-11.5,0]){
            rotate([90,0,-90]){
                difference(){
                    linear_extrude(4,center=true){
                        polygon([[0,(25/2)+2],[0,(-1*(25/2))-2],[25*3,(25/4)],[25*3,(25/2)+2]]);
                    }
                    linear_extrude(5,center=true){
                        polygon([[5,(25/2)-8],[5,(-1*(25/2))+3],[25*3-20,(25/2)-8]]);
                    }
                }
            }
        }
        for(i=[0:8]){
            translate([0,-1*(5+(25*3))+(9*i),(HoleSpacingV/2)-2]){
                rotate([0,90,0]){
                    cylinder(h=6,r=3, center=true);
                }
            }
            translate([0,-1*(5+(25*3))+(9*i),(HoleSpacingV/2)+0.5]){
                cube([6,6,6], center=true);
            }
        }
       
    }
}