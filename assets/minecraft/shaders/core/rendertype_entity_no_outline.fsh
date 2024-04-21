#version 150

#moj_import <fog.glsl>
#moj_import <darkness.glsl>

uniform sampler2D Sampler0;

uniform vec4 ColorModulator;
uniform float FogStart;
uniform float FogEnd;
uniform vec4 FogColor;

in float vertexDistance;
in vec4 vertexColor;
in vec2 texCoord0;
in vec2 texCoord1;
in vec4 lightColor;

out vec4 fragColor;

void main() {
    vec4 texelColor = texture(Sampler0, texCoord0);


    texelColor = calculate_color(texelColor, lightColor, true);

    vec4 color = texelColor * vertexColor * ColorModulator;
    fragColor = linear_fog(color, vertexDistance, FogStart, FogEnd, FogColor);
}