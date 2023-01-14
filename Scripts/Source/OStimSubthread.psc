ScriptName OStimSubthread extends ReferenceAlias
import outils 

; Subthreads
;
; These are simplified OStim threads, exclusively for running multiple scenes at the same time
; Scenes in a subthread are implied to be unimportant, as such these threads intentionally do not fire any events 
; and only allow limited api interaction with them. This is to keep OStim development simplified, since you only need to 
; worry about the main thread
;
; Because of the above, you should only use these if you are certain multiple scenes need to play.
; NPC on NPC scenes should still usually go in the main thread when possible. Player scenes should never go in a subthread.
;
; Main threads can be transformed into a subthread by calling InheritFromMain()
; Subthreads can be soft-synchronized to the main thread with linktomain(). When the main ends, if linked, the subthread will close too


;todo: beds, redressing

int property id auto
bool property LinkedToMain auto
bool inuse
 
OSexIntegrationMain ostim
ODatabaseScript ODatabase
actor playerref


actor property domactor auto
actor property subactor auto
actor property thirdactor auto
actor[] property actorlist auto
actor aggressiveActor

form[] domclothes
form[] subclothes
form[] thirdclothes

ObjectReference property currentbed Auto
int property currentOID auto
bool property aggressive Auto
string[] currScene

int property currspeed auto 
int property maxSpeed auto
float property timePerSpeed auto 

float property estimatedLength auto

bool Function StartScene(actor dom, actor sub = none, actor third = none, float time = 120.0, ObjectReference bed = none, bool isaggressive = false, actor aggressingActor = none, bool LinkToMain = false)
	if inuse
		Console("Subthread is already in use")
		return false
	endif 

	Console("Starting subthread with ID: " + id)

	inuse = true 

	domactor = dom 
	subactor = sub 
	thirdactor = third

	If (SubActor && AppearsFemale(Dom) && !AppearsFemale(Sub))
		DomActor = Sub
		SubActor = Dom
	EndIf 

	If third
		If AppearsFemale(ThirdActor) && !AppearsFemale(SubActor)
			SubActor = third
			ThirdActor = sub
		EndIf
	EndIf

	actor[] actro = PapyrusUtil.ActorArray(3)
	actro[0] = dom
	actro[1] = sub 
	actro[2] = third


	aggressive = isaggressive
	aggressiveActor = aggressingActor
	currentbed = bed 

	if currentbed
		AlignToBed()
	endif


	actorlist =  PapyrusUtil.removeactor(actro, none)

	ScaleActors()


	string StartingAnimation = GetRandomAnimationForScene()

	CurrScene = OSA.MakeStage()
	OSA.SetActorsStim(currScene, actorlist)
	OSA.SetModule(CurrScene, "0Sex", StartingAnimation, "")
	OSA.StimStart(CurrScene)

	currSpeed = 1 
	maxSpeed = ODatabase.GetMaxSpeed(currentOID)


	

	if LinkToMain
		LinkToMain()
	else 
		timePerSpeed = (time / maxSpeed) + OSANative.RandomFloat(-2.0, 2.0)
		if timePerSpeed < 1
			timePerSpeed = 1
		endif 
	endif 

	estimatedLength = (maxSpeed * timePerSpeed) + 8
	
	Console("Subthread will use time/speed: " + timePerSpeed)
	registerforsingleupdate(timePerSpeed)

	return true

EndFunction

bool Function InheritFromMain()
	inuse = true 

	Console("Moving main thread to subthread with ID: " + id)

	domactor = ostim.GetDomActor() 
	subactor = ostim.GetSubActor()
	thirdactor = ostim.getthirdactor()

	actor[] actro = PapyrusUtil.ActorArray(3)
	actro[0] = domactor
	actro[1] = subactor
	actro[2] = thirdactor

	currentOID = ostim.GetCurrentAnimationOID()
	maxSpeed = ostim.GetCurrentAnimationMaxSpeed()
	currSpeed = ostim.GetCurrentAnimationSpeed()
	currentbed = ostim.GetBed()

	currScene = ostim.GetScene()

	timePerSpeed = (ostim.GetEstimatedTimeUntilEnd() / maxSpeed) + OSANative.RandomFloat(-2.0, 2.0)
	if timePerSpeed < 1
		timePerSpeed = 1
	endif 

	ostim.ForceStop()

	while ostim.AnimationRunning()
		Utility.Wait(0.25)
	endwhile

	estimatedLength = (maxSpeed * timePerSpeed) + 8

	Console("Subthread will use time/speed: " + timePerSpeed)
	registerforsingleupdate(timePerSpeed)

	return true
EndFunction

Function LinkToMain()
	LinkedToMain = true


	registerForOStim()
	float time = ostim.GetEstimatedTimeUntilEnd() + 25
	timePerSpeed = (time / maxSpeed) + OSANative.RandomFloat(-2.0, 2.0)
endfunction 

bool Function IsInUse()
	return inuse
endfunction


Event OnUpdate()

	if !ostim.IsActorActive(domactor)
		Console("Subthread actor was not active. Error?")
		EndAnimation()
		return
	endif 

	if currSpeed >= maxSpeed
		if LinkedToMain && ostim.AnimationRunning()
			
		else
			Orgasm()
			Return
		endif 
		
	else 
		IncreaseAnimationSpeed()
	endif 

	RegisterForSingleUpdate(timePerSpeed)
EndEvent

Function Orgasm()
	SetAnimationSpeed(1)
	Utility.Wait(3)
	DecreaseAnimationSpeed()
	Utility.Wait(5)
	endanimation()
EndFunction

function runOsexCommand(string cmd)
	string[] Plan = new string[2]
	Plan[1] = cmd

	osa.setPlan(currScene, Plan) 
	osa.stimstart(currScene)
EndFunction

Function ScaleActors()
	ScaleToHeight(domactor, 1.03)
	if subactor
		ScaleToHeight(subactor, 1)
		if thirdactor
			ScaleToHeight(thirdactor, 1)
		endif 
	endif 
EndFunction

Function ScaleToHeight(Actor Act, Float GoalBodyScale)
	Float NativeBodyScale = outils.GetOriginalScale(act)
	Float Scale = ((GoalBodyScale - NativeBodyScale) / NativeBodyScale) + 1.0

	;Console(act.GetDisplayName())
	;Console("Native scale: " + NativeBodyScale)

	If (Scale < 1.01)  && (Scale > 0.99) ; there is some floating point imprecision with the above.
		if (math.abs(act.GetScale() - NativeBodyScale)) < 0.01 ; the actor is truly the same size as their original size
			Console("Scale not needed")
			Return ; no need to scale and update ninode
		else 
			; continue on, actor needs a scale reset
			scale = 1.0
		endif 
	EndIf

	Console("Setting scale: " + Scale)

	If Scale < 0.01
		Console("Error: an unknown mod is conflicting with OStim's scaling. OStim will now dump scaling data")
		Console("Name: " + act.GetDisplayName())
		Console("Target scale: " + GoalBodyScale)
		Console("Current scale: " + Act.GetScale())
		Console("Disabling scaling in the MCM will stop this message")
		return 
	EndIf

	Act.SetScale(Scale)
	Act.QueueNiNodeUpdate() ; This will cause actors to reqequip clothes if mid-scene
	Act.SetScale(Scale)
EndFunction

Function SetAnimationSpeed(int to)
	{Increase or decrease the animation speed by the amount}
	string speed = to
	runOsexCommand("$Speed,0," + speed)
	
	currSpeed = to
EndFunction

Function IncreaseAnimationSpeed()
	;If (AnimSpeedAtMax)
	;	Return
	;EndIf
	Console("Increasing subthread speed")
	setanimationspeed(currspeed + 1)
EndFunction

Function DecreaseAnimationSpeed()
	;If (CurrentSpeed < 1)
	;	Return
	;EndIf
	setanimationspeed(currspeed - 1)
EndFunction

Function EndAnimation() ;todo - isloaded check, see osexintegrationmain endanimation()
	Console("Subthread " + id + " ending..." )

	If DomActor.GetParentCell() != playerref.GetParentCell()
		; Attempting to end the scene when the actors are not loaded will fail
		SendModEvent("0SA_GameLoaded")
	else 
		runOsexCommand("$endscene")
	endif 

	UnregisterForUpdate()
	UnregisterForAllModEvents()
	if !ostim.AnimationRunning()
		ODatabase.Unload()
	endif

	SendModEvent("ostim_end", numArg = id)

	inuse = false

EndFunction

Function AlignToBed() ;todo, merge this logic with main?
	Float DomSpeed = CurrentBed.GetDistance(DomActor) * 100
	Float BedOffsetX = 0
	Float BedOffsetY = 0
	Float BedOffsetZ = 0

	Int Offset = 31

	float[] bedCoords = OSANative.GetCoords(CurrentBed)
	bedCoords[0] = bedCoords[0] + BedOffsetX
	bedCoords[1] = bedCoords[1] + BedOffsetY
	bedCoords[2] = bedCoords[2] + BedOffsetZ
	Float BedAngleX = Currentbed.GetAngleX()
	Float BedAngleY = Currentbed.GetAngleY()
	Float BedAngleZ = Currentbed.GetAngleZ()

	DomActor.TranslateTo(bedCoords[0], bedCoords[1], bedCoords[2], BedAngleX, BedAngleY, BedAngleZ, DomSpeed, afMaxRotationSpeed = 100)
	DomActor.SetAngle(BedAngleX, BedAngleY, BedAngleZ)
	Utility.Wait(0.05)

	Float OffsetY = Math.Sin(OUtils.TrigAngleZ(DomActor.GetAngleZ())) * 30
	Float OffsetX = Math.Cos(OUtils.TrigAngleZ(DomActor.GetAngleZ())) * 30

	SubActor.MoveTo(DomActor, OffsetX, OffsetY, 0)
	SubActor.SetAngle(BedAngleX, BedAngleY, BedAngleZ)
EndFunction

string Function GetRandomAnimationForScene() ; todo aggressive stuff
	Int Animations = ODatabase.GetAnimationsWithActorCount(ODatabase.GetDatabaseOArray(), actorlist.Length)
	Animations = ODatabase.GetHubAnimations(Animations, False)
	Animations = ODatabase.GetTransitoryAnimations(Animations, False)

	if currentbed
		int bedanims 

		Int i = 0
		Int max = ODatabase.GetLengthOArray(Animations)
		While (i < max)
			String Pos = ODatabase.getPositionData(ODatabase.GetObjectOArray(Animations, i))

			If (outils.stringcontains(pos, "S"))
				ODatabase.appendObjectOArray(bedanims, ODatabase.GetObjectOArray(Animations, i))
			EndIf

		i += 1
		EndWhile

		Animations = bedanims

	endif 

	currentoid = ODatabase.GetObjectOArray(animations, OSANative.RandomInt(0, ODatabase.GetLengthOArray(Animations) - 1))

	string ret = ODatabase.GetSceneID( currentoid )
	Console("Subthread using scene: " + ret)
	return ret
endfunction



Function registerForOStim()
	RegisterForModEvent("ostim_end", "OstimEnd")
	RegisterForModEvent("ostim_orgasm", "OstimOrgasm")
endfunction


Event OstimEnd(string eventName, string strArg, float numArg, Form sender)
	EndAnimation()
EndEvent

Event OstimOrgasm(string eventName, string strArg, float numArg, Form sender)
	actor orgasmer = ostim.GetMostRecentOrgasmedActor()

	if ostim.EndOnDomOrgasm
		if orgasmer == ostim.getdomactor()
			Orgasm()
		endif
	endif 

	if ostim.EndOnSubOrgasm
		if orgasmer == ostim.getsubactor()
			Orgasm()
		endif
	endif 
endevent





Event OnInit()
	id = GetID()
	ostim = OUtils.GetOStim()
	odatabase = ostim.GetODatabase()
	playerref = game.GetPlayer()
	inuse = false
EndEvent