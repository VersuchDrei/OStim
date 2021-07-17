ScriptName OUtils

OSexIntegrationMain Function GetOStim() Global
	quest q = game.GetFormFromFile(0x000801, "Ostim.esp") as quest
	return (q as OSexIntegrationMain)
EndFunction

Function Console(String In) Global
	MiscUtil.PrintConsole("OStim: " + In)
EndFunction


Function RegisterForOUpdate(form f) Global
	(game.GetFormFromFile(0x000D67, "Ostim.esp") as OStimUpdaterScript).AddFormToDatabase(f)
EndFunction

Function ForceOUpdate() Global
	(game.GetFormFromFile(0x000D67, "OStim.esp") as OStimUpdaterScript).DoUpdate()
EndFunction


function StoreNPCDataFloat(actor npc, string keys, Float num) Global
	StorageUtil.SetFloatValue(npc as form, keys, num)
	;console("Set value " + num + " for key " + keys)
EndFunction

Float function GetNPCDataFloat(actor npc, string keys) Global
	return StorageUtil.GetFloatValue(npc, keys, -1)
EndFunction

function StoreNPCDataInt(actor npc, string keys, int num) Global
	StorageUtil.SetIntValue(npc as form, keys, num)
	;console("Set value " + num + " for key " + keys)
EndFunction

Int function GetNPCDataInt(actor npc, string keys) Global
	return StorageUtil.GetIntValue(npc, keys, -1)
EndFunction

function StoreNPCDataBool(actor npc, string keys, bool value) Global
	int store 
	if value 
		store = 1
	else 
		store = 0
	endif
	StoreNPCDataInt(npc, keys, store)
	;console("Set value " + store + " for key " + keys)
EndFunction

Bool function GetNPCDataBool(actor npc, string keys) Global
	int value = GetNPCDataInt(npc, keys)
	bool ret = (value == 1)
	;console("got value " + value + " for key " + keys)
	return ret
EndFunction

Bool Function IntArrayContainsValue(Int[] Arr, Int Val) Global
	return Arr.Find(Val) != -1
EndFunction

Bool Function StringArrayContainsValue(String[] Arr, String Val) Global
	return ( PapyrusUtil.CountString(Arr, Val) > 0)
EndFunction

bool Function StringContains(string str, string contains) Global
	return (StringUtil.Find(str, contains) != -1)
EndFunction

bool Function IsModLoaded(string ESPFile) Global
	return (Game.GetModByName(ESPFile) != 255)
Endfunction

Function DisplayTextBanner(String Txt) Global
	UI.InvokeString("HUD Menu", "_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.ShowNotification", Txt)
EndFunction


bool Function IsChild(actor act) Global
	; Normally, we can just use act.ischild() to see if an actor is a child.
	; However, some mods unset this flag.
	; Note: OSA will automatically fail start scenes with child actors, so you don't have to use this to filter actors beforehand

	if act.IsChild()
		return true
	else 
		Race ActorRace  = OSANative.GetRace(OSANative.GetLeveledActorBase(act))
		string RaceName = OSANative.GetName(act) + MiscUtil.GetRaceEditorID(ActorRace)
		return StringContains(RaceName, "Child")
	endif
EndFunction 



Actor[] Function BaseArrToActorArr(ActorBase[] base) Global
	int l = base.Length
	int i = 0

	Actor[] ret = PapyrusUtil.ActorArray(l, filler = none)
	
	while i < l
		ret[i] = OSANative.GetActorFromBase(base[i])

		i += 1
	endwhile

	return ret
EndFunction



; Cached natives
; After running once, the value is cached. Once cached a function will return in less than 1 ms instead of a full frame.
; However, note that the cached data is stored in the skse co-save which is sensitive to bloat. Be cautious about calling these on hundreds of
; NPCs.



; Normally, since this value can change dynamically, we would not want to cache this
; However, there is no way to get the 'original scale' of an actor after it has been changed without calling setscale(1.0) on them first
; (setscale is relative to the original scale while getscale always returns the true value, making it more confusing)
; This serves as a workaround, as long as nobody calls this (the first time) after setscale has been used!
float Function GetScaleCached(actor in) Global
	float cached = StorageUtil.GetFloatValue(in, "ostim_cache_scale",  missing = -2.0)
	if cached != -2
		return cached
	else 
		cached = (in.GetScale())
		StorageUtil.SetFloatValue(in, "ostim_cache_scale",  cached)
		return cached
	endif 
EndFunction

Float Function TrigAngleZ(Float GameAngleZ) Global
	If (GameAngleZ < 90)
		 Return (90 - GameAngleZ)
	EndIf
 	Return (450 - GameAngleZ)
EndFunction

int[] Function BoolArrToIntArr(bool[] arr) Global 
	int l = arr.length
	int[] ret = PapyrusUtil.IntArray(l)
	int i = 0 
	while i < l 
		ret[i] = arr[i] as int

		i += 1
	endwhile

	return ret
EndFunction

Bool Function ChanceRoll(Int Chance) Global ; input 60: 60% of returning true
	return ( (OSANative.RandomInt(0, 99) ) < Chance)
EndFunction