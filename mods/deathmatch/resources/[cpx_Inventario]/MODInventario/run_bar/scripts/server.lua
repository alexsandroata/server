local func = {}; -- armazenar funções

function createRunBar( player, timer, size, handlerFunction )

    if player and tonumber( timer ) and tonumber( size ) and type( handlerFunction ) == 'function' then

        triggerClientEvent( player, '[Parker]infobox', player, 'run_bar', timer, size )
		setPedAnimation(player, "INT_HOUSE", "wash_up", 1000, false, true, false, false, _, _)

        func[player] = handlerFunction;

    end
end

addEvent( '[Parker]exec_bar', true )
addEventHandler( '[Parker]exec_bar', root,
    function( )
        if func[source] then
            func[source]( )
        end
    end
)

function userBarInAbas( player, func )
	if player and func then
		createRunBar( player, 3, 25,
			function( )
				createRunBar( player, 2, 20,
					function( )
						createRunBar( player, 1.5, 15,
							function( )
								createRunBar( player, 1, 15, func( ) )
							end
						)
					end
				)
			end
		)
	end
end