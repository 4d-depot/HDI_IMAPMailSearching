Class constructor
	
	This:C1470.host:=""
	This:C1470.port:=993
	This:C1470.user:=""
	This:C1470.password:=""
	This:C1470.acceptUnsecureConnection:=False:C215
	This:C1470.transporter:=Null:C1517
	This:C1470.selectedBox:=Null:C1517
	//This.logFile:="imap.log"
	
	// create a transporter and check the connection elements
Function checkConnection->$status : Object
	
	// creation of the transporter IMAP object with the information entered in the form
	This:C1470.transporter:=IMAP New transporter:C1723(This:C1470)
	
	// Connection check, to verify if  the information entered are OK
	$status:=This:C1470.transporter.checkConnection()
	
	// Select a mailbox according to is name
Function selectBox($name : Text)
	
	If (String:C10($name)="")
		$name:=This:C1470.selectedBox.name
	End if 
	
	This:C1470.selectedBox:=This:C1470.transporter.selectBox($name)