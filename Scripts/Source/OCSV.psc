;/* OCSV
* * collection of csv utility functions
*/;
ScriptName OCSV

; ██╗     ██╗███████╗████████╗███████╗
; ██║     ██║██╔════╝╚══██╔══╝██╔════╝
; ██║     ██║███████╗   ██║   ███████╗
; ██║     ██║╚════██║   ██║   ╚════██║
; ███████╗██║███████║   ██║   ███████║
; ╚══════╝╚═╝╚══════╝   ╚═╝   ╚══════╝

string Function ToCSVList(string[] Values) Global
	Return PapyrusUtil.StringJoin(Values, ",")
EndFunction

string[] Function FromCSVList(string Values) Global
	Return PapyrusUtil.StringSplit(Values, ",")
EndFunction

string Function CreateCSVList(int Size, string Filler) Global
	If Size == 0
		Return ""
	EndIf

	string Ret = Filler
	int i = 1
	While i < Size
		Ret += "," + Filler
		i += 1
	EndWhile

	Return Ret
EndFunction


; ███╗   ███╗ █████╗ ████████╗██████╗ ██╗ ██████╗███████╗███████╗
; ████╗ ████║██╔══██╗╚══██╔══╝██╔══██╗██║██╔════╝██╔════╝██╔════╝
; ██╔████╔██║███████║   ██║   ██████╔╝██║██║     █████╗  ███████╗
; ██║╚██╔╝██║██╔══██║   ██║   ██╔══██╗██║██║     ██╔══╝  ╚════██║
; ██║ ╚═╝ ██║██║  ██║   ██║   ██║  ██║██║╚██████╗███████╗███████║
; ╚═╝     ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝ ╚═════╝╚══════╝╚══════╝

string Function ToCSVMatrix(string[] Values) Global
	Return PapyrusUtil.StringJoin(Values, ";")
EndFunction

string[] Function FromCSVMatrix(string Values) Global
	Return PapyrusUtil.StringSplit(Values, ";")
EndFunction

string Function CreateCSVMatrix(int Size, string Filler) Global
	If Size == 0
		Return ""
	EndIf

	string Ret = Filler
	int i = 1
	While i < Size
		Ret += ";" + Filler
		i += 1
	EndWhile

	Return Ret
EndFunction