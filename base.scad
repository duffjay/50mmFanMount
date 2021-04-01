

screw_dia = 4;
screw_dim = 40;
fan_frame_dim = 50;
mount_thickness = 3;
mount_width = 70;

slot_height = 100;
slot_height_margin = 9;
mount_height = slot_height + slot_height_margin * 2;

fan_dia = 48; 

chamfer_radius = 5;

$fn = 50;

// chamferred corners
// -- this gives you the part to SUBTRACT for a chamferred corner
translate([80, 40, 0])
{
    // intersection == to get just one corner
    intersection() {
    translate([chamfer_radius/2, chamfer_radius/2, 0])
    cube([chamfer_radius, chamfer_radius, mount_thickness], center=true);
    // cube w/ center circle removed == 4 corners
    difference() {
        cube ([chamfer_radius * 2, chamfer_radius * 2, mount_thickness], center=true);
        cylinder(h = mount_thickness, r = chamfer_radius, center = true);
        }
    }   
}

difference() {

    // starting form
    {
    // mounting plate
    cube ([(mount_height), (mount_width), mount_thickness], center=true);
    }
    // subtract this from starting form
    {
    // -- (j = 2) fan exhaust holes
    for (j = [-1, 1])
        {
        // each fan
        translate([j * fan_frame_dim/2, 0, 0]){
            cylinder(h = mount_thickness, r = (fan_dia/2),  center=true);
            // 2 x dim mounting holes
            for (x = [0:1])
                {
                // 2 y dim mounting holes
                for (y = [0:1])
                    {
                    translate([(-screw_dim/2) + (x * screw_dim), (-screw_dim/2) + (y * screw_dim), 0])
                    cylinder(h = mount_thickness, r = (screw_dia/2), center=true);
                    }
                }
            }
        // chamferred corners

        }
    }
}