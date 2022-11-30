Shader "Custom/6"
{
    Properties
    {
        _MainTex("Main Texture", 2D) = "white" {}
        _Normal("Normal", 2D) = "white" {}
        _Color("Color", color) = (1,1,1,1)

    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 200

        CGPROGRAM
        #pragma surface surf Standard fullforwardshadows

        #pragma target 3.0

        sampler2D _MainTex;
        sampler2D _Normal;
        float4 _Color;

        struct Input
        {
            float2 uv_MainTex;
            float2 uv_Normal;
        };

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            //Declara las texturas necesarias
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex) * _Color;
            fixed3 d = UnpackNormal(tex2D(_Normal, IN.uv_MainTex));
            float3 t = pow(2, _Color);

            //Usando la variable integrada de CG _Time.y se cambia por cada textura declarada antes
            if (_Time.y >= 1 )
            {
                o.Albedo = _Color;
            }

            if (_Time.y >= 10)
            {
                o.Albedo = c;
            }

            if (_Time.y >= 20)
            {
                o.Albedo = c * t;
                o.Normal = d;
            }
        }
        ENDCG
    }
    FallBack "Diffuse"
}