// THIS IS A WIRE GUIDER TO DIRECT THE PATH OF WIRE IN A SOLAR ASSEMBLER

innerDia = 8;
outerDia = 10;
lengths = 30; // length of cones, cylinders, etc
tipCut = 3.5; // how much of the tip of the cone to cut off
tipSizeCompare = 1; // a block to visualize wire exit hole
screwDia = 3.5; // diameter of screwhole for pivoting

difference() {
	union() {
		hull() {
			cylinder(r1 = outerDia/2, r2 = 0, h = lengths, $fn = 100); // outer cone
			translate([ 0, 0, -1 * lengths]) cylinder(r = outerDia/2, h = lengths, $fn = 100); // shaft
			}
		translate([ -0.5 * lengths, -0.5 * outerDia, -1 * lengths ]) cube(size = [30,outerDia,outerDia], center = false); // wide box
		}
	hull() { // this is the cone and cylinder that subtracts from the solid shape
			cylinder(r1 = innerDia/2, r2 = 0, h = lengths, $fn = 100);
			translate([ 0, 0, -1 * lengths - 1 ]) cylinder(r = innerDia/2, h = lengths);
		}
	translate([ -5, -5, lengths - tipCut ]) cube(size = 10); // this cuts off the tip of the cone, making the exit hole
	translate([ -0.5 * lengths - 1, 0, -1 * lengths + outerDia/2]) rotate(a=[0,90,0]) cylinder(r = screwDia/2, h = lengths + 2, $fn = 100); // screwhole
	}
// translate([ -0.5 * tipSizeCompare, 0, lengths - tipCut ]) cube(size = tipSizeCompare, center = false); // uncomment this only to compare it to the opening size
