GDPC                                                                                  res://default_env.tres         �       um�`�N��<*ỳ�8   res://index.tscn�      I      P�6X��Y�L�!��}   res://project.binary       2      z�Y���J�a����[gd_resource type="Environment" load_steps=2 format=2]

[sub_resource type="ProceduralSky" id=1]

[resource]
background_mode = 2
background_sky = SubResource( 1 )
             [gd_scene load_steps=3 format=2]

[sub_resource type="Shader" id=1]
code = "shader_type canvas_item;

float draw_circle(vec2 pos, vec2 uv, float r){
	return r / distance(uv, pos);
}

void fragment(){
	float d = distance(UV, vec2(0.5));
	COLOR.a = 1.0 - draw_circle(vec2(0.5), UV, 0.2);
}"

[sub_resource type="ShaderMaterial" id=2]
shader = SubResource( 1 )

[node name="Node2D" type="Node2D"]

[node name="ColorRect" type="ColorRect" parent="."]
material = SubResource( 2 )
margin_left = 3.77551
margin_right = 554.776
margin_bottom = 551.0
__meta__ = {
"_edit_use_anchors_": false
}
       ECFG      application/config/name         shaders    application/run/main_scene         res://index.tscn   application/config/icon         res://icon.png  )   physics/common/enable_pause_aware_picking         )   rendering/environment/default_environment          res://default_env.tres                