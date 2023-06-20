#ifdef GL_ES
precision mediump float;
#endif

varying vec4 v_fragmentColor;
varying vec2 v_texCoord;

void main(void)
{
    vec4 c = texture2D(CC_Texture0, v_texCoord);

    float base = dot( c.rgb, vec3( 0.299, 0.587, 0.114 ) );
    vec4 final = vec4( base, base, base, c.a );
    final.r -= 0.15;
    final.b += 0.15;

	gl_FragColor = final;
}
