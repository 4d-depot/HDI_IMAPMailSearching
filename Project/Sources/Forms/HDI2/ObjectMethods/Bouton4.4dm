C_OBJECT:C1216($status; $info)

If (String:C10(Form:C1466.IMAP.host)#"")
	// creation of the transporter IMAP object with the information entered in the form
	// Connection check, to verify if  the information intered are OK
	$status:=Form:C1466.IMAP.checkConnection()
	
	
	// Verification if connection check is success or not and display a message
	If ($status.success)
		ShowBoxInfo(True:C214)
		Form:C1466.connectResult:="IMAP information OK"
		
	Else 
		ShowBoxInfo(False:C215)
		ALERT:C41("An error occurred: "+$status.statusText)
		Form:C1466.connectResult:=""
	End if 
End if 