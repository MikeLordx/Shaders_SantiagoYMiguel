Shader "Custom/9"
{
    Properties
    {
        _HologramColor ("Hologram Color", Color) = (1, 1, 1, 1)
        _HologramTex ("Hologram texture", 2D) = "white" {}
        _Freq ("Hologram speed", Float) = 1.0
    }
    
    SubShader
    {
        Tags { "Queue" = "Transparent"}
        
        CGPROGRAM
        #pragma surface surf StandardSpecular alpha:blend
        
        fixed4 _HologramColor;
        sampler2D _HologramTex;
        float4 _HologramTex_ST;
        float _Freq;
        
        struct Input
        {
            float2 uv_HologramTex;
            float4 screenPos;
        };
        
        void surf(Input IN, inout SurfaceOutputStandardSpecular o)
        {
            float2 screenUV = IN.screenPos.xy / max(IN.screenPos.w, 1);
            screenUV *= _HologramTex_ST.xy;
            //Decalara textura del holograma y el movimiento por la frecuencia
            fixed4 hologramCol = tex2D(_HologramTex, screenUV + (_Freq * _Time.y));
            //Se mueve su transparencia
            _HologramColor *= (1.0 - hologramCol); 
            o.Albedo = _HologramColor.rgb;
            o.Emission = _HologramColor.rgb;
            o.Alpha = hologramCol.r;
            o.Specular = 0.5;
        }
        ENDCG
    }
}