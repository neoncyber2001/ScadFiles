$fn=100;

HoleDiameter = 6;
HoleSpacingV = 25;
HoleSpacingH = 25;

HoleClear=0.5;
Protrusion=5;

//Do Not Modify
HoleR = HoleDiameter/2;
HoleRC = HoleClear/2;
HoleRF = HoleR-HoleRC;

module top_hook(P){
    union(){
        translate([0,0,0]){
            rotate([0,90,0]){
                rotate_extrude(angle=90, convexity=10){
                    translate([HoleR,0,0]){
                        circle(r = HoleRF);
                    }
                }
            }
        }
        translate([0,HoleR,Protrusion/2]){
            cylinder(h=Protrusion,r=HoleRF, center=true);
        }
        translate([0,-1*(Protrusion/2),HoleR*-1]){
            rotate([90,0,0]){
                cylinder(h=Protrusion,r=HoleRF, center=true);
            }
        }
    }
}

module bottom_peg(){
    union(){
        translate([0,0,0]){
            rotate([90,0,0]){
                cylinder(h=Protrusion*2, r=HoleRF, center=true);
            }
        }
    }
}

module peg_hook_assy(spaces = 1, SpannerDepth=5){
    vheight=spaces*HoleSpacingV;
    union(){
        translate([0,0,vheight/2]){
            top_hook();
        }
        translate([0,0,-1*(vheight/2)]){           
            bottom_peg();
        }
        translate([0,(Protrusion)*-1.5,(HoleR/2)*-1]){
            cube([HoleDiameter,SpannerDepth,vheight+HoleR], center=true);
        }
    }
}

module cable_comb_part(){
    union(){
        translate([0,Protrusion,0]){
            peg_hook_assy(spaces=1);
        }
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
        translate([-1*(15/2), 0, -10]){
            cube([15,sz,30],center=true);
        }
        translate([0, 0, -10]){
          cylinder(h=30, r=sz/2, center=true);
        }
    }
}


module cable_comb_horizontal(CutSz=3, Slots=8, Length=100){
    union(){
        
        translate([0,Protrusion,0]){
            peg_hook_assy(spaces=1);
        }
        translate([0,-1*((Length/2)),0]){
            cube([6,Length,(HoleSpacingV)],center=true);
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
                translate([-10,-1*(Length/2),(HoleSpacingV/2)-1.5]){
                    cube([20,Length,3],center=true);
                }
                translate([-18,-1*(Length/2),(HoleSpacingV/2)-1.5]){
                        rotate([90,0,0]){
                            cylinder(h=Length,r=3,center=true);  //([20,25*4+4.5,3],center=true);
                      }
                }
                rotate([90,0,0]){
                    linear_extrude(Length){
                        polygon([[0,HoleSpacingV/2],[0,(HoleSpacingV/2)*-1], [-10,(HoleSpacingV/2)]]);
                    }
                }
            }
            
            for(i=[0:Slots]){
                translate([-6,((Length/Slots)/2)+(i*(Length/Slots))*-1,((HoleSpacingV+4)/2)-2.5]){
                    vhole(sz=CutSz);
                }
            }
        }

    }
}

//top_hook();
//bottom_peg();
//peg_hook_assy();
cable_comb_horizontal(CutSz=6, Length=130, Slots=10);
