// THIS IS A WIRE GUIDER TO DIRECT THE PATH OF WIRE IN A SOLAR ASSEMBLER

innerDia = 8;
outerDia = 10;
length = 40; // length of cones, cylinders, etc
blockWidth = 40; // width of screw block
tipCut = 5; // how much of the tip of the cone to cut off
tipDia = 0.45;
tipSizeCompare = 1; // a block to visualize wire exit hole
tipEdgeCompare = 0.5; // a block to visualize thickness next to hole
screwDia = 3.5; // diameter of screwhole for pivoting
screwHeight = 50; // height of screws on turret stand
servoTray = 36; // z height of extra stuff to be a servo tray on stand

difference() {
	union() {
		hull() {
			cylinder(r1 = outerDia/2, r2 = tipDia, h = length, $fn = 100); // outer cone
			// translate([ 0, 0, -1 * length]) cylinder(r = outerDia/2, h = length, $fn = 100); // shaft
			}
		translate([ -0.5 * blockWidth, -0.5 * outerDia, 0 ]) cube(size = [blockWidth,outerDia,outerDia], center = false); // wide box
                translate([ -1, -0.5 * outerDia, 0 ]) cube(size = [2,outerDia/2,length - tipCut], center = false); // grab handle on turret
		}
	hull() { // this is the cone and cylinder that subtracts from the solid shape
			translate([ 0, 0, -0.1]) cylinder(r1 = innerDia/2, r2 = 0, h = length, $fn = 100);
			// translate([ 0, 0, -1 * length - 1 ]) cylinder(r = innerDia/2, h = length);
		}
	translate([ -5, -5, length - tipCut ]) cube(size = 10); // this cuts off the tip of the cone, making the exit hole
	translate([ -0.5 * blockWidth - 1, 0, outerDia/2]) rotate(a=[0,90,0]) cylinder(r = screwDia/2, h = blockWidth + 2, $fn = 100); // screwhole
	}
// translate([ -0.5 * tipSizeCompare, 0, length - tipCut ]) cube(size = tipSizeCompare, center = false); // uncomment this only to compare it to the opening size
// translate([ -1 * tipSizeCompare, -0.5 * tipSizeCompare, length - tipCut ]) cube(size = tipEdgeCompare, center = false); // uncomment this only to compare it to wall thickness
/*
difference() {
        union() {
                translate([ -0.5 * blockWidth - 2*outerDia, outerDia, 0 ]) cube(size = [blockWidth + 4*outerDia,outerDia,outerDia], center = false); // extra wide box
                translate([ -0.5 * blockWidth, outerDia, 0 ]) cube(size = [blockWidth,outerDia,outerDia + servoTray], center = false); // servo tray sticks out
                translate([ -0.5 * blockWidth - outerDia, outerDia, 0 ]) cube(size = [outerDia,screwHeight + outerDia/2,outerDia], center = false); // stand leg
                translate([ 0.5 * blockWidth, outerDia, 0 ]) cube(size = [outerDia,screwHeight + outerDia/2,outerDia], center = false); // other stand leg
                }
        translate([0, screwHeight + outerDia, outerDia/2]) rotate(a=[0,90,0]) cylinder(r = screwDia/2, h = blockWidth + 2*outerDia + 1, center = true, $fn = 100);
        translate([0, 1.3*outerDia, 1.5*outerDia]) rotate(a=[0,90,0]) cylinder(r = screwDia/2, h = blockWidth + 2*outerDia + 1, center = true, $fn = 100); // ziptie hole
        translate([0, 1.3*outerDia, 3.5*outerDia]) rotate(a=[0,90,0]) cylinder(r = screwDia/2, h = blockWidth + 2*outerDia + 1, center = true, $fn = 100); // ziptie hole
        }
