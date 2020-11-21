dscrw=31;
dwide=39;
lhigh=32.5;

module motor()
{
  dscrw=31;
  dwide=39;
  lhigh=32.5;
  dround=8;
  dcircle=22;
  hcircle=1.8;

  difference()
  {
  minkowski()
  {
    cube([dwide-dround,dwide-dround,lhigh/2],center=true);
    cylinder(d=dround,h=lhigh/2,center=true,$fn=32);
  }
    for(i=[0:3])
      rotate([0,0,i*90])
        translate([dscrw/2,dscrw/2,lhigh/2-4.9])
          cylinder(d=3,h=lhigh,$fn=16);
  }
  translate([0,0,lhigh/2])
    cylinder(d=dcircle,h=hcircle,$fn=64);
}

motor();
