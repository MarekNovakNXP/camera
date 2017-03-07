#extension GL_OES_standard_derivatives : enable
precision mediump float;

uniform vec3                iResolution;
uniform sampler2D           iChannel0;
uniform sampler2D           iChannel1;
uniform sampler2D           iChannel2;
varying vec2                texCoord;

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec4 color =  texture2D(iChannel0, fragCoord);
    vec4 colorL =  texture2D(iChannel1, fragCoord);
    vec4 colorLL =  texture2D(iChannel2, fragCoord);
    float gray = length(color.rgb);
    float grayL = length(colorL.rgb);
    float grayLL = length(colorLL.rgb);

    float edges = step(0.3, length(vec2(dFdx(gray), dFdy(gray))));
    float edgesL = step(0.3, length(vec2(dFdx(grayL), dFdy(grayL))));
    float edgesLL = step(0.3, length(vec2(dFdx(grayLL), dFdy(grayLL))));


    float motion = step(.7, abs(grayL-gray));

    fragColor = vec4(vec3(max(motion -  edges - edgesLL, 0.0)), 1.0);

    /*mix(
    vec4(max(motion.xyz -  edges.xyz - edgesLL.xyz, 0.0)*vec3(1.0,0.0,0.0), 1.0),
    color,
    0.5);*/
}

void main() {
    mainImage(gl_FragColor, texCoord);
}