#version 150

#moj_import <fog.glsl>

uniform sampler2D Sampler0;

uniform vec4 ColorModulator;
uniform float FogStart;
uniform float FogEnd;
uniform vec4 FogColor;

in float vertexDistance;
in vec4 vertexColor;
in vec2 texCoord0;
in vec4 lightColor;

out vec4 fragColor;

void main() {
    vec4 texelColor = texture(Sampler0, texCoord0); 
    texelColor = mix(vec4(0,0,0,texelColor.a), texelColor, max(lightColor.r - 0.1, 0));

    vec4 color = texelColor * vertexColor * ColorModulator * lightColor;
    if (color.a < 0.5) {
        discard;
    }
    fragColor = linear_fog(color, vertexDistance, FogStart, FogEnd, FogColor);
}