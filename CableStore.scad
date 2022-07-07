$fs = 0.1;

width = 160;
gap = 4;
slots=16;
useMoogLabel=false;
useUsbLabel=false;
useEuroRackLabel=false;
useCustomLabel=false;
customLabelString="Patch Cable";
//Don't edit;
step=width/slots;
difference(){
    union(){
        cube([width,1.5,20], true);
        translate([0,20-1.5/2,10]){
            cube([width,40,3],true);
        }
        translate([0,0,0]){
            rotate([0,-90,0]){
                linear_extrude(width, center=true){
                    polygon(points=[[0,0], [10,0], [10,20]]);
                }
            }
        }
    
        translate([0,37,10]){
            rotate([0,90,0]){
                cylinder(h=width,r1=3, r2=3, center=true);
            }
        }
    }
    for(i= [-1*((width/2)-(step/2)) : step : ((width/2)-(step/2))]){
        translate([i,20+(gap/2),5]){
            union(){
                cube([gap,36,20],true);
                translate([0,-36/2,0]){
                    cylinder(h=20, r1=gap/2, r2=gap/2,center=true);
                }

            }
        }
    }
    if(useMoogLabel){
        difference(){
            translate([0,0.5,-8]){
                rotate([90,0,180]){
                    linear_extrude(1.5, center=true){
                        text("MOOG",size=8, halign="center");
                    }
                }
            }
            translate([0,0,-4]){
                cube([17,1.5,1.5],true);
            }
        }
    }
    if(useUsbLabel){
        translate([0,0.5,-8]){
            rotate([90,0,180]){
                linear_extrude(1.5, center=true){
                    text("USB",size=8, halign="center");
                }
            }
        }        
    }
    
    if(useEuroRackLabel){
        translate([0,0.5,-8]){
            rotate([90,0,180]){
                linear_extrude(1.5, center=true){
                    text("Euro Rack",size=8, halign="center");
                }
            }
        }        
    }
    
    if(useCustomLabel){
        translate([0,0.5,-8]){
            rotate([90,0,180]){
                linear_extrude(1.5, center=true){
                    text(customLabelString,size=8, halign="center");
                }
            }
        }        
    }
}