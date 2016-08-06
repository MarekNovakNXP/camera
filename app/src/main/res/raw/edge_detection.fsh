#extension GL_OES_EGL_image_external : require
#extension GL_OES_standard_derivatives : enable
precision mediump float;

uniform vec3                iResolution;
uniform samplerExternalOES  sTexture;
varying vec2                texCoord;

void main() {
    vec4 color = texture2D(sTexture, texCoord);
    float gray = length(color.rgb);
    gl_FragColor = vec4(vec3(step(0.06, length(vec2(dFdx(gray), dFdy(gray))))), 1.0);
    // gl_FragColor = vec4(vec3(pow(length(vec2(dFdx(gray), dFdy(gray))), .5)), 1.0);
}