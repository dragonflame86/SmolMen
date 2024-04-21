#define MIN_THRESHOLD 0.25
#define SCALE 10000

vec4 calculate_color(vec4 texelColor, vec4 vertexColor, bool saveTransparency) {

    if (vertexColor.r > MIN_THRESHOLD)
        return texelColor;

    float t = vertexColor.r / MIN_THRESHOLD;
    t = pow(SCALE, t) - 1;
    t /= SCALE - 1;

    vec4 dark = vec4(0, 0, 0, saveTransparency ? texelColor.a : 1);
    texelColor = mix(dark, texelColor, t);
    return texelColor;
}