include <BOSL/shapes.scad>
include <BOSL/constants.scad>
use <BOSL/involute_gears.scad>

if (true) {
$fa=1;
$fs=0.04;
}

height = 18.43;


main();

module main() {
    difference(){
        union() {
            cyl(
                l=height,
                d1=19.17,
                d2=18.53,
                fillet2=2,
                align=V_UP
            );
            handle();
        }
        
        color("green") gear(
            mm_per_tooth=1.69,
            number_of_teeth=22,
            thickness=height+1,
            hole_diameter=0,
            align=V_UP
        );
        
        color("purple") cyl(l=6, d=13.06, align=V_UP);

        color("red") translate([0,0,-4])
            sphere(d=16, center=true);
        
        up(height)
            cyl(l=8.7, d=14, align=V_DOWN);
    }

}





module handle() {
    difference() {
        teardrop(
            r=9,
            h=height-1,
            ang=3.7,
            cap_h=18*3.5,
            align=V_UP,
            orient=ORIENT_Z
        );

        color("orange") back(45) up(10) handleNoseCutout();
        
        color("blue") back(79) handleBottomCutout();
        
        color("lightblue") up(7.45) back(9) handleTopCutout();

    }    
}


module handleNoseCutout() {
    difference() {
        backcube([15,20,30], center=true);
        resize([13, 0, 0])
            cylinder(h=32, d=36, center=true);
    }
}


module handleBottomCutout() {
    resize([0, 0, 20])
        cyl(d=140, h=20, orient=ORIENT_X);
}


module handleTopCutout() {
    difference() {
        up(5)
        fwd(10)
            cuboid([20, 80, 13], align=V_BACK);
        resize([0, 0, 20])
            cyl(d=140, h=22, orient=ORIENT_X);
    }
}

