--
-- c_detail.lua
--

local renderTarget = {RTColor = nil, RTNormal = nil, isOn = false, distFade = {100, 80}}
local scx, scy = guiGetScreenSize ()

----------------------------------------------------------------
-- enableDetail
----------------------------------------------------------------
function enableDetail()
	if bEffectEnabled then return end
	-- Load textures
	detail22Texture = dxCreateTexture('media/detail22.png', "dxt3")
	detail58Texture = dxCreateTexture('media/detail58.png', "dxt3")
	detail68Texture = dxCreateTexture('media/detail68.png', "dxt1")
	detail63Texture = dxCreateTexture('media/detail63.png', "dxt3")
	dirtyTexture = dxCreateTexture('media/dirty.png', "dxt3")
	detail04Texture = dxCreateTexture('media/detail04.png', "dxt3")
	detail29Texture = dxCreateTexture('media/detail29.png', "dxt3")
	detail55Texture = dxCreateTexture('media/detail55.png', "dxt3")
	detail35TTexture = dxCreateTexture('media/detail35T.png', "dxt3")
	
	-- Check list of all elements used
	bAllValid = true

	-- Create shaders
	brickWallShader, tec = getBrickWallShader()
	if brickWallShader then
		-- Only create the rest if the first one is OK
		grassShader = getGrassShader()
		roadShader = getRoadShader()
		road2Shader = getRoad2Shader()
		paveDirtyShader = getPaveDirtyShader()
		paveStretchShader = getPaveStretchShader()
		barkShader = getBarkShader()
		rockShader = getRockShader()
		mudShader = getMudShader()
		concreteShader = getBrickWallShader()	-- TODO make this better
		sandShader = getMudShader()				-- TODO make this better
	end

	-- Get list of all elements used
	effectParts = {
						detail22Texture, detail58Texture, detail68Texture, detail63Texture, dirtyTexture,
						detail04Texture, detail29Texture, detail55Texture, detail35TTexture,
						brickWallShader, grassShader, roadShader, road2Shader, paveDirtyShader,
						paveStretchShader, barkShader, rockShader, mudShader,
						concreteShader, sandShader
					}


	for _,part in ipairs(effectParts) do
		bAllValid = part and bAllValid
	end

	bEffectEnabled = true

	if not bAllValid then
		outputChatBox( "dl_shader_detail: Could not create some things.", 255, 0, 0 )
		disableDetail()
	else
		outputDebugString( "dl_shader_detail: is using technique " .. tec )

		engineApplyShaderToWorldTexture ( roadShader, "*road*" )
		engineApplyShaderToWorldTexture ( roadShader, "*tar*" )
		engineRemoveShaderFromWorldTexture ( roadShader, "coronastar" )
		engineApplyShaderToWorldTexture ( roadShader, "*asphalt*" )
		engineApplyShaderToWorldTexture ( roadShader, "*freeway*" )
		engineApplyShaderToWorldTexture ( concreteShader, "*wall*" )
		engineApplyShaderToWorldTexture ( concreteShader, "*floor*" )
		engineApplyShaderToWorldTexture ( concreteShader, "*bridge*" )
		engineApplyShaderToWorldTexture ( concreteShader, "*conc*" )
		engineApplyShaderToWorldTexture ( concreteShader, "*drain*" )
		engineApplyShaderToWorldTexture ( paveDirtyShader, "*walk*" )
		engineApplyShaderToWorldTexture ( paveDirtyShader, "*pave*" )
		engineApplyShaderToWorldTexture ( paveDirtyShader, "*cross*" )

		engineApplyShaderToWorldTexture ( mudShader, "*mud*" )
		engineApplyShaderToWorldTexture ( mudShader, "*dirt*" )
		engineApplyShaderToWorldTexture ( rockShader, "*rock*" )
		engineApplyShaderToWorldTexture ( rockShader, "*stone*" )
		engineApplyShaderToWorldTexture ( grassShader, "*grass*" )
		engineApplyShaderToWorldTexture ( grassShader, "desertgryard256" )	-- grass

		engineApplyShaderToWorldTexture ( sandShader, "*sand*" )
		engineApplyShaderToWorldTexture ( barkShader, "*leave*" )
		engineApplyShaderToWorldTexture ( barkShader, "*log*" )
		engineApplyShaderToWorldTexture ( barkShader, "*bark*" )

		-- Roads
		engineApplyShaderToWorldTexture ( roadShader, "*carpark*" )
		engineApplyShaderToWorldTexture ( road2Shader, "*hiway*" )
		engineApplyShaderToWorldTexture ( roadShader, "*junction*" )
		engineApplyShaderToWorldTexture ( paveStretchShader, "snpedtest*" )

		-- Pavement
		engineApplyShaderToWorldTexture ( paveStretchShader, "sidelatino*" )
		engineApplyShaderToWorldTexture ( paveStretchShader, "sjmhoodlawn41" )

		-- Remove detail from LOD models etc.
		for i,part in ipairs(effectParts) do
			if getElementType(part) == "shader" then
				engineRemoveShaderFromWorldTexture ( part, "tx*" )
				engineRemoveShaderFromWorldTexture ( part, "lod*" )
			end
		end
	end

end

----------------------------------------------------------------
-- disableDetail
----------------------------------------------------------------
function disableDetail()
	if not bEffectEnabled then return end

	-- Destroy all parts
	for _,part in ipairs(effectParts) do
		if part then
			destroyElement( part )
		end
	end
	effectParts = {}
	bAllValid = false

	-- Flag effect as stopped
	bEffectEnabled = false
end


----------------------------------------------------------------
-- All the shaders
----------------------------------------------------------------
function getBrickWallShader()
	return getMakeShader( getBrickWallSettings () )
end

function getGrassShader()
	return getMakeShader( getGrassSettings () )
end

function getRoadShader()
	return getMakeShader( getRoadSettings () )
end

function getRoad2Shader()
	return getMakeShader( getRoad2Settings () )
end

function getPaveDirtyShader()
	return getMakeShader( getPaveDirtySettings () )
end

function getPaveStretchShader()
	return getMakeShader( getPaveStretchSettings () )
end

function getBarkShader()
	return getMakeShader( getBarkSettings () )
end

function getRockShader()
	return getMakeShader( getRockSettings () )
end

function getMudShader()
	return getMakeShader( getMudSettings () )
end

function getMakeShader(v)
	--  Create shader with a draw range of 100 units
	local shader, tec = nil, nil
	if renderTarget.isOn then
		shader,tec = dxCreateShader ( "fx/detail_dl.fx", 2, 0 )
	else
		shader,tec = dxCreateShader ( "fx/detail.fx", 1, 100 )	
	end

	if shader then
		dxSetShaderValue( shader, "sDetailTexture", v.texture )
		dxSetShaderValue( shader, "sDetailScale", v.detailScale )
		dxSetShaderValue( shader, "sFadeStart", v.sFadeStart )
		dxSetShaderValue( shader, "sFadeEnd", v.sFadeEnd )
		dxSetShaderValue( shader, "sStrength", v.sStrength )
		dxSetShaderValue( shader, "sAnisotropy", v.sAnisotropy )
		if renderTarget.isOn then
			dxSetShaderValue( shader, "sHalfPixel", 1/(scx * 2), 1/(scy * 2) )
			dxSetShaderValue( shader, "ColorRT", renderTarget.RTColor )
			dxSetShaderValue( shader, "NormalRT", renderTarget.RTNormal )
		end
	end
	return shader,tec
end


-- brick wall type thing
---------------------------------
function getBrickWallSettings ()
	local v = {}
	v.texture=detail22Texture
	v.detailScale=3
	v.sFadeStart=60
	v.sFadeEnd=math.min(100, renderTarget.distFade[1])
	v.sStrength=0.6
	v.sAnisotropy=1
	return v
end
---------------------------------

-- grass
---------------------------------
function getGrassSettings ()
	local v = {}
	v.texture=detail58Texture
	v.detailScale=2
	v.sFadeStart=60
	v.sFadeEnd=math.min(100, renderTarget.distFade[1])
	v.sStrength=0.6
	v.sAnisotropy=1
	return v
end
---------------------------------

-- road
---------------------------------
function getRoadSettings ()
	local v = {}
	v.texture=detail68Texture
	v.detailScale=1
	v.sFadeStart=60
	v.sFadeEnd=math.min(100, renderTarget.distFade[1])
	v.sStrength=0.6
	v.sAnisotropy=1
	return v
end
---------------------------------

-- road2
---------------------------------
function getRoad2Settings ()
	local v = {}
	v.texture=detail63Texture
	v.detailScale=1
	v.sFadeStart=math.min(90, renderTarget.distFade[2])
	v.sFadeEnd=math.min(100, renderTarget.distFade[1])
	v.sStrength=0.7
	v.sAnisotropy=0.9
	return v
end
---------------------------------

-- dirty pave
---------------------------------
function getPaveDirtySettings ()
	local v = {}
	v.texture=dirtyTexture
	v.detailScale=1
	v.sFadeStart=math.min(60, renderTarget.distFade[2])
	v.sFadeEnd=math.min(100, renderTarget.distFade[1])
	v.sStrength=0.4
	v.sAnisotropy=1
	return v
end
---------------------------------

-- stretch pave 
---------------------------------
function getPaveStretchSettings ()
	local v = {}
	v.texture=detail04Texture
	v.detailScale=1
	v.sFadeStart=math.min(80, renderTarget.distFade[2])
	v.sFadeEnd=math.min(100, renderTarget.distFade[1])
	v.sStrength=0.3
	v.sAnisotropy=1
	return v
end
---------------------------------

-- tree bark
---------------------------------
function getBarkSettings ()
	local v = {}
	v.texture=detail29Texture
	v.detailScale=1
	v.sFadeStart=math.min(80, renderTarget.distFade[2])
	v.sFadeEnd=math.min(100, renderTarget.distFade[1])
	v.sStrength=0.6
	v.sAnisotropy=1
	return v
end
---------------------------------

-- rock
---------------------------------
function getRockSettings ()
	local v = {}
	v.texture=detail55Texture
	v.detailScale=1
	v.sFadeStart=math.min(80, renderTarget.distFade[2])
	v.sFadeEnd=math.min(100, renderTarget.distFade[1])
	v.sStrength=0.5
	v.sAnisotropy=1
	return v
end
---------------------------------

-- mud
---------------------------------
function getMudSettings ()
	local v = {}
	v.texture=detail35TTexture
	v.detailScale=2
	v.sFadeStart=math.min(80, renderTarget.distFade[2])
	v.sFadeEnd=math.min(100, renderTarget.distFade[1])
	v.sStrength=0.6
	v.sAnisotropy=1
	return v
end

----------------------------------------------------------------------------------------------------------------------------
-- onClientResourceStart/Stop
----------------------------------------------------------------------------------------------------------------------------
addEventHandler ( "onClientResourceStart", root, function(startedRes)
	switchDREffect(getResourceName(startedRes), true)
end
)

addEventHandler ( "onClientResourceStop", root, function(stoppedRes)
	switchDREffect(getResourceName(stoppedRes), false)
end
)

function switchDREffect(resName, isStarted)
	if isStarted then
		if resName == "dl_core" then
			local isCoreOn = getElementData ( localPlayer, "dl_core.on", false )
			if renderTarget.isOn and isCoreOn then return end
			renderTarget.isOn = isCoreOn
			if renderTarget.isOn then
				renderTarget.RTColor, renderTarget.RTNormal = exports.dl_core:getRenderTargets()
			end
			if renderTarget.RTColor and renderTarget.RTNormal then
				if bEffectEnabled then
					disableDetail()
					enableDetail()
				end
				renderTarget.isOn = true
			end
		end	
	else
		if not renderTarget.isOn then return end
		if resName == "dl_core" then
			if bEffectEnabled then
				disableDetail()
				renderTarget.isOn = false
				enableDetail()
			end
		end	
	end
end

addEventHandler ( "onClientResourceStart", resourceRoot, function()
	renderTarget.isOn = getElementData ( localPlayer, "dl_core.on", false )
	if renderTarget.isOn then 
		renderTarget.RTColor, renderTarget.RTNormal = exports.dl_core:getRenderTargets()
		if renderTarget.RTColor and renderTarget.RTNormal then
			renderTarget.isOn = true
		end
	end
	triggerEvent( "onClientSwitchDetail", resourceRoot, true )
end
)

addEvent( "switchDL_core", true )
addEventHandler( "switchDL_core", root, function(isOn) switchDREffect("dl_core", isOn) end)