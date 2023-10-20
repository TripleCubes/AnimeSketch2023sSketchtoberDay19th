shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE: hint_screen_texture, repeat_disable, filter_nearest;
uniform sampler2D unblurred_texture;

void fragment() {
	COLOR = texture(SCREEN_TEXTURE, SCREEN_UV) + texture(unblurred_texture, SCREEN_UV);
}
