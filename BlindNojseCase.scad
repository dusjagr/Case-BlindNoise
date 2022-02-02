
/// Case for BlindNoise nano errorinstruments
/// designed by dusjagr 2022
/// public domain

wallThickness = 1.6;
height = 12;
PCB = 1.6;
length = 150;
width = 80;

difference() {
translate([0,0,height+wallThickness]) rotate([180,0,0]) baseCase2();
    rotate([90,0,0])  translate([0,height/2+1,0]) roundedRect ([12,7,width*1],3);
    
    //#translate([0,60,height/2-0.5]) cube([10,20,6],true);

}

module baseCase2(){
    translate([0,0,height]) roundedRect([length+1.48*wallThickness, width+1.48*wallThickness, wallThickness/5], width/2);
    translate([0,0,height]) roundedRect([length+1.4*wallThickness, width+1.4*wallThickness, wallThickness/2.7], width/2);
    translate([0,0,height]) roundedRect([length+1.3*wallThickness, width+1.3*wallThickness, wallThickness/2], width/2);
    translate([0,0,height]) roundedRect([length+1.1*wallThickness, width+1.1*wallThickness, wallThickness/1.5], width/2);
    translate([0,0,height]) roundedRect([length+0.8*wallThickness, width+0.8*wallThickness, wallThickness/1.3], width/2);
    translate([0,0,height]) roundedRect([length+0.5*wallThickness, width+0.5*wallThickness, wallThickness/1.1], width/2);
    translate([0,0,height]) roundedRect([length+0*wallThickness, width+0*wallThickness, wallThickness/1], width/2);
    
    difference() {
    roundedRect([length+2*wallThickness, width+2*wallThickness, height], width/2+wallThickness);
    translate([0,0,-1]) roundedRect([length, width, height], width/2);
    }
    
    difference() {
    translate([0,0,PCB]) roundedRect([length, width, height-PCB], width/2);
        translate([0,0,0]) roundedRect([length-6, width-6, 100], width/2-3);
        translate([0,0,0]) cube([length-width+20,width,100],true);
    }
}


module baseCase(){

linear_extrude(height = wallThickness, center = false, convexity = 10) import(file = "BlindNoiseCase.dxf", layer = "Base");

linear_extrude(height = height, center = false, convexity = 10) import(file = "BlindNoiseCase.dxf", layer = "Wall");
  
linear_extrude(height = height-PCB, center = false, convexity = 10) import(file = "BlindNoiseCase.dxf", layer = "Support");

}



// radius - radius of corners
module roundedRect(size, radius)
{
	x = size[0];
	y = size[1];
	z = size[2];

	translate([0,0,0])
	linear_extrude(height=z)
	hull()
	{
		// place 4 circles in the corners, with the given radius
		translate([(-x/2)+(radius), (-y/2)+(radius), 0])
		circle(r=radius, $fn=300);
	
		translate([(x/2)-(radius), (-y/2)+(radius), 0])
		circle(r=radius, $fn=300);
	
		translate([(-x/2)+(radius), (y/2)-(radius), 0])
		circle(r=radius, $fn=300);
	
		translate([(x/2)-(radius), (y/2)-(radius), 0])
		circle(r=radius, $fn=300);
	}
  }

        
