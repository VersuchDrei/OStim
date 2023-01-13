;/* OActor
* * collection of methods to modify scene actors
* * all of these only affect actors that are currently in a scene
* * if you pass them an actor that is not in a scene nothing will happen
*/;
ScriptName OActor

;/* PlayExpression
* * plays the facial expression event on the actor
* * this does not automatically reset the face again, for that you need to call UpdateExpression
* *
* * @param: Act, the actor to play the expression on
* * @param: Expression, the name of the expression event to play
* *
* * @return: the duration defined in the events json file
*/;
float Function PlayExpression(Actor Act, string Expression) Global
	OSexIntegrationMain OStim = OUtils.GetOstim()
	Return OSANative.PlayExpressionEvent(OStim.GetCurrentAnimationSceneID(), OStim.GetActors().Find(Act), Act, Expression)
EndFunction

;/* UpdateExpression
* * resets the factial expression to the underlying expression based on the scenes actions, clearing all event expressions
* *
* * @param: Act, the actor to update the expression for
*/;
Function UpdateExpression(Actor Act) Global
	OSexIntegrationMain OStim = OUtils.GetOStim()
	OSANative.UpdateExpression(Ostim.GetCurrentAnimationSceneID(), OStim.GetActors().Find(Act), Act)
EndFunction

;/* Undress
* * fully undresses the actor
* *
* * @param: Act, the actor to undress
*/;
Function Undress(Actor Act) Global Native

;/* Redress
* * redresses all items that were undressed during the current scene
* * 
* * @param: Act, the actor to redress
*/;
Function Redress(Actor Act) Global Native

;/* UndressPartial
* * undresses all items on the actor that overlap with the given slot mask
* * for slot mask values refer to: https://www.creationkit.com/index.php?title=Slot_Masks_-_Armor
* * 
* * @param: Act, the actor to undress
* * @param: Mask, the slot mask to check the items against
*/;
Function UndressPartial(Actor Act, int Mask) Global Native

;/* RedressPartial
* * redresses all items that were undressed during the current scene and overlap with the given slot mask
* * for slot mask values refer to: https://www.creationkit.com/index.php?title=Slot_Masks_-_Armor
* *
* * @param: Act, the actor to redress
* * @param: Mask, the slot mask to check the items against
*/;
Function RedressPartial(Actor Act, int Mask) Global Native

;/* RemoveWeapons
* * removes the weapons
* *
* * @param: Act, the actor to remove the weapons from
*/;
Function RemoveWeapons(Actor Act) Global Native

;/* AddWeapons
* * adds back the weapons that were removed during the current scene
* *
* * @param: Act, the actor to add the weapons to
*/;
Function AddWeapons(Actor Act) Global Native