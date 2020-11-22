include <nut_cutter.scad>

module rod_holder()
{
    drod=3; // rod hole dia
    xhole=22; // mount screw holes distance
    dhole=3; // mount screw hole dia
    dhead=6; // mount screw head dia
    hmount=3; // mount screw height from bottom
    box=[29,12,10]; // cube dimension
    translate([0,0,box[2]/2])
    difference()
    {
      cube(box,center=true);
      // cut mounting screws
      for(i=[0:1])
        rotate([0,0,180*i])
          translate([xhole/2,0,0])
          {
            // screw bolt pass
            cylinder(d=dhole,h=box[2]+0.01,$fn=16,center=true);
            // screw head inlet
            translate([0,0,-box[2]/2+hmount])
              cylinder(d=dhead,h=box[2],$fn=16);
          }
      // cut rod
      cylinder(d=drod,h=box[2]+0.01,$fn=16,center=true);
      // cut nut holder
      translate([0,0,-box[2]/2])
        nut_cutter();
    }
}

if(0)
  rod_holder();
