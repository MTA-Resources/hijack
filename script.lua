createVehicle (477, 2484, -1668, 14)

function enterVehicle (thePlayer, seat, jacked )
	local myMarker = createMarker(2443,-1647,12,"cylinder",3)
	function deliveryCar (hitElement, matchingDimension) 
		destroyElement(hitElement)
		givePlayerMoney (thePlayer, 22385)
		outputChatBox("Você entregou o veículo roubado!")
		destroyElement(myMarker)
	end
  addEventHandler( "onMarkerHit", myMarker, deliveryCar )
end
addEventHandler ( "onVehicleEnter", getRootElement(), enterVehicle )

