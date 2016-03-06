HEIGHT = 19.5;

WALL_THICKNESS = 2;
PROTUDE_PERCENTAGE = .33; //percentage of ball radius sticking out 
AIRGAP = .5;
MOUNT = 3;

MOUNT_TYPE = 1;  //1=ears  2=center screw

BALL_SIZE = 15.88;

SCREW_SPACING = 25;
SCREW_RADIOUS = 1.5;  //3mm screw

CYLINDER_HEIGHT = HEIGHT - (BALL_SIZE * PROTUDE_PERCENTAGE);
CYLINDER_RADIOUS = (BALL_SIZE/2) + WALL_THICKNESS + AIRGAP;
CYLINDER_OFFSET = [0, 0, HEIGHT-half(BALL_SIZE)];

CUBE_DIMENSIONS = [CYLINDER_RADIOUS * 2 + 5, CYLINDER_RADIOUS/2, BALL_SIZE * 1.25];

function half(dimension) = dimension / 2;

difference () {
    cylinder(r1 = CYLINDER_RADIOUS , r2 = CYLINDER_RADIOUS, CYLINDER_HEIGHT);
    
    translate(CYLINDER_OFFSET) {
        cube(size = CUBE_DIMENSIONS, center = true );
        }

    translate(CYLINDER_OFFSET) {
        sphere (BALL_SIZE/2 + AIRGAP, $fa=5, $fs=0.1);
        }
    }

difference (){
    linear_extrude(height=MOUNT)
    hull() {
        translate([SCREW_SPACING/2, 0, 0]) {
            circle(SCREW_RADIOUS * 3);
            }
        translate([1 - SCREW_SPACING/2, 0, 0]) {
            circle(SCREW_RADIOUS * 3);
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
