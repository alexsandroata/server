local sw, sh = guiGetScreenSize( )
local x, y = ( sw / 1366 ), ( sh / 768 )
local t = parkerz['itens'];
local const = {};
local p = {};
local font1 = dxCreateFont("fontes/RobotoBold.ttf", 9)
local font2 = dxCreateFont("fontes/RobotoBold.ttf", 7)

const.drawRectangle = function( ... )
    local args = {...};
    dxDrawRectangle( x * args[1] + 1, y * args[2] + 1, x * args[3] - 1, y * args[4] - 1, args[5] + 0.5 )

    return { args[1], args[2], args[3], args[4] };
end

const.drawText = function( ... )
    local args = {...};
    dxDrawText( args[7], x * args[1], y * args[2], x * args[3], y * args[4], args[5], x * args[6], font2, 'left', 'center', false, true, false, false )

    return { args[1], args[2], args[3], args[4] }
end

const.DrawImage = function( ... )
    local args = {...};
    dxDrawImage( x * args[1] + 1, y * args[2] + 1, x * args[3] - 1, y * args[4] - 1, args[5] )

    return { args[1], args[2], args[3], args[4] };
end

addEvent( '[Parker]infobox', true )
addEventHandler( '[Parker]infobox', root,
    function( type, ... )
        local args = {...};
        if type == 'run_bar' then
            
            if not p.run_bar then p.run_bar = {};

                p.run_bar['start'] = getTickCount( )
                p.run_bar['timer'] = tonumber( args[1] )
                p.run_bar['size'] = tonumber( args[2] +2 )
                p.run_bar['random'] = math.random( 620, 730 )

                addEventHandler( 'onClientRender', root, const.dxRunBar )

                p.run_bar['timeRender'] = setTimer( 
                    function( )
                        removeEventHandler( 'onClientRender', root, const.dxRunBar )
                        p.run_bar = nil;
                    end,
                p.run_bar['timer'] * 1000, 1 )
            
            end   

        end
    end
)

const.dxRunBar = function( )
    local now = getTickCount( );
    local before = p.run_bar['start'];
    local seconds = ( p.run_bar['timer'] * 1000 );
    local with = interpolateBetween( 0, 0, 0, 285, 0, 0, ( now - before ) / ( ( before + seconds ) - before ), 'Linear' );

    const.DrawImage( 525, 651, 315, 68, "gfx/img/run_bar1.png", 0, 0, 0, tocolor( 255, 255, 255, 255 )
    )

    const.DrawImage( 539, 681, 288, 20, "gfx/img/run_bar3.png", 0, 0, 0, tocolor( 255, 255, 255, 255 )
    )

    p.run_bar['initial'] = const.drawRectangle( p.run_bar['random'], 681, p.run_bar['size'], 20, 
        tocolor( t['run_bar']['color']._stop[1], t['run_bar']['color']._stop[2], t['run_bar']['color']._stop[3], t['run_bar']['color']._stop[4] )
    )
    
    p.run_bar['width'] = const.DrawImage( 539 + with, 600, 1, 25, "gfx/img/run_bar2.png", 0, 0, 0,
        tocolor( t['run_bar']['color']._run[1], t['run_bar']['color']._run[2], t['run_bar']['color']._run[3], t['run_bar']['color']._run[4] )
    )

    const.DrawImage( 539, 681, with, 20, "gfx/img/run_bar2.png", 0, 0, 0,
        tocolor( t['run_bar']['color']._run[1], t['run_bar']['color']._run[2], t['run_bar']['color']._run[3], t['run_bar']['color']._run[4] )
    )

    const.drawText( 615, 687, (290 + 615), (8 + 687), tocolor( 255, 255, 255, 255 ), 1, 'PRESSIONE [E] PARA ABRIR' )
    dxDrawText('NECESSARIO: 3', 538, 660, (290 + 538), (8 + 660), tocolor( 90, 90, 90, 255 ), 1, font2, 'left', 'center', false, true, false, false )

end

addEventHandler( 'onClientKey', root,
    function( button, press )
        if press then
            if button == 'e' and p.run_bar then
                if p.run_bar['width'][1] >= p.run_bar['initial'][1] and p.run_bar['width'][1] <= p.run_bar['initial'][1] + p.run_bar['size'] then
                    
                    if p.run_bar['timeRender'] and isTimer( p.run_bar['timeRender'] ) then killTimer( p.run_bar['timeRender'] ) end

                    triggerServerEvent( '[Parker]exec_bar', localPlayer )
                    removeEventHandler( 'onClientRender', root, const.dxRunBar )
                    
                    p.run_bar = nil;
                
                end
            end
        end
    end
)