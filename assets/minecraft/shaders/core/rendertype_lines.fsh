#version 150

#moj_import <fog.glsl>

uniform vec4 ColorModulator;
uniform float FogStart;
uniform float FogEnd;
uniform vec4 FogColor;

in float vertexDistance;
in vec4 vertexColor;
in vec4 lightColor;

out vec4 fragColor;

void main() {
    vec4 color = vertexColor * ColorModulator;
    if (color.r < 0.2) {
        color = vec4(0.05,0.05,0.05, 0.7);
    } 

    fragColor = linear_fog(color, vertexDistance, FogStart, FogEnd, FogColor);
}