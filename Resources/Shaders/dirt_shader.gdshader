shader_type canvas_item;

uniform sampler2D noise_texture : repeat_enable, filter_linear;

varying mat4 model_matrix;
varying flat int vertex_id;

void vertex() {
	model_matrix = MODEL_MATRIX;
	vertex_id = VERTEX_ID;
}

float random (vec2 uv) {
    return fract(sin(dot(uv.xy,
        vec2(12.9898,78.233))) * 43758.5453123);
}

void fragment() {
	COLOR = texture(TEXTURE, UV + random(VERTEX) / 100.);
	COLOR /= 4.;
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
