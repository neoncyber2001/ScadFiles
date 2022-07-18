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
        translate([0,-3.5,0]){
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
    union(){
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
}

module vhole(sz=3){
    union(){
        translate([-1*(15/2), 0, 0]){
            cube([15,sz,15],center=true);
        }
        cylinder(h=15, r=sz/2, center=true);
    }
}


module cable_comb_horizontal(CutSz=3, Slots=8, Length=100){
    union(){
        peg_hook_assy(spaces=1);
        translate([0,-1*((Length/2)+11.05),0]){
            cube([4,Length,(HoleSpacingV)+4],center=true);
        }
        /*
        translate([-18,-1*(25*2+8.75),((HoleSpacingV+4)/2)-1.5]){
            rotate([90,0,0]){
                cylinder(h=104.5,r=3,center=true);  //([20,25*4+4.5,3],center=true);
            }
        }
        */
        difference(){
            union(){
                translate([-10,-1*((Length/2)+8.75),((HoleSpacingV+4)/2)-1.5]){
                    cube([20,Length+4.5,3],center=true);
                }
                translate([-18,-1*((Length/2)+8.75),((HoleSpacingV+4)/2)-1.5]){
                        rotate([90,0,0]){
                            cylinder(h=Length+4.5,r=3,center=true);  //([20,25*4+4.5,3],center=true);
                      }
                }
            }
            
            for(i=[0:Slots-1]){
                translate([-6,((Length/Slots)+(i*(Length/Slots)))*-1,((HoleSpacingV+4)/2)-2.5]){
                    vhole(sz=CutSz);
                }
            }
        }
    }
}

