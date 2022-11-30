Shader "Custom/8"
{
    Properties
    {
        _Scale ("Scale", Float) = 1.0
    }
    
    SubShader
	{
	    Pass
		{
		    CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			
			#include "UnityCG.cginc"
			
			float _Scale;

			struct v2f
			{
				float4 pos : SV_POSITION;
				float3 vertex : TEXCOORD0;
			};

			v2f vert(float4 vertex : POSITION)
			{
				v2f o;
				o.pos = UnityObjectToClipPos(vertex);
				o.vertex = vertex.xyz;
				return o;
			}
			
			fixed4 frag(v2f i) : SV_TARGET
			{
				//Con la variable _Scale se escala la textura por el seno de la posicion y tambien se mueve por tiempo
			    const float PI = UNITY_PI;
			    
			    float v = 1.0;
			    float time = _Time.y;
			    
			    float2 c = i.vertex.xy * _Scale - _Scale / 2.0;
			    v += sin((c.x + time));
			    v *= sin((c.y + time) / 2.0);
			    v += cos((c.x + c.y + time) / 2.0);
			    c += _Scale / 2.0 * float2(sin(time / 3.0), sin(time / 2.0));
			    v += sin(cos(c.x * c.x + c.y * c.y + 1.0) + time);
			    v /= 2.0;
			    
			    fixed3 col;
			    col.r = sin(v * PI);
			    col.g = sin(v * PI + 2.0 * PI / 3.0);
			    col.b = sin(v * PI + 4.0 * PI / 3.0);
			    return fixed4(col + 0.5, 1);
			}
			ENDCG
		}
	}
}   
