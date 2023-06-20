#ifdef    GL_ES
precision mediump float;
#endif

varying vec4 v_fragmentColor;
varying vec2 v_texCoord;

vec4 blur(vec2);

void main(void)
{
    gl_FragColor = blur(v_texCoord) * v_fragmentColor;
}

vec4 blur(vec2 p)
{
  vec4 sum        = vec4(0);
  //float step      = 0.0116279; // for template
  float step      = 0.0116279 * 0.14;

  float weight[5];
  weight[0] = 0.227027;
  weight[1] = 0.1945946;
  weight[2] = 0.1216216;
  weight[3] = 0.054054;
  weight[4] = 0.016216;

  sum += texture2D( CC_Texture0, p ) * weight[0];

  for( int x = 1; x < 5; ++x )
  {
    float xf = float(x);
    sum += texture2D( CC_Texture0, p + vec2( step * xf, 0.0 ) ) * weight[x];
    sum += texture2D( CC_Texture0, p - vec2( step * xf, 0.0 ) ) * weight[x];
  }
  
  return sum;
}
