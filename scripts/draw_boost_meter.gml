draw_healthbar( x - 50, y - sprite_height, x + 50, y - sprite_height + 10, boost_meter/current_max_boost * 100, c_black, c_yellow, c_yellow, 0, true, false );
if( damage_percentage > 20 ) {
    if( damage_percentage < 98 ) {
        draw_sprite_ext( spr_pingu_effects, image_index, x, y, image_xscale, image_yscale, 0, c_red, damage_percentage / 100  * 0.8 );
    } else {
        draw_sprite_ext( spr_pingu_effects, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1 );
    }
}

