Shader "Custom/WorldColor"
{
    Properties
    {
        _YAxis ("Y-Axis", Float) = 15
        _XAxis ("X-Axis", Float) = 0
    }

    SubShader 
    {
        CGPROGRAM
        #pragma surface surf Lambert

        float _YAxis;
        float _XAxis;

        struct Input
        {
            float3 worldPos;
        };

        void surf(Input IN, inout SurfaceOutput o) 
        {
            o.Emission = IN.worldPos.y > _YAxis ? abs(_SinTime).rgb : abs(_CosTime).rgb;
            o.Emission *= IN.worldPos.x > _XAxis ? abs(_SinTime).rgb : abs(_CosTime).rgb;
        }
        ENDCG
    }
}