#ifdef GL_ES
precision mediump float;
#endif

varying vec4 v_fragmentColor;
varying vec2 v_texCoord;

void main(void)
{
    float radius = 0.0022;
    if( v_texCoord.x < radius || v_texCoord.x > 1.0 - radius || v_texCoord.y < radius || v_texCoord.y > 1.0 - radius )
      discard;

    vec4 accum = vec4(0.0);
    vec4 normal = vec4(0.0);
    vec3 u_outlineColor = vec3(0.110, 0.988, 1.00);
    
    normal = texture2D(CC_Texture0, vec2(v_texCoord.x, v_texCoord.y));
    
    accum += texture2D(CC_Texture0, vec2(v_texCoord.x - radius, v_texCoord.y - radius));
    accum += texture2D(CC_Texture0, vec2(v_texCoord.x + radius, v_texCoord.y - radius));
    accum += texture2D(CC_Texture0, vec2(v_texCoord.x + radius, v_texCoord.y + radius));
    accum += texture2D(CC_Texture0, vec2(v_texCoord.x - radius, v_texCoord.y + radius));
    
    accum *= 1.75;


    accum.rgb =  u_outlineColor;
    normal = ( accum * (1.0 - normal.a)) + (normal * normal.a);
    
    gl_FragColor = normal;
    gl_FragColor.a *= 0.6;
}
