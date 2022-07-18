//EncoderKnob
$fa=05;

union(){

    difference(){
        cylinder(h=12,r1=60,r2=50,center=true);
        translate([0,0,-1.5]){
            cylinder(h=9,r1=60-3,r2=50-3,center=true);
        }
    }
    
    difference(){
        cylinder(h=12,r1=10, r2=20,center=true);
        translate([0,0,-3]){
            cylinder(h=12,r1=6.5,r2=6.5,center=true);
        }
    }
    translate([6.5,0,0]){
        cube([3,10,12],true);
    }
}