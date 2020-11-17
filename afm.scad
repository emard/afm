

module piezo()
{
  dmetal=20;
  dactive=15;
  dsilver=13.5;

  color([1,1,0])
    cylinder(d=dmetal,h=0.2,$fn=64);
  translate([0,0,0.201])
  color([0.8,0.8,0.6])
    cylinder(d1=dactive,d2=dactive-0.7,h=0.4,$fn=64);
  translate([0,0,0.602])
  color([0.9,0.9,0.9])
    difference()
    {
      cylinder(d=dsilver,h=2e-3,$fn=64); // 2 microns thick coating
      cube([0.3,dactive,1],center=true);
      cube([dactive,0.3,1],center=true);
    }
}

module springs()
{
  s=3;
  for(i=[-1:2:1])
    for(j=[-1:2:1])
      translate([s*i,s*j,0.7])
        cylinder(d=4,h=19,$fn=16);
}

module bolts()
{
  s=3;
  color([0.6,0.6,0.7])
  for(i=[-1:2:1])
    for(j=[-1:2:1])
    {
      translate([s*i,s*j,25])
      {
        // head
        cylinder(d=5.5,h=3,$fn=16);
        // rod
        rotate([180,0,0])
          cylinder(d=3,h=12,$fn=16);
      }
    }

}

piezo();
%springs();
bolts();
