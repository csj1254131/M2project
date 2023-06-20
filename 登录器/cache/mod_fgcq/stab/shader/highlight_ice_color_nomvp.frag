#ifdef GL_ES
precision mediump float;
#endif

varying vec4 v_fragmentColor;
varying vec2 v_texCoord;

void main(void)
{
    vec4 c      = texture2D(CC_Texture0, v_texCoord);
    vec4 golden = vec4( 0.41, 0.78, 1.0, 1.0 );
    // vec4 final  = c * 1.0 + golden * 1.0;
    vec4 final  = c * 1.0 + golden * 1.0;

    //final.a = v_fragmentColor.a * c.a * 0.8;
    //final.a = c.a * 0.875;
    final.a = c.a;

    gl_FragColor = final;
}
