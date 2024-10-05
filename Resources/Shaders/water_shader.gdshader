shader_type canvas_item;

uniform sampler2D noise_texture: filter_nearest, repeat_enable;
uniform sampler2D screen_texture: hint_screen_texture;

uniform float distortion : hint_range(0.01, 0.9);
uniform float speed : hint_range(0.1, 1.0);

void vertex() {
	VERTEX.x += cos(TIME) * .1;
	VERTEX.y += cos(TIME) * 2.;
}

void fragment() {
	vec2 uv = UV + TIME * speed;
	vec2 noise = 2. * texture(noise_texture, uv).rg - vec2(1.);
	
	COLOR = texture(TEXTURE, UV + noise * distortion);
	COLOR *= texture(screen_texture, SCREEN_UV + noise * distortion);}
