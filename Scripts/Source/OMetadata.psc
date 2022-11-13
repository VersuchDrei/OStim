;/* OMetadata
* * collection of native functions refering to scene metadata
* *
* * all functions taking lists of parameters have two versions:
* * the regular version takes an array (for example ["tag1", "tag2", "tag3"])
* * the CSV version takes a csv-string, CSV stands for comma separated value (for example "tag1,tag2,tag3")
*/;
ScriptName OMetadata


; ████████╗ █████╗  ██████╗ ███████╗
; ╚══██╔══╝██╔══██╗██╔════╝ ██╔════╝
;    ██║   ███████║██║  ███╗███████╗
;    ██║   ██╔══██║██║   ██║╚════██║
;    ██║   ██║  ██║╚██████╔╝███████║
;    ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ╚══════╝

;/* GetTags
* * returns all tags for a scene
* *
* * @param: Id, the id of the scene
* *
* * @return: an array containing all the tags of the scene
*/;
string[] Function GetTags(string Id) Global Native

;/* HasTag
* * checks if a scene has a tag
* *
* * @param: Id, the id of the scene
* * @param: Tag, the tag
* *
* * @return: true if the scene has the tag, otherwise false
*/;
bool Function HasTag(string Id, string Tag) Global Native

;/* HasAnyTag
* * checks if a scene has at least one of a list of tags
* *
* * @param: Id, the id of the scene
* * @param: Tags, an array of tags
* *
* * @return: true if the scene has at least one of the tags, otherwise false
*/;
bool Function HasAnyTag(string Id, string[] Tags) Global Native

;/* HasAnyTagCSV
* * same as HasAnyTag, except tags are passed as a csv-string
* *
* * @param: Id, the id of the scene
* * @param: Tags, a csv-string of tags
* *
* * @return: true if the scene has at least one of the tags, otherwise false
*/;
bool Function HasAnyTagCSV(string Id, string Tags) Global Native

;/* HasAllTags
* * checks if a scene has all of a list of tags
* *
* * @param: Id, the id of the scene
* * @param: Tags, an array with all the tags to check for
* *
* * @return: true if the scene has all the tags, otherwise false
*/;
bool Function HasAllTags(string Id, string[] Tags) Global Native

;/* HasAllTagsCSV
* * same as HasAllTags, except tags are passed as a csv-string
* *
* * @param: Id, the id of the scene
* * @param: Tags, a csv-string of tags
* *
* * @return: true if the scene has all the tags, otherwise false
*/;
bool Function HasAllTagsCSV(string Id, string Tags) Global Native

;/* GetActorTags
* * returns all tags for an actor in a scene
* *
* * @param: Id, the id of the scene
* * @param: Position, the index of the actor in the scene
* *
* * @return: an array containing all the tags for the actor in the scene
*/;
string[] Function GetActorTags(string Id, int Position) Global Native

;/* HasActorTag
* * checks if an actor in a scene has a tag
* *
* * @param: Id, the id of the scene
* * @param: Position, the index of the actor in the scene
* * @param: Tag, the tag
* *
* * @return: true if the actor in the scene has the tag, otherwise false
*/;
bool Function HasActorTag(string Id, int Position, string Tag) Global Native

;/* HasAnyActorTag
* * checks if an actor in a scene has at least one of a list of tags
* *
* * @param: Id, the id of the scene
* * @param: Position, the index of the actor in the scene
* * @param: Tags, an array of tags
* *
* * @return: true if the actor in the scene has at least one of the tags, otherwise false
*/;
bool Function HasAnyActorTag(string Id, int Position, string[] Tags) Global Native

;/* HasAnyActorTagCSV
* * same as HasAnyActorTags, except tags are passed as a csv-string
* *
* * @param: Id, the id of the scene
* * @param: Position, the index of the actor in the scene
* * @param: Tags, a csv-string of tags
* *
* * @return: true if the actor in the scene has at least one of the tags, otherwise false
*/;
bool Function HasAnyActorTagCSV(string Id, int Position, string Tags) Global Native

;/* HasAllActorTags
* * checks if an actor in a scene has all of a list of tags
* *
* * @param: Id, the id of the scene
* * @param: Position, the index of the actor in the scene
* * @param: Tags, an array of tags
* *
* * @return: true if the actor in the scene has all the tags, otherwise false
*/;
bool Function HasAllActorTags(string Id, int Position, string[] Tags) Global Native

;/* HasAllActorTagsCSV
* * same as HasAllActorTags, except tags are passed as a csv-string
* *
* * @param: Id, the id of the scene
* * @param: Position, the index of the actor in the scene
* * @param: Tags, a csv-string of tags
* *
* * @return: true if the actor in the scene has all the tags, otherwise false
*/;
bool Function HasAllActorTagsCSV(string Id, int Position, string Tags) Global Native


;  █████╗  ██████╗████████╗██╗ ██████╗ ███╗   ██╗███████╗
; ██╔══██╗██╔════╝╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
; ███████║██║        ██║   ██║██║   ██║██╔██╗ ██║███████╗
; ██╔══██║██║        ██║   ██║██║   ██║██║╚██╗██║╚════██║
; ██║  ██║╚██████╗   ██║   ██║╚██████╔╝██║ ╚████║███████║
; ╚═╝  ╚═╝ ╚═════╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝

;/* HasAction
* * checks if the scene has at least one action
* *
* * @param: Id, the id of the scene
* *
* * @return: true if the scene contains action, otherwise false
*/;
bool Function HasActions(string Id) Global Native

;/* FindAction
* * returns the first occurance of an action in a scene
* *
* * @param: Id, the id of the scene
* * @param: Type, the action type
* *
* * @return: the index of the first occurance of the action type if it occurs, otherwise -1
*/;
int Function FindAction(string Id, string Type) Global Native

;/* FindAnyAction
* * returns the first occurance of any of a list of actions in a scene
* *
* * @param: Id, the id of the scene
* * @param: Types, an array of action types
* *
* * @return: the index of the first occurance of any of the action types if one occurs, otherwise -1
*/;
int Function FindAnyAction(string Id, string[] Types) Global Native

;/* FindAnyActionCSV
* * same as FindAnyAction, excepts types are passed as a csv-string
* *
* * @param: Id, the id of the scene
* * @param: Types, a csv-string of action types
* *
* * @return: the index of the first occurance of any of the action types if one occurs, otherwise -1
*/;
int Function FindAnyActionCSV(string Id, string Types) Global Native

;/* FindActions
* * returns all occurances of an action in a scene
* *
* * @param: Id, the id of the scene
* * @param: Type, the action type
* * 
* * @return: an array of the indices of all occurances of the action type
*/;
int[] Function FindActions(string Id, string Type) Global Native

;/* FindAllActions
* * returns all occurances of any of a list of actions in a scene
* *
* * @param: Id, the id of the scene
* * @param: Types, an array of action types
* *
* * @return: an array of the indices of all occurances of any of the action types
*/;
int[] Function FindAllActions(string Id, string[] Types) Global Native

;/* FindAllActionsCSV
* * same as FindAllActions, except types are passed as a csv-string
* *
* * @param: Id, the id of the scene
* * @param: Types, a csv-string of action types
* *
* * @return: an array of the indices of all occurances of any of the action types
*/;
int[] Function FindAllActionsCSV(string Id, string Types) Global Native


;  █████╗  ██████╗████████╗██╗ ██████╗ ███╗   ██╗███████╗    ██████╗ ██╗   ██╗     █████╗  ██████╗████████╗ ██████╗ ██████╗ 
; ██╔══██╗██╔════╝╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝    ██╔══██╗╚██╗ ██╔╝    ██╔══██╗██╔════╝╚══██╔══╝██╔═══██╗██╔══██╗
; ███████║██║        ██║   ██║██║   ██║██╔██╗ ██║███████╗    ██████╔╝ ╚████╔╝     ███████║██║        ██║   ██║   ██║██████╔╝
; ██╔══██║██║        ██║   ██║██║   ██║██║╚██╗██║╚════██║    ██╔══██╗  ╚██╔╝      ██╔══██║██║        ██║   ██║   ██║██╔══██╗
; ██║  ██║╚██████╗   ██║   ██║╚██████╔╝██║ ╚████║███████║    ██████╔╝   ██║       ██║  ██║╚██████╗   ██║   ╚██████╔╝██║  ██║
; ╚═╝  ╚═╝ ╚═════╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝    ╚═════╝    ╚═╝       ╚═╝  ╚═╝ ╚═════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝
                                                                                                                          

;/* FindActionForActor
* * returns the first occurance of an action from an actor in a scene
* * 
* * @param: Id, the id of the scene
* * @param: Position, the index of the actor in the scene
* * @param: Type, the action type
* *
* * @return: the index of the first occurance of the action type if it occurs, otherwise -1
*/;
int Function FindActionForActor(string Id, int Position, string Type) Global Native

;/* FindAnyActionForActor
* * returns the first occurance of any of a list of actions from an actor in a scene
* *
* * @param: Id, the id of the scene
* * @param: Position, the index of the actor in the scene
* * @param: Types, an array of action types
* * 
* * @return: the index of the first occurance of any of the action types if one occurs, otherwise -1
*/;
int Function FindAnyActionForActor(string Id, int Position, string[] Types) Global Native

;/* FindAnyActionForActorCSV
* * same es FindAnyActionForActor, except types are passed as a csv-string
* *
* * @param: Id, the id of the scene
* * @param: Position, the index of the actor in the scene
* * @param: Types, a csv-string of action types
* * 
* * @return: the index of the first occurance of any of the action types if one occurs, otherwise -1
*/;
int Function FindAnyActionForActorCSV(string Id, int Position, string Types) Global Native

;/* FindActionsForActor
* * returns all occurances of an action from an actor in a scene
* * 
* * @param: Id, the id of the scene
* * @param: Position, the index of the actor in the scene
* * @param: Type, the action type
* *
* * @return: an array of the indices of all occurances of the action type
*/;
int[] Function FindActionsForActor(string Id, int Position, string Type) Global Native

;/* FindAllActionsForActor
* * returns all occurances of any of a list of actions from an actor in a scene
* *
* * @param: Id, the id of the scene
* * @param: Position, the index of the actor in the scene
* * @param: Types, an array of action types
* * 
* * @return: an array of the indices of all occurances of any of the action types
*/;
int[] Function FindAllActionsForActor(string Id, int Position, string[] Types) Global Native

;/* FindAllActionsForActorCSV
* * same es FindAllActionsForActor, except types are passed as a csv-string
* *
* * @param: Id, the id of the scene
* * @param: Position, the index of the actor in the scene
* * @param: Types, a csv-string of action types
* * 
* * @return: an array of the indices of all occurances of any of the action types
*/;
int[] Function FindAllActionsForActorCSV(string Id, int Position, string Types) Global Native

;/* FindActionForActors
* * returns the first occurance of an action from a list of actors in a scene
* * 
* * @param: Id, the id of the scene
* * @param: Positions, an array of indices of the actors in the scene
* * @param: Type, the action type
* *
* * @return: the index of the first occurance of the action type if it occurs, otherwise -1
*/;
int Function FindActionForActors(string Id, int[] Positions, string Type) Global Native

;/* FindActionForActorsCSV
* * same es FindActionForActors, except positions are passed as a csv-string
* * 
* * @param: Id, the id of the scene
* * @param: Positions, a csv-string of indices of the actors in the scene
* * @param: Type, the action type
* *
* * @return: the index of the first occurance of the action type if it occurs, otherwise -1
*/;
int Function FindActionForActorsCSV(string Id, string Positions, string Type) Global Native

;/* FindAnyActionForActors
* * returns the first occurance of any of a list of actions from a list of actors in a scene
* *
* * @param: Id, the id of the scene
* * @param: Positions, an array of indices of the actors in the scene
* * @param: Types, an array of action types
* * 
* * @return: the index of the first occurance of any of the action types if one occurs, otherwise -1
*/;
int Function FindAnyActionForActors(string Id, int[] Positions, string[] Types) Global Native

;/* FindAnyActionForActorsCSV
* * same es FindAnyActionForActors, except positions and types are passed as a csv-string
* * 
* * @param: Id, the id of the scene
* * @param: Positions, a csv-string of indices of the actors in the scene
* * @param: Types, a csv-string of action types
* *
* * @return: the index of the first occurance of the action type if it occurs, otherwise -1
*/;
int Function FindAnyActionForActorsCSV(string Id, string Positions, string Types) Global Native

;/* FindActionsForActors
* * returns all occurances of an action from a list of actors in a scene
* * 
* * @param: Id, the id of the scene
* * @param: Positions, an array of indices of the actors in the scene
* * @param: Type, the action type
* *
* * @return: an array of the indices of all occurances of the action type
*/;
int[] Function FindActionsForActors(string Id, int[] Positions, string Type) Global Native

;/* FindActionsForActorsCSV
* * same es FindActionsForActors, except positions are passed as a csv-string
* * 
* * @param: Id, the id of the scene
* * @param: Positions, a csv-string of indices of the actors in the scene
* * @param: Type, the action type
* *
* * @return: an array of the indices of all occurances of the action type
*/;
int[] Function FindActionsForActorsCSV(string Id, string Positions, string Type) Global Native

;/* FindAllActionsForActors
* * returns all occurances of any of a list of actions from a list of actors in a scene
* *
* * @param: Id, the id of the scene
* * @param: Positions, an array of indices of the actors in the scene
* * @param: Types, an array of action types
* * 
* * @return: an array of the indices of all occurances of any of the action types
*/;
int[] Function FindAllActionsForActors(string Id, int[] Positions, string[] Types) Global Native

;/* FindAllActionsForActorsCSV
* * same es FindAllActionsForActors, except positions and types are passed as a csv-string
* * 
* * @param: Id, the id of the scene
* * @param: Positions, a csv-string of indices of the actors in the scene
* * @param: Types, a csv-string of action types
* *
* * @return: an array of the indices of all occurances of any of the action types
*/;
int[] Function FindAllActionsForActorsCSV(string Id, string Positions, string Types) Global Native


;  █████╗  ██████╗████████╗██╗ ██████╗ ███╗   ██╗███████╗    ██████╗ ██╗   ██╗    ████████╗ █████╗ ██████╗  ██████╗ ███████╗████████╗
; ██╔══██╗██╔════╝╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝    ██╔══██╗╚██╗ ██╔╝    ╚══██╔══╝██╔══██╗██╔══██╗██╔════╝ ██╔════╝╚══██╔══╝
; ███████║██║        ██║   ██║██║   ██║██╔██╗ ██║███████╗    ██████╔╝ ╚████╔╝        ██║   ███████║██████╔╝██║  ███╗█████╗     ██║   
; ██╔══██║██║        ██║   ██║██║   ██║██║╚██╗██║╚════██║    ██╔══██╗  ╚██╔╝         ██║   ██╔══██║██╔══██╗██║   ██║██╔══╝     ██║   
; ██║  ██║╚██████╗   ██║   ██║╚██████╔╝██║ ╚████║███████║    ██████╔╝   ██║          ██║   ██║  ██║██║  ██║╚██████╔╝███████╗   ██║   
; ╚═╝  ╚═╝ ╚═════╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝    ╚═════╝    ╚═╝          ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝   ╚═╝                                                                                                                                 

;/* FindActionForTarget
* * returns the first occurance of an action from a target in a scene
* * 
* * @param: Id, the id of the scene
* * @param: Position, the index of the target in the scene
* * @param: Type, the action type
* *
* * @return: the index of the first occurance of the action type if it occurs, otherwise -1
*/;
int Function FindActionForTarget(string Id, int Position, string Type) Global Native

;/* FindAnyActionForTarget
* * returns the first occurance of any of a list of actions from a target in a scene
* *
* * @param: Id, the id of the scene
* * @param: Position, the index of the target in the scene
* * @param: Types, an array of action types
* * 
* * @return: the index of the first occurance of any of the action types if one occurs, otherwise -1
*/;
int Function FindAnyActionForTarget(string Id, int Position, string[] Types) Global Native

;/* FindAnyActionForTargetCSV
* * same as FindAnyActionForTarget, except types are passed as a csv-string
* *
* * @param: Id, the id of the scene
* * @param: Position, the index of the target in the scene
* * @param: Types, a csv-string of action types
* * 
* * @return: the index of the first occurance of any of the action types if one occurs, otherwise -1
*/;
int Function FindAnyActionForTargetCSV(string Id, int Position, string Types) Global Native

;/* FindActionsForTarget
* * returns all occurances of an action from a target in a scene
* * 
* * @param: Id, the id of the scene
* * @param: Position, the index of the target in the scene
* * @param: Type, the action type
* *
* * @return: an array of the indices of all occurances of the action type
*/;
int[] Function FindActionsForTarget(string Id, int Position, string Type) Global Native

;/* FindAllActionsForTarget
* * returns all occurances of any of a list of actions from a target in a scene
* *
* * @param: Id, the id of the scene
* * @param: Position, the index of the target in the scene
* * @param: Types, an array of action types
* * 
* * @return: an array of the indices of all occurances of any of the action types
*/;
int[] Function FindAllActionsForTarget(string Id, int Position, string[] Types) Global Native

;/* FindAllActionsForTargetCSV
* * same as FindAllActionsForTarget, except types are passed as a csv-string
* *
* * @param: Id, the id of the scene
* * @param: Position, the index of the target in the scene
* * @param: Types, a csv-string of action types
* * 
* * @return: an array of the indices of all occurances of any of the action types
*/;
int[] Function FindAllActionsForTargetCSV(string Id, int Position, string Types) Global Native

;/* FindActionForTargets
* * returns the first occurance of an action from a list of targets in a scene
* * 
* * @param: Id, the id of the scene
* * @param: Positions, an array of indices of the targets in the scene
* * @param: Type, the action type
* *
* * @return: the index of the first occurance of the action type if it occurs, otherwise -1
*/;
int Function FindActionForTargets(string Id, int[] Positions, string Type) Global Native

;/* FindActionForTargetsCSV
* * same as FindActionForTargets, except positions are passed as a csv-string
* * 
* * @param: Id, the id of the scene
* * @param: Positions, a csv-string of indices of the targets in the scene
* * @param: Type, the action type
* *
* * @return: the index of the first occurance of the action type if it occurs, otherwise -1
*/;
int Function FindActionForTargetsCSV(string Id, string Positions, string Type) Global Native

;/* FindAnyActionForTargets
* * returns the first occurance of any of a list of actions from a list of targets in a scene
* *
* * @param: Id, the id of the scene
* * @param: Positions, an array of indices of the targets in the scene
* * @param: Types, an array of action types
* * 
* * @return: the index of the first occurance of any of the action types if one occurs, otherwise -1
*/;
int Function FindAnyActionForTargets(string Id, int[] Positions, string[] Types) Global Native

;/* FindAnyActionForTargetsCSV
* * same as FindAnyActionForTargets, except positions and types are passed as a csv-string
* *
* * @param: Id, the id of the scene
* * @param: Positions, a csv-string of indices of the targets in the scene
* * @param: Types, a csv-string of action types
* * 
* * @return: the index of the first occurance of any of the action types if one occurs, otherwise -1
*/;
int Function FindAnyActionForTargetsCSV(string Id, string Positions, string Types) Global Native

;/* FindActionsForTargets
* * returns all occurances of an action from a list of targets in a scene
* * 
* * @param: Id, the id of the scene
* * @param: Positions, an array of indices of the targets in the scene
* * @param: Type, the action type
* *
* * @return: an array of the indices of all occurances of the action type
*/;
int[] Function FindActionsForTargets(string Id, int[] Positions, string Type) Global Native

;/* FindActionsForTargetsCSV
* * same as FindActionsForTargets, exvcept positions are passed as a csv-string
* * 
* * @param: Id, the id of the scene
* * @param: Positions, a csv-string of indices of the targets in the scene
* * @param: Type, the action type
* *
* * @return: an array of the indices of all occurances of the action type
*/;
int[] Function FindActionsForTargetsCSV(string Id, string Positions, string Type) Global Native

;/* FindAllActionsForTargets
* * returns all occurances of any of a list of actions from a list of targets in a scene
* *
* * @param: Id, the id of the scene
* * @param: Positions, an array of indices of the targets in the scene
* * @param: Types, an array of action types
* * 
* * @return: an array of the indices of all occurances of any of the action types
*/;
int[] Function FindAllActionsForTargets(string Id, int[] Positions, string[] Types) Global Native

;/* FindAllActionsForTargetsCSV
* * same as FindAllActionsForTargets, except positions and types are passed as a csv-string
* *
* * @param: Id, the id of the scene
* * @param: Positions, a csv-string of indices of the targets in the scene
* * @param: Types, a csv-string of action types
* * 
* * @return: an array of the indices of all occurances of any of the action types
*/;
int[] Function FindAllActionsForTargetsCSV(string Id, string Positions, string Types) Global Native


;  █████╗  ██████╗████████╗██╗ ██████╗ ███╗   ██╗███████╗    ██████╗ ██╗   ██╗    ██████╗ ███████╗██████╗ ███████╗ ██████╗ ██████╗ ███╗   ███╗███████╗██████╗ 
; ██╔══██╗██╔════╝╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝    ██╔══██╗╚██╗ ██╔╝    ██╔══██╗██╔════╝██╔══██╗██╔════╝██╔═══██╗██╔══██╗████╗ ████║██╔════╝██╔══██╗
; ███████║██║        ██║   ██║██║   ██║██╔██╗ ██║███████╗    ██████╔╝ ╚████╔╝     ██████╔╝█████╗  ██████╔╝█████╗  ██║   ██║██████╔╝██╔████╔██║█████╗  ██████╔╝
; ██╔══██║██║        ██║   ██║██║   ██║██║╚██╗██║╚════██║    ██╔══██╗  ╚██╔╝      ██╔═══╝ ██╔══╝  ██╔══██╗██╔══╝  ██║   ██║██╔══██╗██║╚██╔╝██║██╔══╝  ██╔══██╗
; ██║  ██║╚██████╗   ██║   ██║╚██████╔╝██║ ╚████║███████║    ██████╔╝   ██║       ██║     ███████╗██║  ██║██║     ╚██████╔╝██║  ██║██║ ╚═╝ ██║███████╗██║  ██║
; ╚═╝  ╚═╝ ╚═════╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝    ╚═════╝    ╚═╝       ╚═╝     ╚══════╝╚═╝  ╚═╝╚═╝      ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝

;/* FindActionForPerformer
* * returns the first occurance of an action from a performer in a scene
* * 
* * @param: Id, the id of the scene
* * @param: Position, the index of the performer in the scene
* * @param: Type, the action type
* *
* * @return: the index of the first occurance of the action type if it occurs, otherwise -1
*/;
int Function FindActionForPerformer(string Id, int Position, string Type) Global Native

;/* FindAnyActionForPerformer
* * returns the first occurance of any of a list of actions from a performer in a scene
* *
* * @param: Id, the id of the scene
* * @param: Position, the index of the performer in the scene
* * @param: Types, an array of action types
* * 
* * @return: the index of the first occurance of any of the action types if one occurs, otherwise -1
*/;
int Function FindAnyActionForPerformer(string Id, int Position, string[] Types) Global Native

;/* FindAnyActionForPerformerCSV
* * same as FindAnyActionForPerformer, except types are passed as a csv-string
* *
* * @param: Id, the id of the scene
* * @param: Position, the index of the performer in the scene
* * @param: Types, a csv-string of action types
* * 
* * @return: the index of the first occurance of any of the action types if one occurs, otherwise -1
*/;
int Function FindAnyActionForPerformerCSV(string Id, int Position, string Types) Global Native

;/* FindActionsForPerformer
* * returns all occurances of an action from a performer in a scene
* * 
* * @param: Id, the id of the scene
* * @param: Position, the index of the performer in the scene
* * @param: Type, the action type
* *
* * @return: an array of the indices of all occurances of the action type
*/;
int[] Function FindActionsForPerformer(string Id, int Position, string Type) Global Native

;/* FindAllActionsForPerformer
* * returns all occurances of any of a list of actions from a performer in a scene
* *
* * @param: Id, the id of the scene
* * @param: Position, the index of the performer in the scene
* * @param: Types, an array of action types
* * 
* * @return: an array of the indices of all occurances of any of the action types
*/;
int[] Function FindAllActionsForPerformer(string Id, int Position, string[] Types) Global Native

;/* FindAllActionsForPerformerCSV
* * same as FindAllActionsForPerformer, except types are passed as a csv-string
* *
* * @param: Id, the id of the scene
* * @param: Position, the index of the performer in the scene
* * @param: Types, a csv-string of action types
* * 
* * @return: an array of the indices of all occurances of any of the action types
*/;
int[] Function FindAllActionsForPerformerCSV(string Id, int Position, string Types) Global Native

;/* FindActionForPerformers
* * returns the first occurance of an action from a list of performers in a scene
* * 
* * @param: Id, the id of the scene
* * @param: Positions, an array of indices of the performers in the scene
* * @param: Type, the action type
* *
* * @return: the index of the first occurance of the action type if it occurs, otherwise -1
*/;
int Function FindActionForPerformers(string Id, int[] Positions, string Type) Global Native

;/* FindActionForPerformersCSV
* * same as FindActionForPerformers, except positions are passed as a csv-string
* * 
* * @param: Id, the id of the scene
* * @param: Positions, a csv-string of indices of the performers in the scene
* * @param: Type, the action type
* *
* * @return: the index of the first occurance of the action type if it occurs, otherwise -1
*/;
int Function FindActionForPerformersCSV(string Id, string Positions, string Type) Global Native

;/* FindAnyActionForPerformers
* * returns the first occurance of any of a list of actions from a list of performers in a scene
* *
* * @param: Id, the id of the scene
* * @param: Positions, an array of indices of the performers in the scene
* * @param: Types, an array of action types
* * 
* * @return: the index of the first occurance of any of the action types if one occurs, otherwise -1
*/;
int Function FindAnyActionForPerformers(string Id, int[] Positions, string[] Types) Global Native

;/* FindAnyActionForPerformersCSV
* * same as FindAnyActionForPerformers, except positions and types are passed as a csv-string
* *
* * @param: Id, the id of the scene
* * @param: Positions, a csv-string of indices of the performers in the scene
* * @param: Types, a csv-string of action types
* * 
* * @return: the index of the first occurance of any of the action types if one occurs, otherwise -1
*/;
int Function FindAnyActionForPerformersCSV(string Id, string Positions, string Types) Global Native

;/* FindActionsForPerformers
* * returns all occurances of an action from a list of performers in a scene
* * 
* * @param: Id, the id of the scene
* * @param: Positions, an array of indices of the performers in the scene
* * @param: Type, the action type
* *
* * @return: an array of the indices of all occurances of the action type
*/;
int[] Function FindActionsForPerformers(string Id, int[] Positions, string Type) Global Native

;/* FindActionsForPerformersCSV
* * same as FindActionsForPerformers, except positions are passed as a csv-string
* * 
* * @param: Id, the id of the scene
* * @param: Positions, a csv-string of indices of the performers in the scene
* * @param: Type, the action type
* *
* * @return: an array of the indices of all occurances of the action type
*/;
int[] Function FindActionsForPerformersCSV(string Id, string Positions, string Type) Global Native

;/* FindAllActionsForPerformers
* * returns all occurances of any of a list of actions from a list of performers in a scene
* *
* * @param: Id, the id of the scene
* * @param: Positions, an array of indices of the performers in the scene
* * @param: Types, an array of action types
* * 
* * @return: an array of the indices of all occurances of any of the action types
*/;
int[] Function FindAllActionsForPerformers(string Id, int[] Positions, string[] Types) Global Native

;/* FindAllActionsForPerformersCSV
* * same as FindAllActionsForPerformers, except positions and types are passed as a csv-string
* *
* * @param: Id, the id of the scene
* * @param: Positions, a csv-string of indices of the performers in the scene
* * @param: Types, a csv-string of action types
* * 
* * @return: an array of the indices of all occurances of any of the action types
*/;
int[] Function FindAllActionsForPerformersCSV(string Id, string Positions, string Types) Global Native


;  █████╗  ██████╗████████╗██╗ ██████╗ ███╗   ██╗███████╗    ██████╗ ██╗   ██╗    ███╗   ███╗ █████╗ ████████╗███████╗███████╗
; ██╔══██╗██╔════╝╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝    ██╔══██╗╚██╗ ██╔╝    ████╗ ████║██╔══██╗╚══██╔══╝██╔════╝██╔════╝
; ███████║██║        ██║   ██║██║   ██║██╔██╗ ██║███████╗    ██████╔╝ ╚████╔╝     ██╔████╔██║███████║   ██║   █████╗  ███████╗
; ██╔══██║██║        ██║   ██║██║   ██║██║╚██╗██║╚════██║    ██╔══██╗  ╚██╔╝      ██║╚██╔╝██║██╔══██║   ██║   ██╔══╝  ╚════██║
; ██║  ██║╚██████╗   ██║   ██║╚██████╔╝██║ ╚████║███████║    ██████╔╝   ██║       ██║ ╚═╝ ██║██║  ██║   ██║   ███████╗███████║
; ╚═╝  ╚═╝ ╚═════╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝    ╚═════╝    ╚═╝       ╚═╝     ╚═╝╚═╝  ╚═╝   ╚═╝   ╚══════╝╚══════╝

; a mate is someone who is either the actor or target of an action
                                                                                                                           
;/* FindActionForMate
* * returns the first occurance of an action from a mate in a scene
* * 
* * @param: Id, the id of the scene
* * @param: Position, the index of the mate in the scene
* * @param: Type, the action type
* *
* * @return: the index of the first occurance of the action type if it occurs, otherwise -1
*/;
int Function FindActionForMate(string Id, int Position, string Type) Global Native

;/* FindAnyActionForMate
* * returns the first occurance of any of a list of actions from a mate in a scene
* *
* * @param: Id, the id of the scene
* * @param: Position, the index of the mate in the scene
* * @param: Types, an array of action types
* * 
* * @return: the index of the first occurance of any of the action types if one occurs, otherwise -1
*/;
int Function FindAnyActionForMate(string Id, int Position, string[] Types) Global Native

;/* FindAnyActionForMateCSV
* * same as FindAnyActionForMate, except types are passed as a csv-string
* *
* * @param: Id, the id of the scene
* * @param: Position, the index of the mate in the scene
* * @param: Types, a csv-string of action types
* * 
* * @return: the index of the first occurance of any of the action types if one occurs, otherwise -1
*/;
int Function FindAnyActionForMateCSV(string Id, int Position, string Types) Global Native

;/* FindActionsForMate
* * returns all occurances of an action from a mate in a scene
* * 
* * @param: Id, the id of the scene
* * @param: Position, the index of the mate in the scene
* * @param: Type, the action type
* *
* * @return: an array of the indices of all occurances of the action type
*/;
int[] Function FindActionsForMate(string Id, int Position, string Type) Global Native

;/* FindAllActionsForMate
* * returns all occurances of any of a list of actions from a mate in a scene
* *
* * @param: Id, the id of the scene
* * @param: Position, the index of the mate in the scene
* * @param: Types, an array of action types
* * 
* * @return: an array of the indices of all occurances of any of the action types
*/;
int[] Function FindAllActionsForMate(string Id, int Position, string[] Types) Global Native

;/* FindAllActionsForMateCSV
* * same as FindAllActionsForMate, except types are passed as a csv-string
* *
* * @param: Id, the id of the scene
* * @param: Position, the index of the mate in the scene
* * @param: Types, a csv-string of action types
* * 
* * @return: an array of the indices of all occurances of any of the action types
*/;
int[] Function FindAllActionsForMateCSV(string Id, int Position, string Types) Global Native

;/* FindActionForMatesAny
* * returns the first occurance of an action from a list of mates in a scene
* * 
* * @param: Id, the id of the scene
* * @param: Positions, an array of indices of the mates in the scene
* * @param: Type, the action type
* *
* * @return: the index of the first occurance of the action type if it occurs, otherwise -1
*/;
int Function FindActionForMatesAny(string Id, int[] Positions, string Type) Global Native

;/* FindActionForMatesAnyCSV
* * same as FindActionForMatesAny, except positions are passed as a csv-string
* * 
* * @param: Id, the id of the scene
* * @param: Positions, a csv-string of indices of the mates in the scene
* * @param: Type, the action type
* *
* * @return: the index of the first occurance of the action type if it occurs, otherwise -1
*/;
int Function FindActionForMatesAnyCSV(string Id, string Positions, string Type) Global Native

;/* FindAnyActionForMatesAny
* * returns the first occurance of any of a list of actions from a list of mates in a scene
* *
* * @param: Id, the id of the scene
* * @param: Positions, an array of indices of the mates in the scene
* * @param: Types, an array of action types
* * 
* * @return: the index of the first occurance of any of the action types if one occurs, otherwise -1
*/;
int Function FindAnyActionForMatesAny(string Id, int[] Positions, string[] Types) Global Native

;/* FindAnyActionForMatesAnyCSV
* * same as FindAnyActionForMatesAny, except positions and types are passed as a csv-string
* *
* * @param: Id, the id of the scene
* * @param: Positions, a csv-string of indices of the mates in the scene
* * @param: Types, a csv-string of action types
* * 
* * @return: the index of the first occurance of any of the action types if one occurs, otherwise -1
*/;
int Function FindAnyActionForMatesAnyCSV(string Id, string Positions, string Types) Global Native

;/* FindActionsForMatesAny
* * returns all occurances of an action from a list of mates in a scene
* * 
* * @param: Id, the id of the scene
* * @param: Positions, an array of indices of the mates in the scene
* * @param: Type, the action type
* *
* * @return: an array of the indices of all occurances of the action type
*/;
int[] Function FindActionsForMatesAny(string Id, int[] Positions, string Type) Global Native

;/* FindActionsForMatesAnyCSV
* * same as FindActionsForMatesAny, except positions are passed as a csv-string
* * 
* * @param: Id, the id of the scene
* * @param: Positions, a csv-string of indices of the mates in the scene
* * @param: Type, the action type
* *
* * @return: an array of the indices of all occurances of the action type
*/;
int[] Function FindActionsForMatesAnyCSV(string Id, string Positions, string Type) Global Native

;/* FindAllActionsForMatesAny
* * returns all occurances of any of a list of actions from a list of mates in a scene
* *
* * @param: Id, the id of the scene
* * @param: Positions, an array of indices of the mates in the scene
* * @param: Types, an array of action types
* * 
* * @return: an array of the indices of all occurances of any of the action types
*/;
int[] Function FindAllActionsForMatesAny(string Id, int[] Positions, string[] Types) Global Native

;/* FindAllActionsForMatesAnyCSV
* * same as FindAllActionsForMatesAny, except positions and types are passed as a csv-string
* *
* * @param: Id, the id of the scene
* * @param: Positions, a csv-string of indices of the mates in the scene
* * @param: Types, a csv-string of action types
* * 
* * @return: an array of the indices of all occurances of any of the action types
*/;
int[] Function FindAllActionsForMatesAnyCSV(string Id, string Positions, string Types) Global Native


;  █████╗  ██████╗████████╗██╗ ██████╗ ███╗   ██╗███████╗    ██████╗ ██╗   ██╗    ██████╗  █████╗ ██████╗ ████████╗██╗ ██████╗██╗██████╗  █████╗ ███╗   ██╗████████╗
; ██╔══██╗██╔════╝╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝    ██╔══██╗╚██╗ ██╔╝    ██╔══██╗██╔══██╗██╔══██╗╚══██╔══╝██║██╔════╝██║██╔══██╗██╔══██╗████╗  ██║╚══██╔══╝
; ███████║██║        ██║   ██║██║   ██║██╔██╗ ██║███████╗    ██████╔╝ ╚████╔╝     ██████╔╝███████║██████╔╝   ██║   ██║██║     ██║██████╔╝███████║██╔██╗ ██║   ██║   
; ██╔══██║██║        ██║   ██║██║   ██║██║╚██╗██║╚════██║    ██╔══██╗  ╚██╔╝      ██╔═══╝ ██╔══██║██╔══██╗   ██║   ██║██║     ██║██╔═══╝ ██╔══██║██║╚██╗██║   ██║   
; ██║  ██║╚██████╗   ██║   ██║╚██████╔╝██║ ╚████║███████║    ██████╔╝   ██║       ██║     ██║  ██║██║  ██║   ██║   ██║╚██████╗██║██║     ██║  ██║██║ ╚████║   ██║   
; ╚═╝  ╚═╝ ╚═════╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝    ╚═════╝    ╚═╝       ╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝╚═╝╚═╝     ╚═╝  ╚═╝╚═╝  ╚═══╝   ╚═╝   

; a participant is someone who is either the actor, target or performer of an action
                                                                                                                           
;/* FindActionForParticipant
* * returns the first occurance of an action from a participant in a scene
* * 
* * @param: Id, the id of the scene
* * @param: Position, the index of the participant in the scene
* * @param: Type, the action type
* *
* * @return: the index of the first occurance of the action type if it occurs, otherwise -1
*/;
int Function FindActionForParticipant(string Id, int Position, string Type) Global Native

;/* FindAnyActionForParticipant
* * returns the first occurance of any of a list of actions from a participant in a scene
* *
* * @param: Id, the id of the scene
* * @param: Position, the index of the participant in the scene
* * @param: Types, an array of action types
* * 
* * @return: the index of the first occurance of any of the action types if one occurs, otherwise -1
*/;
int Function FindAnyActionForParticipant(string Id, int Position, string[] Types) Global Native

;/* FindAnyActionForParticipantCSV
* * same as FindAnyActionForParticipant, except types are passed as a csv-string
* *
* * @param: Id, the id of the scene
* * @param: Position, the index of the participant in the scene
* * @param: Types, a csv-string of action types
* * 
* * @return: the index of the first occurance of any of the action types if one occurs, otherwise -1
*/;
int Function FindAnyActionForParticipantCSV(string Id, int Position, string Types) Global Native

;/* FindActionsForParticipant
* * returns all occurances of an action from a participant in a scene
* * 
* * @param: Id, the id of the scene
* * @param: Position, the index of the participant in the scene
* * @param: Type, the action type
* *
* * @return: an array of the indices of all occurances of the action type
*/;
int[] Function FindActionsForParticipant(string Id, int Position, string Type) Global Native

;/* FindAllActionsForParticipant
* * returns all occurances of any of a list of actions from a participant in a scene
* *
* * @param: Id, the id of the scene
* * @param: Position, the index of the participant in the scene
* * @param: Types, an array of action types
* * 
* * @return: an array of the indices of all occurances of any of the action types
*/;
int[] Function FindAllActionsForParticipant(string Id, int Position, string[] Types) Global Native

;/* FindAllActionsForParticipantCSV
* * same as FindAllActionsForParticipant, except types are passed as a csv-string
* *
* * @param: Id, the id of the scene
* * @param: Position, the index of the participant in the scene
* * @param: Types, a csv-string of action types
* * 
* * @return: an array of the indices of all occurances of any of the action types
*/;
int[] Function FindAllActionsForParticipantCSV(string Id, int Position, string Types) Global Native

;/* FindActionForParticipantsAny
* * returns the first occurance of an action from a list of participants in a scene
* * 
* * @param: Id, the id of the scene
* * @param: Positions, an array of indices of the participants in the scene
* * @param: Type, the action type
* *
* * @return: the index of the first occurance of the action type if it occurs, otherwise -1
*/;
int Function FindActionForParticipantsAny(string Id, int[] Positions, string Type) Global Native

;/* FindActionForParticipantsAnyCSV
* * same as FindActionForParticipantsAny, except positions are passed as a csv-string
* * 
* * @param: Id, the id of the scene
* * @param: Positions, a csv-string of indices of the participants in the scene
* * @param: Type, the action type
* *
* * @return: the index of the first occurance of the action type if it occurs, otherwise -1
*/;
int Function FindActionForParticipantsAnyCSV(string Id, string Positions, string Type) Global Native

;/* FindAnyActionForParticipantsAny
* * returns the first occurance of any of a list of actions from a list of participants in a scene
* *
* * @param: Id, the id of the scene
* * @param: Positions, an array of indices of the participants in the scene
* * @param: Types, an array of action types
* * 
* * @return: the index of the first occurance of any of the action types if one occurs, otherwise -1
*/;
int Function FindAnyActionForParticipantsAny(string Id, int[] Positions, string[] Types) Global Native

;/* FindAnyActionForParticipantsAnyCSV
* * same as FindAnyActionForParticipantsAny, except positions and types are passed as a csv-string
* *
* * @param: Id, the id of the scene
* * @param: Positions, a csv-string of indices of the participants in the scene
* * @param: Types, a csv-string of action types
* * 
* * @return: the index of the first occurance of any of the action types if one occurs, otherwise -1
*/;
int Function FindAnyActionForParticipantsAnyCSV(string Id, string Positions, string Types) Global Native

;/* FindActionsForParticipantsAny
* * returns all occurances of an action from a list of participants in a scene
* * 
* * @param: Id, the id of the scene
* * @param: Positions, an array of indices of the participants in the scene
* * @param: Type, the action type
* *
* * @return: an array of the indices of all occurances of the action type
*/;
int[] Function FindActionsForParticipantsAny(string Id, int[] Positions, string Type) Global Native

;/* FindActionsForParticipantsAnyCSV
* * same as FindActionsForParticipantsAny, except positions are passed as a csv-string
* * 
* * @param: Id, the id of the scene
* * @param: Positions, a csv-string of indices of the participants in the scene
* * @param: Type, the action type
* *
* * @return: an array of the indices of all occurances of the action type
*/;
int[] Function FindActionsForParticipantsAnyCSV(string Id, string Positions, string Type) Global Native

;/* FindAllActionsForParticipantsAny
* * returns all occurances of any of a list of actions from a list of participants in a scene
* *
* * @param: Id, the id of the scene
* * @param: Positions, an array of indices of the participants in the scene
* * @param: Types, an array of action types
* * 
* * @return: an array of the indices of all occurances of any of the action types
*/;
int[] Function FindAllActionsForParticipantsAny(string Id, int[] Positions, string[] Types) Global Native

;/* FindAllActionsForParticipantsAnyCSV
* * same as FindAllActionsForParticipantsAny, except positions and types are passed as a csv-string
* *
* * @param: Id, the id of the scene
* * @param: Positions, a csv-string of indices of the participants in the scene
* * @param: Types, a csv-string of action types
* * 
* * @return: an array of the indices of all occurances of any of the action types
*/;
int[] Function FindAllActionsForsParticipantsAnyCSV(string Id, string Positions, string Types) Global Native


;  █████╗  ██████╗████████╗██╗ ██████╗ ███╗   ██╗    ███████╗██╗   ██╗██████╗ ███████╗██████╗ ██╗      ██████╗  █████╗ ██████╗ 
; ██╔══██╗██╔════╝╚══██╔══╝██║██╔═══██╗████╗  ██║    ██╔════╝██║   ██║██╔══██╗██╔════╝██╔══██╗██║     ██╔═══██╗██╔══██╗██╔══██╗
; ███████║██║        ██║   ██║██║   ██║██╔██╗ ██║    ███████╗██║   ██║██████╔╝█████╗  ██████╔╝██║     ██║   ██║███████║██║  ██║
; ██╔══██║██║        ██║   ██║██║   ██║██║╚██╗██║    ╚════██║██║   ██║██╔═══╝ ██╔══╝  ██╔══██╗██║     ██║   ██║██╔══██║██║  ██║
; ██║  ██║╚██████╗   ██║   ██║╚██████╔╝██║ ╚████║    ███████║╚██████╔╝██║     ███████╗██║  ██║███████╗╚██████╔╝██║  ██║██████╔╝
; ╚═╝  ╚═╝ ╚═════╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝    ╚══════╝ ╚═════╝ ╚═╝     ╚══════╝╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚═════╝ 

;/* FindActionSuperloadCSV
* * returns the first occurance of any of a list of actions matching the given conditions
* * parameters given as "" will be ignored for condition checks
* *
* * @param: Id, the id of the scene
* * @param: ActorPositions, a csv-string of indices of the actors in the scene
* * @param: TargetPositions, a csv-string of the indices of the targets in the scene
* * @param: PerformerPositions, a csv-string of the indices of the perfomers in the scene
* * @param: MatePositionsAny, a csv-string of the indices of the mates in the scene, at least one mate needs to be in this list
* * @param: MatePositionsAll, a csv-string of the indices of the mates in the scene, all mates need to be in this list
* * @param: ParticipantPositionsAny, a csv-string of the indices of the participants in the scene, at least one participant needs to be in this list
* * @param: ParticipantPositionsAll, a csv-string of the indices of the participants in the scene, all participants need to be in this list
* * @param: Types, a csv-string of action types
* *
* * @return: the index of the first occurance of a matching action
*/;
int Function FindActionSuperloadCSV(string Id, string ActorPositions = "", string TargetPositions = "", string PerformerPositions = "", string MatePositionsAny = "", string MatePositionsAll = "", string ParticipantPositionsAny = "", string ParticipantPositionsAll = "", string Types = "") Global Native

;/* FindActionsSuperloadCSV
* * returns all occurances of any of a list of actions matching the given conditions
* * parameters given as "" will be ignored for condition checks
* *
* * @param: Id, the id of the scene
* * @param: ActorPositions, a csv-string of indices of the actors in the scene
* * @param: TargetPositions, a csv-string of the indices of the targets in the scene
* * @param: PerformerPositions, a csv-string of the indices of the perfomers in the scene
* * @param: MatePositionsAny, a csv-string of the indices of the mates in the scene, at least one mate needs to be in this list
* * @param: MatePositionsAll, a csv-string of the indices of the mates in the scene, all mates need to be in this list
* * @param: ParticipantPositionsAny, a csv-string of the indices of the participants in the scene, at least one participant needs to be in this list
* * @param: ParticipantPositionsAll, a csv-string of the indices of the participants in the scene, all participants need to be in this list
* * @param: Types, a csv-string of action types
* *
* * @return: an array of the indices of all occurances of matching actions
*/;
int[] Function FindActionsSuperloadCSV(string Id, string ActorPositions = "", string TargetPositions = "", string PerformerPositions = "", string MatePositionsAny = "", string MatePositionsAll = "", string ParticipantPositionsAny = "", string ParticipantPositionsAll = "", string Types = "") Global Native


;  █████╗  ██████╗████████╗██╗ ██████╗ ███╗   ██╗    ██████╗ ██████╗  ██████╗ ██████╗ ███████╗██████╗ ████████╗██╗███████╗███████╗
; ██╔══██╗██╔════╝╚══██╔══╝██║██╔═══██╗████╗  ██║    ██╔══██╗██╔══██╗██╔═══██╗██╔══██╗██╔════╝██╔══██╗╚══██╔══╝██║██╔════╝██╔════╝
; ███████║██║        ██║   ██║██║   ██║██╔██╗ ██║    ██████╔╝██████╔╝██║   ██║██████╔╝█████╗  ██████╔╝   ██║   ██║█████╗  ███████╗
; ██╔══██║██║        ██║   ██║██║   ██║██║╚██╗██║    ██╔═══╝ ██╔══██╗██║   ██║██╔═══╝ ██╔══╝  ██╔══██╗   ██║   ██║██╔══╝  ╚════██║
; ██║  ██║╚██████╗   ██║   ██║╚██████╔╝██║ ╚████║    ██║     ██║  ██║╚██████╔╝██║     ███████╗██║  ██║   ██║   ██║███████╗███████║
; ╚═╝  ╚═╝ ╚═════╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝    ╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚══════╝╚═╝  ╚═╝   ╚═╝   ╚═╝╚══════╝╚══════╝

;/* GetActionTypes
* * return all action types for a scene
* *
* * @param: Id, the id of the scene
* *
* * @return: an array containing all the action types for the scene
*/;
string[] Function GetActionTypes(string Id) Global Native

;/* GetActionType
* * returns the action type for an action in a scene
* * this is much faster than GetActionTypes(id)[index]
* *
* * @param: Id, the id of the scene
* * @param: Index, the index of the action
* *
* * @return: the action type
*/;
string Function GetActionType(string Id, int Index) Global Native

;/* GetActionActors
* * returns all actions actors in a scene
* * 
* * @param: Id, the id of the scene
* *
* * @return: an array of the positions in the scene of the actors of all actions
*/;
int[] Function GetActionActors(string Id) Global Native

;/* GetActionActor
* * returns the actor for an action in a scene
* * this is much faster than GetActionActors(id)[index]
* *
* * @param: Id, the id of the scene
* * @param: Index, the index of the action
* *
* * @return: the position in the scene of the actor
*/;
int Function GetActionActor(string Id, int Index) Global Native

;/* GetActionTargets
* * returns all actions targets in a scene
* * 
* * @param: Id, the id of the scene
* *
* * @return: an array of the positions in the scene of the targets of all actions
*/;
int[] Function GetActionTargets(string Id) Global Native

;/* GetActionTarget
* * returns the target for an action in a scene
* * this is much faster than GetActionTargets(id)[index]
* *
* * @param: Id, the id of the scene
* * @param: Index, the index of the action
* *
* * @return: the position in the scene of the target
*/;
int Function GetActionTarget(string Id, int Index) Global Native

;/* GetActionActors
* * returns all actions performers in a scene
* * 
* * @param: Id, the id of the scene
* *
* * @return: an array of the positions in the scene of the performers of all actions
*/;
int[] Function GetActionPerformers(string Id) Global Native

;/* GetActionPerformer
* * returns the performer for an action in a scene
* * this is much faster than GetActionPerformers(id)[index]
* *
* * @param: Id, the id of the scene
* * @param: Index, the index of the action
* *
* * @return: the position in the scene of the performer
*/;
int Function GetActionPerformer(string Id, int Index) Global Native
                                                                                                                                                                 