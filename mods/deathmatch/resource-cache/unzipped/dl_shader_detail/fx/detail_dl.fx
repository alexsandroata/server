//
// Example shader - detail_dl.fx
//


//---------------------------------------------------------------------
// Detail settings
//---------------------------------------------------------------------
texture sDetailTexture;
float sDetailScale = 8;         // Repeat interval of the texture
float sFadeStart = 10;          // Near point where distance fading will start
float sFadeEnd = 80;            // Far point where distance fading will complete (i.e. effect will not be visible past this point)
float sStrength = 0.5;          // 0 to 1 for the strength of the effect
float sAnisotropy = 0.0;        // 0 to 1 for the amount anisotropy of the effect - Higher looks better but can be slower

bool sDisableNormals = false;

//---------------------------------------------------------------------
// Render targets
//---------------------------------------------------------------------
texture colorRT < string renderTarget = "yes"; >;
texture normalRT < string renderTarget = "yes"; >;

//---------------------------------------------------------------------
// Include some common stuff
//---------------------------------------------------------------------
//#define GENERATE_NORMALS // Uncomment for normals to be generated
#include "mta-helper.fx"


//---------------------------------------------------------------------
// Extra renderstates which we use
//---------------------------------------------------------------------
int gCapsMaxAnisotropy < string deviceCaps="MaxAnisotropy"; >; 
float gAlphaRef < string renderState="ALPHAREF"; >;

//---------------------------------------------------------------------
// Sampler for the main texture
//---------------------------------------------------------------------
sampler Sampler0 = sampler_state
{
    Texture = (gTexture0);
    MipFilter = Linear;
    MaxAnisotropy = gCapsMaxAnisotropy * sAnisotropy;
    MinFilter = Anisotropic;
};

//---------------------------------------------------------------------
// Sampler for the detail texture
//---------------------------------------------------------------------
sampler SamplerDetail = sampler_state
{
    Texture = (sDetailTexture);
    MipFilter = Linear;
    MaxAnisotropy = gCapsMaxAnisotropy * sAnisotropy;
    MinFilter = Anisotropic;
};


//---------------------------------------------------------------------
// Structure of data sent to the vertex shader
//---------------------------------------------------------------------
struct VertexShaderInput
{
  float3 Position : POSITION0;
  float3 Normal : NORMAL0;
  float4 Diffuse : COLOR0;
  float2 TexCoord : TEXCOORD0;
};

//---------------------------------------------------------------------
// Structure of data sent to the pixel shader ( from the vertex shader )
//---------------------------------------------------------------------
struct PixelShaderInput
{
  float4 Position : POSITION0;
  float4 Diffuse : COLOR0;
  float2 TexCoord : TEXCOORD0;
  float4 Normal : TEXCOORD1;
  float2 DistFade : TEXCOORD2;
  float3 WorldPos : TEXCOORD3;
  float2 Depth : TEXCOORD4;
};


//------------------------------------------------------------------------------------------
// VertexShaderFunction
//  1. Read from VS structure
//  2. Process
//  3. Write to PS structure
//------------------------------------------------------------------------------------------
PixelShaderInput VertexShaderFunction(VertexShaderInput VS)
{
    // Initialize result
    PixelShaderInput PS = (PixelShaderInput)0;
	
    float4 Normal;
    if ((gDeclNormal != 1) || (sDisableNormals)) Normal = float4(0,0,0,0);
        else Normal = float4(mul(VS.Normal, (float3x3)gWorld), 1);
    PS.Normal = Normal; 

    // Calculate screen pos of vertex
    float4 worldPos = mul(float4(VS.Position.xyz, 1), gWorld);
    PS.WorldPos = worldPos.xyz;
    float4 viewPos = mul(worldPos, gView);
    PS.Depth = float2(viewPos.z, viewPos.w);
    PS.Position = mul(viewPos, gProjection);

    // Pass through tex coord
    PS.TexCoord = VS.TexCoord;

    // Calculate GTA lighting for buildings
    PS.Diffuse = MTACalcGTABuildingDiffuse(VS.Diffuse);

    // Distance fade calculation
    float DistanceFromCamera = MTACalcCameraDistance( gCameraPosition, worldPos.xyz );
    PS.DistFade.x = 1 - ( ( DistanceFromCamera - sFadeStart ) / ( sFadeEnd - sFadeStart ) );

    // Return result
    return PS;
}

//------------------------------------------------------------------------------------------
// MTAApplyFog
//------------------------------------------------------------------------------------------
int gFogEnable                     < string renderState="FOGENABLE"; >;
float4 gFogColor                   < string renderState="FOGCOLOR"; >;
float gFogStart                    < string renderState="FOGSTART"; >;
float gFogEnd                      < string renderState="FOGEND"; >;
 
float3 MTAApplyFog( float3 texel, float distFromCam )
{
    if ( !gFogEnable )
        return texel;
    float FogAmount = ( distFromCam - gFogStart )/( gFogEnd - gFogStart );
    texel.rgb = lerp(texel.rgb, gFogColor.rgb, saturate( FogAmount) );
    return texel;
}

//------------------------------------------------------------------------------------------
// Structure of color data sent to the renderer ( from the pixel shader  )
//------------------------------------------------------------------------------------------
struct Pixel
{
    float4 World : COLOR0;      // Render target #0
    float4 Color : COLOR1;      // Render target #1
    float4 Normal : COLOR2;      // Render target #3
};

//------------------------------------------------------------------------------------------
// PixelShaderFunction
//  1. Read from PS structure
//  2. Process
//  3. Return pixel color
//------------------------------------------------------------------------------------------
Pixel PixelShaderFunction(PixelShaderInput PS)
{
    Pixel output;	
	
    // Get texture pixel
    float4 texel = tex2D(Sampler0, PS.TexCoord);

    // Get detail pixel
    float4 texelDetail1 = tex2D(SamplerDetail, PS.TexCoord * sDetailScale );
    float4 texelDetail2 = tex2D(SamplerDetail, PS.TexCoord * sDetailScale * 1.9 );
    float4 texelDetail3 = tex2D(SamplerDetail, PS.TexCoord * sDetailScale * 3.6 );
    float4 texelDetail4 = tex2D(SamplerDetail, PS.TexCoord * sDetailScale * 7.4 );

    float4 texelDetail = texelDetail1 * texelDetail2 * 2 * texelDetail3 * 2 * texelDetail4 * 2;

    // Apply diffuse lighting
    float4 Color = texel * PS.Diffuse;

    // Attenuate detail depending on pixel distance and user setting
    float detailAmount = saturate( PS.DistFade.x ) * sStrength;
    float4 texelDetailToUse = lerp ( 0.5, texelDetail, detailAmount );

    // Add detail
    float4 finalColor = Color * texelDetailToUse * 2;
    finalColor.a = Color.a;
	
    finalColor.rgb = MTAApplyFog(finalColor.rgb, PS.Depth.x / PS.Depth.y);
    output.World = saturate(finalColor);
		
    // Color render target
    output.Color.rgb = saturate(texel.rgb * texelDetailToUse.rgb * 2);
    output.Color.a = texel.a * PS.Diffuse.a;
		
    // Normal render target
	float3 Normal = normalize(PS.Normal);
    if ((PS.Normal.w == 0) || (sDisableNormals)) 
        output.Normal = float4(dot(PS.Diffuse.xyz,float3(0.299,0.587,0.114)),0,0.211,1);
        else output.Normal = float4((Normal.xy * 0.5) + 0.5, Normal.z <0 ? 0.411 : 0.589, 1);
	
    return output;
}


//------------------------------------------------------------------------------------------
// Techniques
//------------------------------------------------------------------------------------------

technique detail_dl
{
    pass P0
    {
        VertexShader = compile vs_3_0 VertexShaderFunction();
        PixelShader = compile ps_3_0 PixelShaderFunction();
    }
}

technique fallback
{
    pass P0
    {
        // Just draw normally
    }
}
