

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

module bendspring(flexh=[5,15,5],flexx=3)
{
  ds=4.2;
  flexa=atan(flexx/(flexh[1]-flexh[0]));
  union()
  {
  cylinder(d=ds,h=flexh[0],$fn=16);
  translate([0,0,flexh[0]])
  {
    sphere(d=ds,$fn=16);
    rotate([0,flexa,0])
      {
        cylinder(d=ds,h=flexh[1],$fn=16);
        translate([0,0,flexh[1]])
          sphere(d=ds,$fn=16);
      }
    translate([flexh[1]*sin(flexa),0,flexh[1]*cos(flexa)])
    //translate([flexx,0,flexh[1]])
      cylinder(d=ds,h=flexh[2],$fn=16);
  }
  }
}

module spring2()
{
  r0=4;
  for(i=[0:3])
  rotate([0,0,i*90+45])
  translate([r0,0,0.7])
    bendspring();
}

module springs()
{
  s=3; // spacing
  for(i=[-1:2:1])
    for(j=[-1:2:1])
      translate([s*i,s*j,0.7])
        cylinder(d=4.2,h=19,$fn=16);
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
%spring2();
//%springs();
//bolts();
