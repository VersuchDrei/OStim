ScriptName OUndressScript Extends Quest

Actor PlayerRef

Event AnimatedRedressThread(String EventName, String StrArg, float NumArg, Form Sender)
	Form[] Items
	Actor Target

	;items = PapyrusUtil.
	Bool Female

	Float StartingHealth = Target.GetAV("Health")

	Int i = 0
	While (i < Items.Length)
		If (Items[i])
			Bool Loaded = Target.Is3DLoaded()
			If Target.IsDead() || (Target.GetAV("Health") < StartingHealth) || (Target.getparentcell() != playerref.getparentcell()) || target.IsInCombat()
				Loaded = False
			EndIf

			Armor ArmorPiece = (Items[i] as Armor)
			Int SlotMask = ArmorPiece.GetSlotMask()

			String UndressAnim = ""
			Float AnimLen = 0
			Float DressPoint = 0

			If ArmorPiece.IsCuirass() || ArmorPiece.IsClothingBody()
				If (Female)
					UndressAnim = "redress_torso"
					AnimLen = 3
					DressPoint = 1.5
				Else
					UndressAnim = "redress_torso"
					AnimLen = 3
					DressPoint = 1.5
				EndIf
			ElseIf ArmorPiece.IsBoots() || ArmorPiece.IsClothingFeet()
				If (Female)
					UndressAnim = "redress_feet"
					AnimLen = 3
					DressPoint = 2.9
				Else
					UndressAnim = "redress_feet"
					AnimLen = 3
					DressPoint = 2.9
				EndIf
			ElseIf ArmorPiece.IsHelmet() || ArmorPiece.IsClothingHead()
				If (Female)
					UndressAnim = "redress_head"
					AnimLen = 2
					DressPoint = 1.6
				Else
					UndressAnim = "redress_head"
					AnimLen = 2
					DressPoint = 1.6
				EndIf
			ElseIf ArmorPiece.IsGauntlets() || ArmorPiece.IsClothingHands()
				If (Female)
					UndressAnim = "redress_hands"
					AnimLen = 2
					DressPoint = 1.9
				Else
					UndressAnim = "redress_hands"
					AnimLen = 2
					DressPoint = 1.9
				EndIf
			EndIf

			If (UndressAnim != "" && Loaded)
				Debug.SendAnimationEvent(Target, UndressAnim)
			EndIf
			If (Loaded)
				Utility.Wait(DressPoint)
			EndIf
			If (!Target.IsDead())
				Target.EquipItemEx(items[i], equipSound = False)
			EndIf
			If (Loaded)
				Utility.Wait(AnimLen - DressPoint)
			EndIf
		EndIf
		i += 1
	EndWhile

	Debug.SendAnimationEvent(Target, "IdleForceDefaultState")
EndEvent
