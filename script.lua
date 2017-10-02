local hijack = createVehicle (477, 2484, -1668, 14)
createBlipAttachedTo (hijack, 55)

function enterVehicle (thePlayer, seat, jacked )
	local myMarker = createMarker(2443,-1647,12,"cylinder",3)
	createBlipAttachedTo (myMarker, 51)
	outputChatBox("Entregue o veículo na marca indicada.")
	function deliveryCar (hitElement, matchingDimension) 
		destroyElement(hitElement)
		destroyElement(myMarker)
		givePlayerMoney (thePlayer, 22385)
		outputChatBox("Você entregou o veículo roubado!")
	end
  addEventHandler( "onMarkerHit", myMarker, deliveryCar )
end
addEventHandler ( "onVehicleEnter", hijack, enterVehicle )