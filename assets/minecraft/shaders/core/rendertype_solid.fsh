#version 150

#moj_import <light.glsl>
#moj_import <fog.glsl>

uniform sampler2D Sampler0;

uniform vec4 ColorModulator;
uniform float FogStart;
uniform float FogEnd;
uniform vec4 FogColor;

in float vertexDistance;
in vec4 vertexColor;
in vec4 lightColor;
in vec2 texCoord;
in vec2 texCoord2;
in vec3 Pos;
in float transition;
in float blockLight;

flat in int isCustom;
flat in int noshadow;

in float dimension;
in vec4 maxLightColor;
in vec3 faceLightingNormal;

out vec4 fragColor;

void main() {
    vec4 texelColor = texture(Sampler0, texCoord); 
    texelColor = mix(vec4(0,0,0,1), texelColor, max(lightColor.r - 0.1, 0));

    vec4 color = texelColor * vertexColor * ColorModulator * lightColor;
    fragColor = linear_fog(color, vertexDistance, FogStart, FogEnd, FogColor);
}