Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		InitInfo
		
		Init
		
	: (FORM Event:C1606.code=On Page Change:K2:54)
		
		If (FORM Get current page:C276=3)
			
			If ((Form:C1466.mails=Null:C1517) & (Form:C1466.IMAP.transporter#Null:C1517))
				Form:C1466.IMAP.selectBox("INBOX")
				Form:C1466.receiveMails:=cs:C1710.EmailDownloading.new(Form:C1466.IMAP.transporter; Form:C1466.numberMails; Form:C1466.IMAP.selectedBox)
				Form:C1466.receiveMails.startTimer()
				Form:C1466.search:=cs:C1710.SearchEmail.new()
			End if 
			
		End if 
		
	: (Form event code:C388=On Timer:K2:25)
		If (Form:C1466.trace)
			TRACE:C157
		End if 
		
		Form:C1466.receiveMails.startDownload(Form:C1466.search.query())
		
		// Filled the list of attachements and the body if necessary of the first email of the list
		If (Form:C1466.receiveMails.mails.length>0)
			Form:C1466.mail:=Form:C1466.receiveMails.mails[0]
			// download the full mail to display the body
			Form:C1466.receiveMails.downloadMail(Form:C1466.mail)
		Else 
			Form:C1466.mail:=Null:C1517
		End if 
		
		// creation of the attachment list
		DisplayAttachments(Form:C1466.mailDisplay.attachments(Form:C1466.mail))
		LISTBOX SELECT ROW:C912(*; "List Box"; 1)
		// Display the text of html body
		ShowBody(Form:C1466.mailDisplay.body(Form:C1466.mail))
		
		OBJECT SET VISIBLE:C603(*; "Download"; False:C215)
		
End case 

