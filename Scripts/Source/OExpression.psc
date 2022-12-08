;/* OExpression
* * bunch of global functions for expressions
* * meant for internal use and not to be called by addons
* * might still document it at some point... maybe..
*/;
ScriptName OExpression

Function BlendMo(Actor Act, Int Goal, Int Cur, Int Mode, Int Speed, float Delay) Global
	If Delay
		Utility.Wait(Delay)
	EndIf

    Goal = PapyrusUtil.ClampInt(Goal, 0, 100)
    Cur = PapyrusUtil.ClampInt(Cur, 0, 100)
    Speed = PapyrusUtil.SignInt(Goal < Cur, Speed)
    If (Speed != 0)
        While (Cur != Goal)
            Cur += Speed
            If (Speed > 0 && Cur > Goal || Speed < 0 && Cur < Goal)
                Cur = Goal
            EndIf
            MfgConsoleFunc.SetModifier(Act, Mode, Cur)
        EndWhile
    EndIf
EndFunction

Function BlendPh(Actor Act, Int Goal, Int Cur, Int Mode, Int Speed, float Delay) Global
    If Delay
		Utility.Wait(Delay)
	EndIf

	Goal = PapyrusUtil.ClampInt(Goal, 0, 100)
    Cur = PapyrusUtil.ClampInt(Cur, 0, 100)
    Speed = PapyrusUtil.SignInt(Goal < Cur, Speed)
    If (Speed != 0)
        While (Cur != Goal)
            Cur += Speed
            If (Speed > 0 && Cur > Goal || Speed < 0 && Cur < Goal)
                Cur = Goal
            EndIf
            MfgConsoleFunc.SetPhoneme(Act, Mode, Cur)
        EndWhile
    EndIf
EndFunction