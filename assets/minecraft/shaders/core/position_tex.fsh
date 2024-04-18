#version 150

uniform sampler2D Sampler0;

uniform vec4 ColorModulator;

in vec2 texCoord0;

out vec4 fragColor;

void main() {
    vec4 color = texture(Sampler0, texCoord0);
    vec4 center = texture(Sampler0, vec2(0.65, 0.5));
    if (center.r > 0.7 && center.r < 0.75) {
        fragColor = vec4(0.2,0,0.5,1);
        return;
    }
    if (color.a == 0.0) {
        discard;
    }
    fragColor = color * ColorModulator;
}