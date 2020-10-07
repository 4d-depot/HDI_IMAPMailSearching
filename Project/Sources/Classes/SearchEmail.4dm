Class constructor
	
	This:C1470.recent:=False:C215
	This:C1470.unseen:=False:C215
	This:C1470.new:=False:C215
	This:C1470.keyword:=""
	This:C1470.before:=!00-00-00!
	This:C1470.since:=!00-00-00!
	This:C1470.to:=""
	This:C1470.from:=""
	This:C1470.subject:=""
	This:C1470.body:=""
	
	
Function query()->$query : Text
	// Creation of the query to send to the IMAP server
	$query:=$query+This:C1470._recentToString()
	$query:=$query+This:C1470._unseenToString()
	$query:=$query+This:C1470._keywordToString()
	$query:=$query+This:C1470._beforeToString()
	$query:=$query+This:C1470._sinceToString()
	$query:=$query+This:C1470._toToString()
	$query:=$query+This:C1470._fromToString()
	$query:=$query+This:C1470._subjectToString()
	$query:=$query+This:C1470._bodyToString()
	
	
Function _recentToString()->$result : Text
	$result:=Choose:C955(This:C1470.recent; "RECENT "; "")
	
Function _unseenToString()->$result : Text
	$result:=Choose:C955(This:C1470.unseen; "UNSEEN "; "")
	
Function _keywordToString()->$result : Text
	If (This:C1470.keyword#"")
		$result:="KEYWORD \""+This:C1470.keyworld+"\" "
	End if 
	
Function _beforeToString()->$result : Text
	If (This:C1470.before#!00-00-00!)
		$result:="BEFORE \""+This:C1470._formatDate(This:C1470.before)+"\" "
	End if 
	
Function _sinceToString()->$result : Text
	If (This:C1470.since#!00-00-00!)
		$result:="SINCE \""+This:C1470._formatDate(This:C1470.since)+"\" "
	End if 
	
Function _toToString()->$result : Text
	If (This:C1470.to#"")
		$result:="TO \""+This:C1470.to+"\" "
	End if 
	
Function _fromToString()->$result : Text
	If (This:C1470.from#"")
		$result:="FROM \""+This:C1470.from+"\" "
	End if 
	
Function _subjectToString()->$result : Text
	If (This:C1470.subject#"")
		$result:="SUBJECT \""+This:C1470.subject+"\" "
	End if 
	
Function _bodyToString()->$result : Text
	If (This:C1470.body#"")
		$result:="BODY \""+This:C1470.body+"\" "
	End if 
	
Function _formatDate($date : Date)->$result : Text
	var $day; $month; $year : Integer
	ARRAY TEXT:C222($monthAbr; 12)
	$monthAbr{1}:="Jan"
	$monthAbr{2}:="Feb"
	$monthAbr{3}:="Mar"
	$monthAbr{4}:="Apr"
	$monthAbr{5}:="May"
	$monthAbr{6}:="Jun"
	$monthAbr{7}:="Jul"
	$monthAbr{8}:="Aug"
	$monthAbr{9}:="Sep"
	$monthAbr{10}:="Oct"
	$monthAbr{11}:="Nov"
	$monthAbr{12}:="Dec"
	
	$day:=Day of:C23($date)
	$month:=Month of:C24($date)
	$year:=Year of:C25($date)
	
	$result:=String:C10($day)+"-"+$monthAbr{$month}+"-"+String:C10($year)
	
	
	
	
	
	
	
	
	