//%attributes = {}

// start the downoad of the emails
Form:C1466.receiveMails:=cs:C1710.EmailDownloading.new(Form:C1466.IMAP.transporter; Form:C1466.numberMails; Form:C1466.IMAP.selectedBox)
Form:C1466.receiveMails.startTimer()
