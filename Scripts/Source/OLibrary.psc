;/* OLibrary
* * a collection of native functions referring to the scene library
* * 
* * bed scenes are not considered furniture scenes, those are regular scenes that happen to play on a bed
* * furniture scenes are scenes that can play animations exclusive to certain furniture objects, like sitting on a chair
* *
* * all functions taking lists of parameters have two versions:
* * the regular version takes an array (for example ["tag1", "tag2", "tag3"])
* * the CSV version takes a csv-string, CSV stands for comma separated value (for example "tag1,tag2,tag3")
* *
* * some functions need to take lists of lists and therefore only have CSV versions
* * to separate lists use semicoli (for example "tag1,tag2,tag3;tag3,tag4")
* *
* * since scene conditions need to be checked against individual actors those have to be passed as an array still
*/;
ScriptName OLibrary

string Function GetRandomScene(Actor[] Actors) Global Native

string Function GetRandomFurnitureScene(Actor[] Actors, string FurnitureType) Global Native


string Function GetRandomSceneWithTag(Actor[] Actors, string Tag) Global Native

string Function GetRandomSceneWithAnyTag(Actor[] Actors, string[] Tags) Global Native

string Function GetRandomSceneWithAnyTagCSV(Actor[] Actors, string Tags) Global Native

string Function GetRandomSceneWithAllTags(Actor[] Actors, string[] Tags) Global Native

string Function GetRnadomSceneWithAllTagsCSV(Actor[] Actors, string Tags) Global Native


string Function GetRandomFurnitureSceneWithTag(Actor[] Actors, string FurnitureType, string Tag) Global Native

string Function GetRandomFurnitureSceneWithAnyTag(Actor[] Actors, string FurnitureType, string[] Tags) Global Native

string Function GetRandomFurnitureSceneWithAnyTagCSV(Actor[] Actors, string FurnitureType, string Tags) Global Native

string Function GetRandomFurnitureSceneWithAllTags(Actor[] Actors, string FurnitureType, string[] Tags) Global Native

string Function GetRandomFurnitureSceneWithAllTagsCSV(Actor[] Actors, string FurnitureType, string[] Tags) Global Native


string Function GetRandomSceneWithSingleActorTag(Actor[] Actors, int Position, string Tag) Global Native

string Function GetRandomSceneWithAnySingleActorTag(Actor[] Actors, int Position, string[] Tags) Global Native

string Function GetRandomSceneWithAnySingleActorTagCSV(Actor[] Actors, int Position, string Tags) Global Native

string Function GetRandomSceneWithAllSingleActorTags(Actor[] Actors, int Position, string[] Tags) Global Native

string Function GetRandomSceneWithAllSingleActorTagsCSV(Actor[] Actors, int Position, string Tags) Global Native


string Function GetRandomFurnitureSceneWithSingleActorTag(Actor[] Actors, string FurnitureType, int Position, string Tag) Global Native

string Function GetRandomFurnitureSceneWithAnySingleActorTag(Actor[] Actors, string FurnitureType, int Position, string[] Tags) Global Native

string Function GetRandomFurnitureSceneWithAnySingleActorTagCSV(Actor[] Actors, string FurnitureType, int Position, string Tags) Global Native

string Function GetRandomFurnitureSceneWithAllSingleActorTags(Actor[] Actors, string FurnitureType, int Position, string[] Tags) Global Native

string Function GetRandomFurnitureSceneWithAllSingleActorTagsCSV(Actor[] Actors, string FurnitureType, int Position, string Tags) Global Native


string Function GetRandomSceneWithMultiActorTagForAny(Actor[] Actors, string[] Tags) Global Native

string Function GetRandomSceneWithMultiActorTagForAnyCSV(Actor[] Actors, string Tags) Global Native

string Function GetRandomSceneWithMultiActorTagForAll(Actor[] Actors, string[] Tags) Global Native

string Function GetRandomSceneWithMultiActorTagForAllCSV(Actor[] Actors, string Tags) Global Native

string Function GetRandomSceneWithAnyMultiActorTagForAnyCSV(Actor[] Actors, string Tags) Global Native

string Function GetRandomSceneWithAnyMultiActorTagForAllCSV(Actor[] Actors, string Tags) Global Native

string Function GetRandomSceneWithAllMultiActorTagsForAnyCSV(Actor[] Actors, string Tags) Global Native

string Function GetRandomSceneWithAllMultiActorTagsForAllCSV(Actor[] Actors, string Tags) Global Native


string Function GetRandomFurnitureSceneWithMultiActorTagForAny(Actor[] Actors, string FurnitureType, string[] Tags) Global Native

string Function GetRandomFurnitureSceneWithMultiActorTagForAnyCSV(Actor[] Actors, string FurnitureType, string Tags) Global Native

string Function GetRandomFurnitureSceneWithMultiActorTagForAll(Actor[] Actors, string FurnitureType, string[] Tags) Global Native

string Function GetRandomFurnitureSceneWithMultiActorTagForAlLCSV(Actor[] Actors, string FurnitureType, string Tags) Global Native

string Function GetRandomFurnitureSceneWithAnyMultiActorTagForAnyCSV(Actor[] Actors, string FurnitureType, string Tags) Global Native

string Function GetRandomFurnitureSceneWithAnyMultiActorTagForAllCSV(Actor[] Actors, string FurnitureType, string Tags) Global Native

string Function GetRandomFurnitureSceneWithAllMultiActorTagsForAnyCSV(Actor[] Actors, string FurnitureType, string Tags) Global Native

string Function GetRandomFurnitureSceneWithAllMultiActorTagsForAllCSV(Actor[] Actors, string FurnitureType, string Tags) Global Native


string Function GetRandomSceneWithAction(Actor[] Actors, string Type) Global Native

string Function GetRandomSceneWithAnyAction(Actor[] Actors, string[] Types) Global Native

string Function GetRandomSceneWithAnyActionCSV(Actor[] Actors, string Types) Global Native

string Function GetRandomSceneWithAllActions(Actor[] Actors, string[] Types) Global Native

string Function GetRandomSceneWithAllActionsCSV(Actor[] Actors, string Types) Global Native


string Function GetRandomFurnitureSceneWithAction(Actor[] Actors, string FurnitureType, string Type) Global Native

string Function GetRandomFurnitureSceneWithAnyAction(Actor[] Actors, string FurnitureType, string[] Types) Global Native

string Function GetRandomFurnitureSceneWithAnyActionCSV(Actor[] Actors, string FurnitureType, string Types) Global Native

string Function GetRandomFurnitureSceneWithAllActions(Actor[] Actors, string FurnitureType, string[] Types) Global Native

string Function GetRandomFurnitureSceneWithAllActionsCSV(Actor[] Actors, string FurnitureType, string Types) Global Native


string Function GetRandomSceneWithActionForActor(Actor[] Actors, int Position, string Type) Global Native

string Function GetRandomSceneWithAnyActionForActor(Actor[] Actors, int Position, string[] Types) Global Native

string Function GetRandomSceneWithAnyActionForActorCSV(Actor[] Actors, int Position, string Types) Global Native

string Function GetRandomSceneWithAllActionsForActor(Actor[] Actors, int Position, string[] Types) Global Native

string Function GetRandomSceneWithAllActionsForActorCSV(Actor[] Actors, int Position, string Types) Global Native


string Function GetRandomFurnitureSceneWithActionForActor(Actor[] Actors, string FurnitureType, int Position, string Type) Global Native

string Function GetRandomFurnitureSceneWithAnyActionForActor(Actor[] Actors, string FurnitureType, int Position, string[] Types) Global Native

string Function GetRandomFurnitureSceneWithAnyActionForActorCSV(Actor[] Actors, string FurnitureType, int Position, string Types) Global Native

string Function GetRandomFurnitureSceneWithAllActionsForActor(Actor[] Actors, string FurnitureType, int Position, string[] Types) Global Native

string Function GetRandomFurnitureSceneWithAllActionsForActorCSV(Actor[] Actors, string FurnitureType, int Position, string Types) Global Native


string Function GetRandomSceneWithActionForTarget(Actor[] Actors, int Position, string Type) Global Native

string Function GetRandomSceneWithAnyActionForTarget(Actor[] Actors, int Position, string[] Types) Global Native

string Function GetRandomSceneWithAnyActionForTargetCSV(Actor[] Actors, int Position, string Types) Global Native

string Function GetRandomSceneWithAllActionsForTarget(Actor[] Actors, int Position, string[] Types) Global Native

string Function GetRandomSceneWithAllActionsForTargetCSV(Actor[] Actors, int Position, string Types) Global Native


string Function GetRandomFurnitureSceneWithActionForTarget(Actor[] Actors, string FurnitureType, int Position, string Type) Global Native

string Function GetRandomFurnitureSceneWithAnyActionForTarget(Actor[] Actors, string FurnitureType, int Position, string[] Types) Global Native

string Function GetRandomFurnitureSceneWithAnyActionForTargetCSV(Actor[] Actors, string FurnitureType, int Position, string Types) Global Native

string Function GetRandomFurnitureSceneWithAllActionsForTarget(Actor[] Actors, string FurnitureType, int Position, string[] Types) Global Native

string Function GetRandomFurnitureSceneWithAllActionsForTargetCSV(Actor[] Actors, string FurnitureType, int Position, string Types) Global Native


;/* GetRandomSceneSuperloadCSV
* * gets a random scene matching the given conditions
* * parameters given as "" will be ignored for condition checks
* *
* * @param: Actors, an array of actors to check scene conditions on
* * @param: FurnitureType, the furniture type of the scene, "" means it's a no-furniture-scene
* * @param: AnySceneTag, a csv-string of tags, the scene needs to have at least one of these
* * @param: AllSceneTags, a csv-string of tags, the scene needs to have all of these
* * @param: AnyActorTagForAny, a csv-string of lists of tags, at least one actor needs to have at least one tag of their respective list
* * @param: AnyActorTagForAll, a csv-string of lists of tags, all actors need to have at least one tag of their respective list
* * @param: AllActorTagsForAny, a csv-string of lists of tags, at least one actor needs to have all tags of their respective list
* * @param: AllActorTagsForAll, a csv-string of lists of tags, all actors need to have all tags of their respective list
* * @param: AnyActionType, a csv-string of action types, the scene needs to have at least one of these
* * @param: AnyActionActor, a csv-string of lists of indices, the actor of AnyActionType needs to be in their respective list
* * @param: AnyActionTarget, a csv-string of lists of indices, the target of AnyActionType needs to be in their respective list
* * @param: AnyActionPerformer, a csv-string of lists of indices, the performer of AnyActionType needs to be in their respective list
* * @param: AnyActionMateAny, a csv-string of lists of indices, a mate of AnyActionType needs to be in their respective list
* * @param: AnyActionMateAll, a csv-string of lists of indices, all mates of AnyActionType need to be in their respective list
* * @param: AnyActionParticipantAny, a csv-string of lists of indices, a participant of AnyActionType needs to be in their respective list
* * @param: AnyActionParticipantAll, a csv-string of lists of indices, all participants of AnyActionType need to be in their respective list
* * @param: AllActionTypes, a csv-string of action types, the scene needs to have all of these
* * @param: AllActionActors, a csv-string of lists of indices, the actors of AllActionTypes need to be in their respective list
* * @param: AllActionTargets, a csv-string of lists of indices, the targets of AllActionTypes need to be in their respective list
* * @param: AllActionPerformers, a csv-string of lists of indices, the performers of AllActionTypes need to be in their respective list
* * @param: AllActionMatesAny, a csv-string of lists of indices, AllActionTypes need to have at least one mate in all of the respective lists
* * @param: AllActionMatesAll, a csv-string of lists of indices, AllActionTypes need to have all mates in all of the respective lists
* * @param: AllActionParticipantsAny, a csv-string of lists of indices, AllActionTypes need to have at least one participant in all of the respective lists
* * @param: AllActionParticipantsAll, a csv-string of lists of indices, AllActionTypes need to have all mates in all of the respective lists
*/;
string Function GetRandomSceneSuperloadCSV(Actor[] Actors, string FurnitureType = "", string AnySceneTag = "", string AllSceneTags = "", string AnyActorTagForAny = "", string AnyActorTagForAll = "", string AllActorTagsForAny = "", string AllActorTagsForAll = "", string AnyActionType = "", string AnyActionActor = "", string AnyActionTarget = "", string AnyActionPerformer = "", string AnyActionMatesAny = "", string AnyActionMatesAll = "", string AnyActionParticipantAny = "", string AnyActionParticipantAll = "", string AllActionTypes = "", string AllActionActors = "", string AllActionTargets = "", string AllActionPerformers = "", string AllActionMatesAny = "", string AllActionMatesAll = "", string AllActionParticipantsAny = "", string AllActionParticipantsAll = "") Global Native