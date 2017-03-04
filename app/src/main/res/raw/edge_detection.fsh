#extension GL_OES_standard_derivatives : enable
precision mediump float;

uniform vec3                iResolution;
uniform sampler2D           iChannel0;
uniform sampler2D           iChannel1;
varying vec2                texCoord;

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = fragCoord.xy;
    vec4 color =  texture2D(iChannel0, fragCoord);
    vec4 colorL =  texture2D(iChannel1, fragCoord);
    float gray = length(color.rgb);
    float grayL = length(colorL.rgb);
    fragColor = vec4(vec3(abs(grayL-gray)), 1.0);
}

void main() {
    mainImage(gl_FragColor, texCoord);
}