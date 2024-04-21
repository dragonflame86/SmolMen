#define MIN_THRESHOLD 0.25
#define SCALE 10000

vec4 calculate_color(vec4 texelColor, vec4 vertexColor, bool saveTransparency) {
    float t = vertexColor.r / MIN_THRESHOLD;
    t = pow(SCALE, t) - 1;
    t /= SCALE - 1;
    t = clamp(t, 0, 1);

    vec4 dark = vec4(0, 0, 0, saveTransparency ? texelColor.a : 1);
    texelColor = mix(dark, texelColor, t);
    return texelColor;
}