
include <chamfered_corner.scad>;

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

echo ("mount height:", mount_height);
echo ("mount width:", mount_width);

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

        }
     // chamferred corners
    // coner [x,y] corresponds to the multipler on x
    chamfered_corner(mount_height/2 - chamfer_radius, 
        mount_width/2 - chamfer_radius, 
        0, 
        [1,1], 
        chamfer_radius, 
        mount_thickness);
    chamfered_corner(mount_height/2 - chamfer_radius, 
        (mount_width/2 - chamfer_radius), 
        0, 
        [1,-1], 
        chamfer_radius, 
        mount_thickness);
    chamfered_corner((mount_height/2 - chamfer_radius), 
        (mount_width/2 - chamfer_radius), 
        0, 
        [-1,-1], 
        chamfer_radius, 
        mount_thickness);
    chamfered_corner((mount_height/2 - chamfer_radius), 
        (mount_width/2 - chamfer_radius), 
        0, 
        [-1, 1], 
        chamfer_radius, 
        mount_thickness);
        
    // external mount clearance
    translate([-55, 0, 0])
    cube([10, mount_width, mount_thickness], center=true);
    }

}