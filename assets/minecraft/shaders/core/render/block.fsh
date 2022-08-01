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

flat in int isCustom;
flat in int noShadow;

out vec4 fragColor;

void main() {
    vec4 color = texture(Sampler0, texCoord);
    if (color.a < 0.01) {discard;}

    //custom lighting
    #define BLOCK
    #moj_import<objmc.light>

    fragColor = linear_fog(color, vertexDistance, FogStart, FogEnd, FogColor);
}