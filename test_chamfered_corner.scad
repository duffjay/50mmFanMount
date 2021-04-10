include <chamfered_corner.scad>;


mount_height = 118;
mount_width = 70;
mount_thickness = 3;

rad = 5;

// chamferred corners
chamfered_corner(mount_height/2 - rad, mount_width/2 - rad, 0, [1,1], rad, mount_thickness);

chamfered_corner((mount_height/2 - rad), (mount_width/2 - rad), 0, [ 1,-1], rad, mount_thickness);

chamfered_corner((mount_height/2 - rad), (mount_width/2 - rad), 0, [-1,-1], rad, mount_thickness);

chamfered_corner((mount_height/2 - rad), (mount_width/2 - rad), 0, [-1, 1], rad, mount_thickness);
