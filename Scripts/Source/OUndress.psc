;/* OUndress
* * bunch of papyrus functions that will be invoked if "Use Papyrus Undressing" is checked in the MCM
* * so that other mods can overwrite them if they want to modify undressing behavior
* * by default all undressing is done in C++ and this script is useless
*/;
ScriptName OUndress Extends Quest

;/* AnimateRedress
* * starts an animated redress sequence
* * this is the only function that gets called even when Papyrus Undressing is not enabled in the MCM
* * this function is expected to redress every single item in the Armors and Weapons arrays
* * the armor array has variable size (can even be size 0) and will never contain None entries
* * the weapon array is always of size 3, 0 - main hand, 1 - off hand, 2 - ammo, some (or even all) of these can be None
* * 
* * @param: Act, the actor to perform the animated redress on
* * @param: Armors, the armors that got fully undressed of the actor
* * @param: Weapons, the weapons that got removed from the actor
*/;
Function AnimateRedress(Actor Act, bool IsFemale, Armor[] Armors, Form[] Weapons) Global
	int TotalSlotMask = 0
	int i = Armors.Length
	While i
		i -= 1
		TotalSlotMask = Math.LogicalOr(TotalSlotMask, Armors[i].GetSlotMask())
	EndWhile

	int bodyMask = 0x04C90004
	int footMask = 0x00000080
	int handMask = 0x00000008
	int headMask = 0x02004001

	int animatedMask = Math.LogicalOr(Math.LogicalOr(bodyMask, footMask), Math.LogicalOr(handMask, headMask))

	; TODO: OpenSex 1.18 is going to contain individual redress animations for male and female
	; so when that goes public on the nexus this part will need to get updated
	If Math.LogicalAnd(TotalSlotMask, bodyMask) != 0
		If IsFemale
			PlayRedressAnimation(Act, "redress_torso", 3, 1.5, Armors, bodyMask)
		Else
			PlayRedressAnimation(Act, "redress_torso", 3, 1.5, Armors, bodyMask)
		EndIf
	EndIf

	If Math.LogicalAnd(TotalSlotMask, footMask) != 0
		If IsFemale
			PlayRedressAnimation(Act, "redress_feet", 3, 2.9, Armors, footMask)
		Else
			PlayRedressAnimation(Act, "redress_feet", 3, 2.9, Armors, footMask)
		EndIf
	EndIf

	If Math.LogicalAnd(TotalSlotMask, handMask) != 0
		If IsFemale
			PlayRedressAnimation(Act, "redress_hands", 2, 1.6, Armors, handMask)
		Else
			PlayRedressAnimation(Act, "redress_hands", 2, 1.6, Armors, handMask)
		EndIf
	EndIf

	If Math.LogicalAnd(TotalSlotMask, headMask) != 0
		If IsFemale
			PlayRedressAnimation(Act, "redress_head", 2, 1.9, Armors, headMask)
		Else
			PlayRedressAnimation(Act, "redress_head", 2, 1.9, Armors, headMask)
		EndIf
	EndIf

	i = Armors.Length
	While i
		i -= 1
		If Math.LogicalAnd(Armors[i].GetSlotMask(), animatedMask) == 0
			Act.EquipItemEx(Armors[i])
		EndIf
	EndWhile

	If Weapons[0]
		Act.EquipItemEx(Weapons[0], 1)
	EndIf
	If Weapons[1]
		Act.EquipItemEx(Weapons[1], 2)
	EndIf
	If Weapons[2]
		Act.EquipItemEx(Weapons[2])
	EndIf

	If Act.Is3DLoaded()
		Debug.SendAnimationEvent(Act, "IdleForceDefaultState")
	EndIf
EndFunction

;/* PlayRedressAnimation
* * gets invoked by AnimateRedress to avoid code duplication
*/;
Function PlayRedressAnimation(Actor Act, String Animation, float AnimationLength, float DressPoint, Armor[] Armors, int SlotMask) Global
	Bool Loaded = Act.Is3DLoaded()
	If Act.IsDead() || Act.IsInCombat() || (Act.getparentcell() != Game.GetPlayer().GetParentCell()) || Act.IsInCombat()
		Loaded = False
	EndIf

	If Loaded
		Debug.SendAnimationEvent(Act, Animation)
		Utility.Wait(DressPoint)
	EndIf

	If !Act.IsDead()
		int i = Armors.Length
		While i
			i -= 1
			If Math.LogicalAnd(Armors[i].GetSlotMask(), SlotMask) != 0
				Act.EquipItemEx(Armors[i])
			EndIf
		EndWhile
	EndIf

	If Loaded
		Utility.Wait(AnimationLength - DressPoint)
	EndIf
EndFunction