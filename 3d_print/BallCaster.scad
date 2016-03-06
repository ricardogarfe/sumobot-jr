WALL_THICKNESS = 2;
BALL_SIZE = 15.88;
AIRGAP = .5;
MOUNT = 3;
HEIGHT = 19.5;
MOUNT_SCREW_RADIOUS = 1.5;  //3mm screw
PROTUDE_PERCENTAGE = .33; //percentage of ball radius sticking out 

MOUNT_TYPE = 1;  //1=ears  2=center screw
SCREW_SPACGING = 25;

cylheight = HEIGHT;
cylrad = (BALL_SIZE/2) + WALL_THICKNESS + AIRGAP;

difference () {
    cylinder(r1 = cylrad , r2 = cylrad,  cylheight - (BALL_SIZE * PROTUDE_PERCENTAGE));

    translate([0,0,HEIGHT - BALL_SIZE/2]) {
        cube(size = [cylrad*2+5, cylrad/2, BALL_SIZE*1.25], center = true );
        }

    translate([0,0,HEIGHT - (BALL_SIZE/2)]) {
        sphere (BALL_SIZE/2 + AIRGAP, $fa=5, $fs=0.1);
        }
    }

difference (){
    linear_extrude(height=MOUNT)
    hull() {
        translate([SCREW_SPACGING/2, 0, 0]) {
            circle(  MOUNT_SCREW_RADIOUS * 3);
            }
        translate([1 - SCREW_SPACGING/2, 0, 0]) {
            circle( MOUNT_SCREW_RADIOUS * 3);
            }
        circle( cylrad);
        }

    translate([SCREW_SPACGING/2, 0, 0]) {
        cylinder(r1 = MOUNT_SCREW_RADIOUS, r2 = MOUNT_SCREW_RADIOUS, h= MOUNT+2);
        }
    translate([1 - SCREW_SPACGING/2, 0, 0]) {
        cylinder(r1 = MOUNT_SCREW_RADIOUS, r2 = MOUNT_SCREW_RADIOUS, h= MOUNT+2);
        }
}
