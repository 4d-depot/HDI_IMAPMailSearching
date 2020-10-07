Class constructor
	var $1 : Object
	var $2 : Integer
	var $3 : Object
	
	This:C1470._transporter:=$1
	This:C1470._numberMails:=$2
	This:C1470._selectedBox:=$3
	This:C1470.mails:=Null:C1517
	
Function startTimer
	// Show the download message
	OBJECT SET VISIBLE:C603(*; "Download"; True:C214)
	
	// Set the timer to 1 to show the download message and start the receiving just after
	SET TIMER:C645(1)
	
	// Start receiving of the mail list according to the number of mail defined by Form.numberMails
Function startDownload($query : Text)
	// Stop the timer
	SET TIMER:C645(0)
	
	// Fills the mails collection with the list of the last "numberMails" emails received
	// Fills the list of attachements and the body if necessary of the first email of the list
	// Creation of the mail lists. They contain just the mail headers
	This:C1470._receiveMails($query)
	
	
	// Receives the number of last mails asked by the user
Function _receiveMails($query : Text)
	
	var $min; $i : Integer
	var $mails : Collection
	var $foundIds : Collection
	
	// Search the list of emails and the information for each emails
	This:C1470.mails:=New collection:C1472
	If (This:C1470._selectedBox.mailCount>0)
		
		// calculation of the position of the first email to download
		$min:=This:C1470._selectedBox.mailCount-This:C1470._numberMails
		
		If ($query="")
			// Download of the last emails
			$mails:=This:C1470._transporter.getMails($min; This:C1470._selectedBox.mailCount; New object:C1471("withBody"; False:C215; "updateSeen"; False:C215)).list
			
		Else 
			// search email according to the query
			$foundIds:=This:C1470._transporter.searchMails($query).reverse()
			// download found emails
			$mails:=This:C1470._transporter.getMails($foundIds.slice(0; This:C1470._numberMails); New object:C1471("withBody"; False:C215; "updateSeen"; False:C215)).list
		End if 
		This:C1470.mails:=$mails.reverse()
		
	End if 
	
	// download the full email
Function downloadMail($mail : Object)
	
	var $mailTmp : Object
	
	// if the email has no body yet, we download it
	If ($mail.bodyValues=Null:C1517)
		$mailTmp:=This:C1470._transporter.getMail($mail.id; New object:C1471("updateSeen"; False:C215))
		// update of the mail object with the body information and attachments
		$mail.bodyValues:=$mailTmp.bodyValues
		$mail.bodyStructure:=$mailTmp.bodyStructure
		$mail.attachments:=$mailTmp.attachments
	End if 
	
	
	
	
	