shader_type canvas_item;

uniform float BLUR_RANGE;
uniform float INTENSITY_MUL;
uniform float WINDOW_W;

uniform sampler2D SCREEN_TEXTURE: hint_screen_texture, repeat_disable, filter_nearest;

void fragment() {
	float step = 1.0f/WINDOW_W;

	vec3 added_color = vec3(0.0f, 0.0f, 0.0f);
	for (float i = -BLUR_RANGE; i <= BLUR_RANGE; i++) {
		float intensity = 1.0f - (abs(i) / BLUR_RANGE);
		vec2 sample_pos = SCREEN_UV + vec2(i*step, 0.0f);
		added_color += texture(SCREEN_TEXTURE, sample_pos).xyz * intensity;
	}
	added_color /= BLUR_RANGE*2.0f + 1.0f;
	added_color *= 2.0f * INTENSITY_MUL;

	COLOR = vec4(added_color, 1.0f);
}
