ScriptName OActor

float Function PlayExpression(Actor Act, string Expression) Global
	OSexIntegrationMain OStim = OUtils.GetOstim()
	Return OSANative.PlayExpressionEvent(OStim.GetCurrentAnimationSceneID(), OStim.GetActors().Find(Act), Act, Expression)
EndFunction

Function UpdateExpression(Actor Act) Global
	OSexIntegrationMain OStim = OUtils.GetOStim()
	OSANative.UpdateExpression(Ostim.GetCurrentAnimationSceneID(), OStim.GetActors().Find(Act), Act)
EndFunction