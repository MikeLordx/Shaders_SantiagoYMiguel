Shader "Custom/11"
{
    Properties
    {
        _MainTex ("Main texture", 2D) = "white" {}
    }
    
    SubShader
    {
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            
            sampler2D _MainTex;
            fixed _Twist;
            
            struct vertexInput
            {
                float4 vertex : POSITION;
                half2 texcoord : TEXCOORD0;
            };
            
            struct vertexOuput
            {
                float4 pos : SV_POSITION;
                half2 uv : TEXCOORD0;
            };
            
            vertexOuput vert(vertexInput v)
            {
                //Rota la textura para dar apariencia de que el objeto se rota
                vertexOuput o;
                float s = sin(_SinTime.x * v.vertex.y);
                float c = cos(_SinTime.x * v.vertex.y);
                float2x2 rot = float2x2(c, -s, s, c);
                v.vertex.xz = mul(rot, v.vertex.xz);
                o.pos = UnityObjectToClipPos(v.vertex);
                o.uv = v.texcoord;
                return o;
            }
                
            fixed4 frag(vertexOuput i) : SV_TARGET
            {
                //Regresa la textura final
                return tex2D(_MainTex, i.uv);
            }
            ENDCG
        }
    }
}