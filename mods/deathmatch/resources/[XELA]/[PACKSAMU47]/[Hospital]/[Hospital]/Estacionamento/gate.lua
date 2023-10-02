



m1 = createMarker(2082.23657, -1393.09119, 17.28132 -1, "cylinder", 1.5,255,0,0,0)

descer = createMarker(2039.30151, -1380.93494, 48.31875 -1, "cylinder", 1.5,255,0,0,0)

function tphp(source)
setElementPosition(source, 2036.95764, -1381.23474, 48.31875)
end
addEventHandler("onMarkerHit", m1, tphp)

    
    function baixo(source)
        setElementPosition(source, 2079.34961, -1393.26648, 17.27969)
        end
        addEventHandler("onMarkerHit", descer, baixo)








