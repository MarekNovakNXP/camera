attribute vec2  vPosition;
attribute vec2  vTexCoord;
varying vec2    texCoord;
uniform mat4 matrix;

void main() {
    texCoord = vTexCoord;
    float Angle = 4.71225;
    vec4 before = vec4(vPosition.x, vPosition.y, 0.0, 1.0);
    mat4 RotationMatrix = mat4( cos( Angle ), -sin( Angle ), 0.0, 0.0,
    			                sin( Angle ),  cos( Angle ), 0.0, 0.0,
    			                0.0,           0.0, 1.0, 0.0,
    				            0.0,           0.0, 0.0, 1.0 );


    gl_Position =   before*RotationMatrix; //vec4 ( vPosition.x, vPosition.y, 0.0, 1.0 );
    //!! UNCOMMENT IF YOUR IMAGE IS UPSIDE DOWN !!// gl_Position =   vec4 ( vPosition.x, vPosition.y, 0.0, 1.0 );
}