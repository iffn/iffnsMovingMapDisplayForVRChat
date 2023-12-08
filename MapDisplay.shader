// Made with Amplify Shader Editor v1.9.2.2
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "WindowPosition"
{
	Properties
	{
		_TextureSample0("Texture Sample 0", 2D) = "white" {}
		_InvertedZoom("InvertedZoom", Float) = 1
		_AspectRatio("AspectRatio", Float) = 1
		_WindowPosition("WindowPosition", Vector) = (0,0,0,0)
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float3 worldPos;
		};

		uniform sampler2D _TextureSample0;
		uniform float2 _WindowPosition;
		uniform float _InvertedZoom;
		uniform float _AspectRatio;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 temp_output_20_0 = ( _WindowPosition + float2( 0.5,0.5 ) );
			float2 appendResult14 = (float2(_InvertedZoom , ( _InvertedZoom * _AspectRatio )));
			float3 ase_vertex3Pos = mul( unity_WorldToObject, float4( i.worldPos , 1 ) );
			float2 appendResult5 = (float2(ase_vertex3Pos.x , ase_vertex3Pos.y));
			float2 lerpResult18 = lerp( temp_output_20_0 , ( temp_output_20_0 + appendResult14 ) , appendResult5);
			o.Albedo = tex2D( _TextureSample0, lerpResult18 ).rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
}
/*ASEBEGIN
Version=19202
Node;AmplifyShaderEditor.RangedFloatNode;9;-1322.637,-10.73592;Inherit;False;Property;_AspectRatio;AspectRatio;2;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;10;-1112.373,-17.39386;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PosVertexDataNode;4;-649.4961,191.2876;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;5;-380.687,207.32;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;2;115.5698,-123.7208;Inherit;True;Property;_TextureSample0;Texture Sample 0;0;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;459.5327,-95.43591;Float;False;True;-1;2;;0;0;Standard;WindowPosition;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;;0;False;;False;0;False;;0;False;;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;12;all;True;True;True;True;0;False;;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;2;15;10;25;False;0.5;True;0;0;False;;0;False;;0;0;False;;0;False;;0;False;;0;False;;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;;-1;0;False;;0;0;0;False;0.1;False;;0;False;;False;17;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;16;FLOAT4;0,0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
Node;AmplifyShaderEditor.DynamicAppendNode;14;-918.066,-35.89648;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;17;-477.905,-26.84808;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LerpOp;18;-164.1028,-78.61879;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;20;-667.4459,-238.4399;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector2Node;21;-955.0979,-188.28;Inherit;False;Constant;_Vector0;Vector 0;4;0;Create;True;0;0;0;False;0;False;0.5,0.5;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.Vector2Node;8;-965.4781,-345.1765;Inherit;False;Property;_WindowPosition;WindowPosition;3;0;Create;True;0;0;0;False;0;False;0,0;-0.43,-0.65;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.RangedFloatNode;6;-1315.14,-125.8287;Inherit;False;Property;_InvertedZoom;InvertedZoom;1;0;Create;True;0;0;0;False;0;False;1;0.13;0;0;0;1;FLOAT;0
WireConnection;10;0;6;0
WireConnection;10;1;9;0
WireConnection;5;0;4;1
WireConnection;5;1;4;2
WireConnection;2;1;18;0
WireConnection;0;0;2;0
WireConnection;14;0;6;0
WireConnection;14;1;10;0
WireConnection;17;0;20;0
WireConnection;17;1;14;0
WireConnection;18;0;20;0
WireConnection;18;1;17;0
WireConnection;18;2;5;0
WireConnection;20;0;8;0
WireConnection;20;1;21;0
ASEEND*/
//CHKSM=8499594AE9D3468EA74A861D33C8D068080B7CA0