

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

module bendspring(flexh=[5,15,5],flexx=3,ds=4.2,junction=1,fn=16)
{
  flexa=atan(flexx/flexh[1]);
  union()
  {
    cylinder(d=ds,h=flexh[0],$fn=fn);
    translate([0,0,flexh[0]])
    {
      if(junction)
        sphere(d=ds,$fn=fn);
      rotate([0,flexa,0])
        cylinder(d=ds,h=flexh[1]/cos(flexa),$fn=fn);
      translate([flexx,0,flexh[1]])
      {
        cylinder(d=ds,h=flexh[2],$fn=fn);
        if(junction)
          sphere(d=ds,$fn=fn);
      }
    }
  }
}

module springs(flexh=[5,15,5],flexx=3,ds=4.2,junction=1,fn=16)
{
  r0=4;
  for(i=[0:3])
  rotate([0,0,i*90+45])
  translate([r0,0,0.7])
    bendspring(flexh=flexh,flexx=flexx,ds=ds,junction=junction,fn=fn);
}


module bolts()
{
  r0=7;
  color([0.6,0.6,0.7])
  for(i=[0:3])
  rotate([0,0,i*90+45])
    translate([r0,0,31])
    {
        // head
        cylinder(d=5.5,h=3,$fn=16);
        // rod
        rotate([180,0,0])
          cylinder(d=3,h=10,$fn=16);
    }
}

module front()
{
  hc=3;
  douter=30;
  dinsert=20.5;
  in=1;
  dopen=19;
  color([0.4,0.4,0.4])
  translate([0,0,-hc/2+in])
    difference()
    {
      //cube([30,30,hc],center=true);
      cylinder(d=douter,h=hc,center=true,$fn=64);
      // insertion hole
      translate([0,0,hc/2-in/2])
        cylinder(d=dinsert,h=in+0.1,center=true);
      // aperture hole
      cylinder(d=dopen,h=hc+0.1,center=true);
    }
}

piezo();
%springs(flexh=[5,15,5],flexx=3,ds=4.2,junction=1,fn=16);
bolts();
front();

