shader_type canvas_item;

uniform sampler2D vertical_blurred_texture;
uniform sampler2D unblurred_texture;

void fragment() {
	COLOR = texture(vertical_blurred_texture, UV) + texture(unblurred_texture, UV);
}
