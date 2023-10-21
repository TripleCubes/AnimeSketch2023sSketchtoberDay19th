shader_type canvas_item;

uniform float BLUR_RANGE;
uniform float INTENSITY_MUL;
uniform float WINDOW_H;

uniform sampler2D horizontal_blurred_texture;

void fragment() {
	float step = 1.0f/WINDOW_H;

	vec3 added_color = vec3(0.0f, 0.0f, 0.0f);
	for (float i = -BLUR_RANGE; i <= BLUR_RANGE; i++) {
		float intensity = 1.0f - (abs(i) / BLUR_RANGE);
		vec2 sample_pos = UV + vec2(0.0f, i*step);
		added_color += texture(horizontal_blurred_texture, sample_pos).xyz * intensity;
	}
	added_color /= BLUR_RANGE*2.0f + 1.0f;
	added_color *= 2.0f * INTENSITY_MUL;

	COLOR = vec4(added_color, 1.0f);
}
