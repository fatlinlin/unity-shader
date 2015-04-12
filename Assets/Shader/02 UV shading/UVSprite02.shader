Shader "Custom/UVSprite02" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}

		//Create the properties below
		_TexWidth("Sheet Width",float)=0.0
		_CellAmount("Cell Amount",float)=0.0

		_TimeValue("TimeValue",float)=0
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		LOD 200
		
		CGPROGRAM
		#pragma surface surf Lambert

		sampler2D _MainTex;
		float _TexWidth;
		float _CellAmount;
		float _TimeValue;

		struct Input {
			float2 uv_MainTex;
		};

		void surf (Input IN, inout SurfaceOutput o) {
			
			//Let's store our UVs in a spearate variable
			float2 spriteUV = IN.uv_MainTex;

			//Let's calculate the width of a singe cell in our
			//sprite sheet and get a uv percentage that each cell takes up.
			float cellPixelWidth = _TexWidth / _CellAmount;
			float cellUVPercentage = cellPixelWidth/_TexWidth;

			//Animate the uvs forward by the width precentage of each cell
			float xValue = spriteUV.x;
			xValue += cellUVPercentage * _TimeValue * _CellAmount;
			xValue *= cellUVPercentage;

			spriteUV=float2(xValue,spriteUV.y);

			half4 c = tex2D (_MainTex, spriteUV);
			o.Albedo = c.rgb;
			o.Alpha = c.a;
		}
		ENDCG
	} 
	FallBack "Diffuse"
}
