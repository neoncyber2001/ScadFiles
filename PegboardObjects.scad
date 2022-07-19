use <./PegboardPartsLib.scad>

partproc=1;



if(partproc==0){
    echo("Vertical Cable Holder");
    cable_comb_part();
}
else if(partproc==1){
    echo("Horizontal Cable Holder");
    cable_comb_horizontal(CutSz=5, Length=130);
}
else{
    echo("Unknown Part");
}



