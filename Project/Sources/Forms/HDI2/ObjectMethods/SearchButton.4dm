
If (FORM Event:C1606.code=On Clicked:K2:4)
	// display IMAP query 
	Form:C1466.IMAPquery:=Form:C1466.search.query()
	StartReceiving
End if 