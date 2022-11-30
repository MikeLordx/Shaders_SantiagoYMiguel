Shader "Custom/7"
{
    Properties
    {
        _MainTex ("Base (RGB)", 2D) = "white" {}
        _Emission ("Emission", 2D) = "white" {}
    }

    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert vertex:vert

        sampler2D _MainTex;
        sampler2D _Emission;

        struct Input
        {
            float2 uv_MainTex;
            float2 uv_Emission;
        };

        void vert(inout appdata_full v)
        {
            //Hace un estilo movimiento de ola ademas de que se estira hasta regresar a su forma inicial constantemente
            float3 p = v.vertex.xyz;
            p.y = tan(p.x + _Time.y);
            v.texcoord.xyz = p * 3;
            v.vertex.xyz = p;
        }

        void surf(Input IN, inout SurfaceOutput o)
        {
            o.Albedo = tex2D(_MainTex, IN.uv_MainTex).rgb;
            o.Emission = tex2D(_Emission, IN.uv_Emission).rgb * 1;
        }
        ENDCG
    }
}