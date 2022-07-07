inch = 25.4;
$fs=0.1;
difference(){
    union(){
        translate([0,0,.25*inch]){
            cube([(3/4)*inch,(1/2)*inch, (0.5)*inch],center=false);
        }
        translate([((3/4)*0.5)*inch, 0.25*inch, 0.25*inch]){
            rotate([0,90,0]){
            cylinder(h=0.75*inch, d=(0.5)*inch, center=true);
            }
        }

        translate([((3/4)/2)*inch, 0.25*inch, (0.75)*inch]){
            cube([3*inch,0.75*inch, 0.5*inch], center=true);
        }
    }
    translate([((3/4)/2)*inch, 0.25*inch, (0.75+0.125)*inch]){
        cube([3*inch,0.45*inch, 0.5*inch], center=true);
    }
    translate([((3/4)/2)*inch, 0.4*inch, (0.75+0.125)*inch]){
        cube([0.36*inch,0.5*inch, 0.5*inch], center=true);
    }
    translate([(1/8)*inch,-0.25*inch, 0]){
     cube([0.5*inch,1*inch,0.5*inch],center=false);
    }
    translate([((3/4)*0.5)*inch, 0.25*inch, 0.25*inch]){
        rotate([0,90,0]){
        cylinder(h=1*inch, d=(0.125)*inch, center=true);
        }
    }
}