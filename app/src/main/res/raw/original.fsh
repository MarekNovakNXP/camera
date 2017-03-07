precision mediump float;


varying vec2                texCoord;
uniform sampler2D           iChannel0;

void main() {
    gl_FragColor = texture2D(iChannel0, texCoord);
}
/*

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



    vec3 edges = vec3(step(0.0002, length(vec2(dFdx(gray), dFdy(gray)))));
    vec3 motion = vec3(abs(grayL-gray));

  ///vec4(1.0,0.0,0.0,1.0);
    fragColor = vec4(motion, 1.0);
}

void main() {
    mainImage(gl_FragColor, texCoord);
}*/