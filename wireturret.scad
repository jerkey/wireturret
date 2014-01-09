// THIS IS A WIRE GUIDER TO DIRECT THE PATH OF WIRE IN A SOLAR ASSEMBLER

innerDia = 8;
outerDia = 10;
lengths = 30;
tipCut = 2;
tipSizeCompare = 1;

difference() {
	union() {
		cylinder(r1 = outerDia, r2 = 0, h = lengths); // outer cone
		translate([ 0, 0, -1 * lengths - 1]) cylinder(r = outerDia, h = lengths + 1.1); // shaft
		}
	union() {
//			translate([ -5, -5, lengths - tipCut ]) cube(size = 10, center = false); 
			cylinder(r1 = innerDia, r2 = 0, h = lengths);
			translate([ 0, 0, -1 * lengths - 1.1 ]) cylinder(r = innerDia, h = lengths + 1.2);
		}
	}
// translate([ -0.5 * tipSizeCompare, 0, lengths - tipCut ]) cube(size = tipSizeCompare, center = false);