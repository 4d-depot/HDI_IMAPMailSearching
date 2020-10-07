//%attributes = {}
Form:C1466.mailDisplay:=cs:C1710.MailDisplay.new()
Form:C1466.mail:=Null:C1517

Form:C1466.trace:=False:C215

Form:C1466.IMAP:=cs:C1710.Transporter.new()

//Form.IMAP.logFile:="IMAP.log"

OBJECT SET FONT:C164(*; "Password"; "%password")
OBJECT SET FONT:C164(*; "Password2"; "%password")

Form:C1466.numberMails:=10

Form:C1466.loadEmails:=0

ARRAY TEXT:C222(Attachments; 0)

ShowBoxInfo(False:C215)
