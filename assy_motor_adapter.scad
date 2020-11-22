include <motor.scad>
include <sprocket_adapter.scad>
include <rod_holder.scad>

%motor();
translate([0,0,33.3])
rotate([180,0,0])
for(i=[0:1])
  rotate([0,0,180*i])
    sprocket_adapter();
translate([0,0,33])
  rod_holder();