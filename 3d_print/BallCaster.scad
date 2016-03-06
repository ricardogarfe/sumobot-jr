WALL_THICKNESS = 2;
BALL_SIZE = 15.88;
AIRGAP = .5;
MOUNT = 3;
HEIGHT = 19.5;
SCREW_RADIOUS = 1.5;  //3mm screw
PROTUDE_PERCENTAGE = .33; //percentage of ball radius sticking out 

MOUNT_TYPE = 1;  //1=ears  2=center screw
SCREW_SPACING = 25;

CYLINDER_HEIGHT = HEIGHT;
CYLINDER_RADIOUS = (BALL_SIZE/2) + WALL_THICKNESS + AIRGAP;

<<<<<<< HEAD
function half(dimension) = dimension / 2;

CYLINDER_OFFSET = [0, 0, HEIGHT-half(BALL_SIZE)];

difference () {
    cylinder(r1 = CYLINDER_RADIOUS , r2 = CYLINDER_RADIOUS,  CYLINDER_HEIGHT - (BALL_SIZE * PROTUDE_PERCENTAGE));
    
    translate(CYLINDER_OFFSET) {
=======
difference () {
    cylinder(r1 = CYLINDER_RADIOUS , r2 = CYLINDER_RADIOUS,  CYLINDER_HEIGHT - (BALL_SIZE * PROTUDE_PERCENTAGE));

    translate([0,0,HEIGHT - BALL_SIZE/2]) {
>>>>>>> 5681e182039aef64e2fe405135331588e41a812e
        cube(size = [CYLINDER_RADIOUS * 2 + 5, CYLINDER_RADIOUS/2, BALL_SIZE*1.25], center = true );
        }

    translate(CYLINDER_OFFSET) {
        sphere (BALL_SIZE/2 + AIRGAP, $fa=5, $fs=0.1);
        }
    }

difference (){
    linear_extrude(height=MOUNT)
    hull() {
<<<<<<< HEAD
        translate([SCREW_SPACING/2, 0, 0]) {
            circle(SCREW_RADIOUS * 3);
            }
        translate([1 - SCREW_SPACING/2, 0, 0]) {
            circle(SCREW_RADIOUS * 3);
=======
        translate([SCREW_SPACGING/2, 0, 0]) {
            circle(MOUNT_SCREW_RADIOUS * 3);
            }
        translate([1 - SCREW_SPACGING/2, 0, 0]) {
            circle(MOUNT_SCREW_RADIOUS * 3);
>>>>>>> 5681e182039aef64e2fe405135331588e41a812e
            }
        circle(CYLINDER_RADIOUS);
        }

    translate([SCREW_SPACING/2, 0, 0]) {
        cylinder(r1 = SCREW_RADIOUS, r2 = SCREW_RADIOUS, h= MOUNT + 2);
        }
    translate([1 - SCREW_SPACING/2, 0, 0]) {
        cylinder(r1 = SCREW_RADIOUS, r2 = SCREW_RADIOUS, h= MOUNT + 2);
        }
}
