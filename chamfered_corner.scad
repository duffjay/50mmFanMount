$fn = 50;

// chamferred corners
// -- this gives you the part to SUBTRACT for a chamferred corner

module chamfered_corner(xlate_x, xlate_y, xlate_z, corner, rad, thickness) {
    echo ("chamfer quad:", corner[0], corner[1]);
    echo ("chamfer translate:", xlate_x, xlate_y, xlate_z);
    
    translate([corner[0] * xlate_x, corner[1] * xlate_y, xlate_z])
    {
        
            // intersection == to get just one corner
            intersection() {
            translate([corner[0]*rad/2, corner[1]*rad/2, 0])
            cube([rad, rad, thickness], center=true);
            // cube w/ center circle removed == 4 corners
            difference() {
                cube ([rad * 2, rad * 2, thickness], center=true);
                cylinder(h = thickness, r = rad, center = true);
                }
            }   
        
    }
}