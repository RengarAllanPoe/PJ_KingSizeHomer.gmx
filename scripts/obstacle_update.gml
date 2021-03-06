#define obstacle_update
switch type {
    case WALL:
        wall_update();
    break;
    case STRAIGHT_LINE: 
        straight_line_update();
    break;
    case SIN_WAVE:
        sin_wave_update();
    break;
    case JUMPING:
        jumping_update();
    break;   
    default:
    break;
}
if ( x < -abs( sprite_width/2 ) ) {
    instance_destroy();
}

#define wall_update
x -= global.lvl_speed + additional_speed;

#define straight_line_update
x -= global.lvl_speed + additional_speed;

#define sin_wave_update
x -= global.lvl_speed + additional_speed;
y = lane(lane_pos) + sin( x / wave_length + rnd_start ) * wave_amplitude;
//move vertically

#define jumping_update
switch state {
    case JumpingState.JUMPING_UP:
        if( y > lane( target_lane ) ) {
            y -= jump_speed;
        } else {
            state = JumpingState.SUSPENDED;
            timer = suspended_time;
        }
    break;
    case JumpingState.SUSPENDED:
        if( timer > 0 ) {
            timer--;
        } else {
            state = JumpingState.FALLING;
        }
    break;
    case JumpingState.FALLING:
        if( y < room_height + abs( sprite_height ) ) {
            y += fall_speed;
        } else {
            state = JumpingState.RECOVERY;
            timer = recovery_time;
        }
    break;
    case JumpingState.RECOVERY:
        if( timer > 0 ) {
            timer--;
        } else {
            state = JumpingState.JUMPING_UP;
            target_lane = irandom( global.lanes - 1 );
        }
    break; 
    default:
    break;
}

x -= global.lvl_speed + additional_speed;