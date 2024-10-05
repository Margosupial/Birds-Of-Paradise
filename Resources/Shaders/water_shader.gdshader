shader_type canvas_item;

void vertex() {
	VERTEX.x += cos(TIME) * 5.;
	VERTEX.y += cos(TIME) * 2.;
}

void fragment() {
	
}
