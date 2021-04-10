$fn = 50;

// chamferred corners
// -- this gives you the part to SUBTRACT for a chamferred corner

module chamfered_corner(xlate_x, xlate_y, xlate_z, rad, thickness) {

    translate([xlate_x, xlate_y, xlate_z])
    {
        // intersection == to get just one corner
        intersection() {
        translate([rad/2, rad/2, 0])
        cube([rad, rad, thickness], center=true);
        // cube w/ center circle removed == 4 corners
        difference() {
            cube ([rad * 2, rad * 2, thickness], center=true);
            cylinder(h = thickness, r = rad, center = true);
            }
        }   
    }
}