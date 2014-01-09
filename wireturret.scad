innerDia = 8;
outerDia = 10;
lengths = 30;
tipCut = 5;

difference() {
	union() {
		cylinder(r1 = outerDia, r2 = 0, h = lengths);
		translate([ 0, 0, -1 * lengths ]) cylinder(r = outerDia, h = lengths);
		}
	union() {
			translate([ -5, -5, lengths - tipCut ]) cube(size = 10, center = false);
			cylinder(r1 = innerDia, r2 = 0, h = lengths);
			translate([ 0, 0, -1 * lengths ]) cylinder(r = innerDia, h = lengths);
		}
	}
