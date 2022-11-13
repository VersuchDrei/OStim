;/* OLibrary
* * a collection of native functions referring to the scene library
* * 
* * bed scenes are not considered furniture scenes, those are regular scenes that happen to play on a bed
* * furniture scenes are scenes that can play animations exclusive to certain furniture objects, like sitting on a chair
* * as of right now (OStim NG 6.3) furniture scenes do not work! support will be added soon, though
* * planned furniture types are: chair, bench, shelf, craftingtable, cookingpot
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

; ██████╗  █████╗ ███╗   ██╗██████╗  ██████╗ ███╗   ███╗    ███████╗ ██████╗███████╗███╗   ██╗███████╗███████╗
; ██╔══██╗██╔══██╗████╗  ██║██╔══██╗██╔═══██╗████╗ ████║    ██╔════╝██╔════╝██╔════╝████╗  ██║██╔════╝██╔════╝
; ██████╔╝███████║██╔██╗ ██║██║  ██║██║   ██║██╔████╔██║    ███████╗██║     █████╗  ██╔██╗ ██║█████╗  ███████╗
; ██╔══██╗██╔══██║██║╚██╗██║██║  ██║██║   ██║██║╚██╔╝██║    ╚════██║██║     ██╔══╝  ██║╚██╗██║██╔══╝  ╚════██║
; ██║  ██║██║  ██║██║ ╚████║██████╔╝╚██████╔╝██║ ╚═╝ ██║    ███████║╚██████╗███████╗██║ ╚████║███████╗███████║
; ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝  ╚═════╝ ╚═╝     ╚═╝    ╚══════╝ ╚═════╝╚══════╝╚═╝  ╚═══╝╚══════╝╚══════╝

;/* GetRandomScene
* * returns a random scene applicable for the actors
* *
* * @param: Actors, the actors the check scene conditions against
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomScene(Actor[] Actors) Global Native

;/* GetRandomFurnitureScene
* * returns a random furniture scene applicable for the actors
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: FurnitureType, the type of furniture for the scene
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomFurnitureScene(Actor[] Actors, string FurnitureType) Global Native

; ██████╗ ██╗   ██╗    ███████╗ ██████╗███████╗███╗   ██╗███████╗    ████████╗ █████╗  ██████╗ 
; ██╔══██╗╚██╗ ██╔╝    ██╔════╝██╔════╝██╔════╝████╗  ██║██╔════╝    ╚══██╔══╝██╔══██╗██╔════╝ 
; ██████╔╝ ╚████╔╝     ███████╗██║     █████╗  ██╔██╗ ██║█████╗         ██║   ███████║██║  ███╗
; ██╔══██╗  ╚██╔╝      ╚════██║██║     ██╔══╝  ██║╚██╗██║██╔══╝         ██║   ██╔══██║██║   ██║
; ██████╔╝   ██║       ███████║╚██████╗███████╗██║ ╚████║███████╗       ██║   ██║  ██║╚██████╔╝
; ╚═════╝    ╚═╝       ╚══════╝ ╚═════╝╚══════╝╚═╝  ╚═══╝╚══════╝       ╚═╝   ╚═╝  ╚═╝ ╚═════╝ 

;/* GetRandomSceneWithTag
* * returns a random scene applicable for the actors with a scene tag
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: Tag, the scene tag
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomSceneWithTag(Actor[] Actors, string Tag) Global Native

;/* GetRandomSceneWithAnyTag
* * returns a random scene applicable for the actors with any of a list of scene tags
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: Tags, an array scene tags
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomSceneWithAnyTag(Actor[] Actors, string[] Tags) Global Native

;/* GetRandomSceneWithAnyTagCSV
* * same as GetRandomSceneWithAnyTag, except tags are given in a csv-string
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: Tags, a csv-string of scene tags
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomSceneWithAnyTagCSV(Actor[] Actors, string Tags) Global Native

;/* GetRandomSceneWithAllTags
* * returns a random scene applicable for the actors with all of a list of scene tags
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: Tags, an array of scene tags
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomSceneWithAllTags(Actor[] Actors, string[] Tags) Global Native

;/* GetRandomSceneWithAllTagsCSV
* * same as GetRandomSceneWithAllTags, except tags are given in a csv-string
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: Tags, a csv-string of scene tags
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomSceneWithAllTagsCSV(Actor[] Actors, string Tags) Global Native


;/* GetRandomFurnitureSceneWithTag
* * returns a random furniture scene applicable for the actors with a scene tag
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: FurnitureType, the type of furniture for the scene
* * @param: Tag, the scene tag
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomFurnitureSceneWithTag(Actor[] Actors, string FurnitureType, string Tag) Global Native

;/* GetRandomFurnitureSceneWithAnyTag
* * returns a random furniture scene applicable for the actors with any of a list of scene tags
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: FurnitureType, the type of furniture for the scene
* * @param: Tags, an array scene tags
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomFurnitureSceneWithAnyTag(Actor[] Actors, string FurnitureType, string[] Tags) Global Native

;/* GetRandomFurnitureSceneWithAnyTagCSV
* * same as GetRandomFurnitureSceneWithAnyTag, except tags are given in a csv-string
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: FurnitureType, the type of furniture for the scene
* * @param: Tags, a csv-string of scene tags
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomFurnitureSceneWithAnyTagCSV(Actor[] Actors, string FurnitureType, string Tags) Global Native

;/* GetRandomFurnitureSceneWithAllTags
* * returns a random furniture scene applicable for the actors with all of a list of scene tags
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: FurnitureType, the type of furniture for the scene
* * @param: Tags, an array of scene tags
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomFurnitureSceneWithAllTags(Actor[] Actors, string FurnitureType, string[] Tags) Global Native

;/* GetRandomFurnitureSceneWithAllTagsCSV
* * same as GetRandomFurnitureSceneWithAllTags, except tags are given in a csv-string
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: FurnitureType, the type of furniture for the scene
* * @param: Tags, a csv-list of scene tags
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomFurnitureSceneWithAllTagsCSV(Actor[] Actors, string FurnitureType, string Tags) Global Native

; ██████╗ ██╗   ██╗    ███████╗██╗███╗   ██╗ ██████╗ ██╗     ███████╗     █████╗  ██████╗████████╗ ██████╗ ██████╗     ████████╗ █████╗  ██████╗ 
; ██╔══██╗╚██╗ ██╔╝    ██╔════╝██║████╗  ██║██╔════╝ ██║     ██╔════╝    ██╔══██╗██╔════╝╚══██╔══╝██╔═══██╗██╔══██╗    ╚══██╔══╝██╔══██╗██╔════╝ 
; ██████╔╝ ╚████╔╝     ███████╗██║██╔██╗ ██║██║  ███╗██║     █████╗      ███████║██║        ██║   ██║   ██║██████╔╝       ██║   ███████║██║  ███╗
; ██╔══██╗  ╚██╔╝      ╚════██║██║██║╚██╗██║██║   ██║██║     ██╔══╝      ██╔══██║██║        ██║   ██║   ██║██╔══██╗       ██║   ██╔══██║██║   ██║
; ██████╔╝   ██║       ███████║██║██║ ╚████║╚██████╔╝███████╗███████╗    ██║  ██║╚██████╗   ██║   ╚██████╔╝██║  ██║       ██║   ██║  ██║╚██████╔╝
; ╚═════╝    ╚═╝       ╚══════╝╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝╚══════╝    ╚═╝  ╚═╝ ╚═════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝       ╚═╝   ╚═╝  ╚═╝ ╚═════╝ 

;/* GetRandomSceneWithSingleActorTag
* * returns a random scene applicable for the actors with a tag for a single actor
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: Position, the index of the actor in the scene
* * @param: Tag, the actor tag
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomSceneWithSingleActorTag(Actor[] Actors, int Position, string Tag) Global Native

;/* GetRandomSceneWithAnySingleActorTag
* * returns a random scene applicable for the actors with any of a list of tags for a single actor
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: Position, the index of the actor in the scene
* * @param: Tags, an array of actor tags
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomSceneWithAnySingleActorTag(Actor[] Actors, int Position, string[] Tags) Global Native

;/* GetRandomSceneWithAnySingleActorTagCSV
* * same as GetRandomSceneWithAnySingleActorTag, except tags are given in a csv-string
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: Position, the index of the actor in the scene
* * @param: Tags, a csv-string of actor tags
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomSceneWithAnySingleActorTagCSV(Actor[] Actors, int Position, string Tags) Global Native

;/* GetRandomSceneWithAllSingleActorTags
* * returns a random scene applicable for the actors with all of a list of tags for a single actor
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: Position, the index of the actor in the scene
* * @param: Tags, an array of actor tags
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomSceneWithAllSingleActorTags(Actor[] Actors, int Position, string[] Tags) Global Native

;/* GetRandomSceneWithAllSingleActorTagsCSV
* * same as GetRandomSceneWithAllSingleActorTags, except tags are given in a csv-string
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: Position, the index of the actor in the scene
* * @param: Tags, a csv-string of actor tags
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomSceneWithAllSingleActorTagsCSV(Actor[] Actors, int Position, string Tags) Global Native


;/* GetRandomFurnitureSceneWithSingleActorTag
* * returns a random furniture scene applicable for the actors with a tag for a single actor
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: FurnitureType, the type of furniture for the scene
* * @param: Position, the index of the actor in the scene
* * @param: Tag, the actor tag
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomFurnitureSceneWithSingleActorTag(Actor[] Actors, string FurnitureType, int Position, string Tag) Global Native

;/* GetRandomFurnitureSceneWithAnySingleActorTag
* * returns a random furniture scene applicable for the actors with any of a list of tags for a single actor
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: FurnitureType, the type of furniture for the scene
* * @param: Position, the index of the actor in the scene
* * @param: Tags, an array of actor tags
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomFurnitureSceneWithAnySingleActorTag(Actor[] Actors, string FurnitureType, int Position, string[] Tags) Global Native

;/* GetRandomFurnitureSceneWithAnySingleActorTagCSV
* * same as GetRandomFurnitureSceneWithAnySingleActorTag, except tags are given in a csv-string
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: FurnitureType, the type of furniture for the scene
* * @param: Position, the index of the actor in the scene
* * @param: Tags, a csv-string of actor tags
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomFurnitureSceneWithAnySingleActorTagCSV(Actor[] Actors, string FurnitureType, int Position, string Tags) Global Native

;/* GetRandomFurnitureSceneWithAllSingleActorTags
* * returns a random furniture scene applicable for the actors with all of a list of tags for a single actor
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: FurnitureType, the type of furniture for the scene
* * @param: Position, the index of the actor in the scene
* * @param: Tags, an array of actor tags
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomFurnitureSceneWithAllSingleActorTags(Actor[] Actors, string FurnitureType, int Position, string[] Tags) Global Native

;/* GetRandomFurnitureSceneWithAllSingleActorTagsCSV
* * same as GetRandomFurnitureSceneWithAllSingleActorTags, except tags are given in a csv-string
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: FurnitureType, the type of furniture for the scene
* * @param: Position, the index of the actor in the scene
* * @param: Tags, a csv-string of actor tags
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomFurnitureSceneWithAllSingleActorTagsCSV(Actor[] Actors, string FurnitureType, int Position, string Tags) Global Native

; ██████╗ ██╗   ██╗    ███╗   ███╗██╗   ██╗██╗  ████████╗██╗     █████╗  ██████╗████████╗ ██████╗ ██████╗     ████████╗ █████╗  ██████╗ 
; ██╔══██╗╚██╗ ██╔╝    ████╗ ████║██║   ██║██║  ╚══██╔══╝██║    ██╔══██╗██╔════╝╚══██╔══╝██╔═══██╗██╔══██╗    ╚══██╔══╝██╔══██╗██╔════╝ 
; ██████╔╝ ╚████╔╝     ██╔████╔██║██║   ██║██║     ██║   ██║    ███████║██║        ██║   ██║   ██║██████╔╝       ██║   ███████║██║  ███╗
; ██╔══██╗  ╚██╔╝      ██║╚██╔╝██║██║   ██║██║     ██║   ██║    ██╔══██║██║        ██║   ██║   ██║██╔══██╗       ██║   ██╔══██║██║   ██║
; ██████╔╝   ██║       ██║ ╚═╝ ██║╚██████╔╝███████╗██║   ██║    ██║  ██║╚██████╗   ██║   ╚██████╔╝██║  ██║       ██║   ██║  ██║╚██████╔╝
; ╚═════╝    ╚═╝       ╚═╝     ╚═╝ ╚═════╝ ╚══════╝╚═╝   ╚═╝    ╚═╝  ╚═╝ ╚═════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝       ╚═╝   ╚═╝  ╚═╝ ╚═════╝ 

; every actor will be checked for the tag/tags in the tags parameter with the respective index
; so Actors[0] will be checked for Tags[0]
; Actors[1] will be checked for Tags[1], etc.

;/* GetRandomSceneWithMultiActorTagForAny
* * returns a random scene applicable for the actors with at least one actor having the respective actor tag
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: Tags, an array of actor tags
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomSceneWithMultiActorTagForAny(Actor[] Actors, string[] Tags) Global Native

;/* GetRandomSceneWithMultiActorTagForAnyCSV
* * same as GetRandomSceneWithMultiActorTagForAny, except tags are passed as a csv-string
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: Tags, a csv-string of actor tags
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomSceneWithMultiActorTagForAnyCSV(Actor[] Actors, string Tags) Global Native

;/* GetRandomSceneWithMultiActorTagForAll
* * returns a random scene applicable for the actors with all actors having the respective actor tag
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: Tags, an array of actor tags
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomSceneWithMultiActorTagForAll(Actor[] Actors, string[] Tags) Global Native

;/* GetRandomSceneWithMultiActorTagForAllCSV
* * same as GetRandomSceneWithMultiActorTagForAll, except tags are passed as a csv-string
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: Tags, a csv-string of actor tags
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomSceneWithMultiActorTagForAllCSV(Actor[] Actors, string Tags) Global Native

;/* GetRandomSceneWithAnyMultiActorTagForAnyCSV
* * returns a random scene applicable for the actors with at least one actor having at least one of the respective actor tags
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: Tags, a csv-string of lists of actor tags
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomSceneWithAnyMultiActorTagForAnyCSV(Actor[] Actors, string Tags) Global Native

;/* GetRandomSceneWithAnyMultiActorTagForAllCSV
* * returns a random scene applicable for the actors with all actors having at least one of the respective actor tags
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: Tags, a csv-string of lists of actor tags
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomSceneWithAnyMultiActorTagForAllCSV(Actor[] Actors, string Tags) Global Native

;/* GetRandomSceneWithAllMultiActorTagsForAnyCSV
* * returns a random scene applicable for the actors with at least one actor having all of the respective actor tags
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: Tags, a csv-string of lists of actor tags
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomSceneWithAllMultiActorTagsForAnyCSV(Actor[] Actors, string Tags) Global Native

;/* GetRandomSceneWithAllMultiActorTagsForAllCSV
* * returns a random scene applicable for the actors with all actors having all of the respective actor tags
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: Tags, a csv-string of lists of actor tags
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomSceneWithAllMultiActorTagsForAllCSV(Actor[] Actors, string Tags) Global Native


;/* GetRandomFurnitureSceneWithMultiActorTagForAny
* * returns a random furniture scene applicable for the actors with at least one actor having the respective actor tag
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: FurnitureType, the type of furniture for the scene
* * @param: Tags, an array of actor tags
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomFurnitureSceneWithMultiActorTagForAny(Actor[] Actors, string FurnitureType, string[] Tags) Global Native

;/* GetRandomFurnitureSceneWithMultiActorTagForAnyCSV
* * same as GetRandomFurnitureSceneWithMultiActorTagForAny, except tags are passed as a csv-string
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: FurnitureType, the type of furniture for the scene
* * @param: Tags, a csv-string of actor tags
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomFurnitureSceneWithMultiActorTagForAnyCSV(Actor[] Actors, string FurnitureType, string Tags) Global Native

;/* GetRandomFurnitureSceneWithMultiActorTagForAll
* * returns a random furniture scene applicable for the actors with all actors having the respective actor tag
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: FurnitureType, the type of furniture for the scene
* * @param: Tags, an array of actor tags
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomFurnitureSceneWithMultiActorTagForAll(Actor[] Actors, string FurnitureType, string[] Tags) Global Native

;/* GetRandomFurnitureSceneWithMultiActorTagForAlLCSV
* * same as GetRandomFurnitureSceneWithMultiActorTagForAll, except tags are passed as a csv-string
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: FurnitureType, the type of furniture for the scene
* * @param: Tags, a csv-string of actor tags
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomFurnitureSceneWithMultiActorTagForAlLCSV(Actor[] Actors, string FurnitureType, string Tags) Global Native

;/* GetRandomFurnitureSceneWithAnyMultiActorTagForAnyCSV
* * returns a random furniture scene applicable for the actors with at least one actor having at least one of the respective actor tags
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: FurnitureType, the type of furniture for the scene
* * @param: Tags, a csv-string of lists of actor tags
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomFurnitureSceneWithAnyMultiActorTagForAnyCSV(Actor[] Actors, string FurnitureType, string Tags) Global Native

;/* GetRandomFurnitureSceneWithAnyMultiActorTagForAllCSV
* * returns a random furniture scene applicable for the actors with all actors having at least one of the respective actor tags
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: FurnitureType, the type of furniture for the scene
* * @param: Tags, a csv-string of lists of actor tags
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomFurnitureSceneWithAnyMultiActorTagForAllCSV(Actor[] Actors, string FurnitureType, string Tags) Global Native

;/* GetRandomFurnitureSceneWithAllMultiActorTagsForAnyCSV
* * returns a random furniture scene applicable for the actors with at least one actor having all of the respective actor tags
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: FurnitureType, the type of furniture for the scene
* * @param: Tags, a csv-string of lists of actor tags
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomFurnitureSceneWithAllMultiActorTagsForAnyCSV(Actor[] Actors, string FurnitureType, string Tags) Global Native

;/* GetRandomFurnitureSceneWithAllMultiActorTagsForAllCSV
* * returns a random furniture scene applicable for the actors with all actors having all of the respective actor tags
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: FurnitureType, the type of furniture for the scene
* * @param: Tags, a csv-string of lists of actor tags
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomFurnitureSceneWithAllMultiActorTagsForAllCSV(Actor[] Actors, string FurnitureType, string Tags) Global Native

; ██████╗ ██╗   ██╗     █████╗  ██████╗████████╗██╗ ██████╗ ███╗   ██╗
; ██╔══██╗╚██╗ ██╔╝    ██╔══██╗██╔════╝╚══██╔══╝██║██╔═══██╗████╗  ██║
; ██████╔╝ ╚████╔╝     ███████║██║        ██║   ██║██║   ██║██╔██╗ ██║
; ██╔══██╗  ╚██╔╝      ██╔══██║██║        ██║   ██║██║   ██║██║╚██╗██║
; ██████╔╝   ██║       ██║  ██║╚██████╗   ██║   ██║╚██████╔╝██║ ╚████║
; ╚═════╝    ╚═╝       ╚═╝  ╚═╝ ╚═════╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝                                                                 

;/* GetRandomSceneWithAction
* * returns a random scene applicable for the actors with an action
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: Type, the action type
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomSceneWithAction(Actor[] Actors, string Type) Global Native

;/* GetRandomSceneWithAnyAction
* * returns a random scene applicable for the actors with any of a list of actions
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: Types, an array of action types
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomSceneWithAnyAction(Actor[] Actors, string[] Types) Global Native

;/* GetRandomSceneWithAnyActionCSV
* * same as GetRandomSceneWithAnyAction, except types are passed in a csv-string
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: Types, a csv-string of action types
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomSceneWithAnyActionCSV(Actor[] Actors, string Types) Global Native

;/* GetRandomSceneWithAllActions
* * returns a random scene applicable for the actors with all of a list of actions
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: Types, an array of action types
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomSceneWithAllActions(Actor[] Actors, string[] Types) Global Native

;/* GetRandomSceneWithAllActionsCSV
* * same as GetRandomSceneWithAllActions, except types are passed in a csv-string
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: Types, a csv-string of action types
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomSceneWithAllActionsCSV(Actor[] Actors, string Types) Global Native


;/* GetRandomFurnitureSceneWithAction
* * returns a random furniture scene applicable for the actors with an action
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: FurnitureType, the type of furniture for the scene
* * @param: Type, the action type
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomFurnitureSceneWithAction(Actor[] Actors, string FurnitureType, string Type) Global Native

;/* GetRandomFurnitureSceneWithAnyAction
* * returns a random furniture scene applicable for the actors with any of a list of actions
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: FurnitureType, the type of furniture for the scene
* * @param: Types, an array of action types
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomFurnitureSceneWithAnyAction(Actor[] Actors, string FurnitureType, string[] Types) Global Native

;/* GetRandomFurnitureSceneWithAnyActionCSV
* * same as GetRandomFurnitureSceneWithAnyAction, except types are passed in a csv-string
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: FurnitureType, the type of furniture for the scene
* * @param: Types, a csv-string of action types
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomFurnitureSceneWithAnyActionCSV(Actor[] Actors, string FurnitureType, string Types) Global Native

;/* GetRandomFurnitureSceneWithAllActions
* * returns a random furniture scene applicable for the actors with all of a list of actions
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: FurnitureType, the type of furniture for the scene
* * @param: Types, an array of action types
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomFurnitureSceneWithAllActions(Actor[] Actors, string FurnitureType, string[] Types) Global Native

;/* GetRandomFurnitureSceneWithAllActionsCSV
* * same as GetRandomFurnitureSceneWithAllActions, except types are passed in a csv-string
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: FurnitureType, the type of furniture for the scene
* * @param: Types, a csv-string of action types
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomFurnitureSceneWithAllActionsCSV(Actor[] Actors, string FurnitureType, string Types) Global Native

; ██████╗ ██╗   ██╗     █████╗  ██████╗████████╗██╗ ██████╗ ███╗   ██╗     █████╗  ██████╗████████╗ ██████╗ ██████╗ 
; ██╔══██╗╚██╗ ██╔╝    ██╔══██╗██╔════╝╚══██╔══╝██║██╔═══██╗████╗  ██║    ██╔══██╗██╔════╝╚══██╔══╝██╔═══██╗██╔══██╗
; ██████╔╝ ╚████╔╝     ███████║██║        ██║   ██║██║   ██║██╔██╗ ██║    ███████║██║        ██║   ██║   ██║██████╔╝
; ██╔══██╗  ╚██╔╝      ██╔══██║██║        ██║   ██║██║   ██║██║╚██╗██║    ██╔══██║██║        ██║   ██║   ██║██╔══██╗
; ██████╔╝   ██║       ██║  ██║╚██████╗   ██║   ██║╚██████╔╝██║ ╚████║    ██║  ██║╚██████╗   ██║   ╚██████╔╝██║  ██║
; ╚═════╝    ╚═╝       ╚═╝  ╚═╝ ╚═════╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝    ╚═╝  ╚═╝ ╚═════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝

;/* GetRandomSceneWithActionForActor
* * returns a random scene applicable for the actors with an action of an actor
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: Position, the index of the action actor in the scene
* * @param: Type, the action type
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomSceneWithActionForActor(Actor[] Actors, int Position, string Type) Global Native

;/* GetRandomSceneWithAnyActionForActor
* * returns a random scene applicable for the actors with any of a list of actions of an actor
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: Position, the index of the action actor in the scene
* * @param: Types, an array of action types
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomSceneWithAnyActionForActor(Actor[] Actors, int Position, string[] Types) Global Native

;/* GetRandomSceneWithAnyActionForActorCSV
* * same as GetRandomSceneWithAnyActionForActor, except types are passed as csv-string
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: Position, the index of the action actor in the scene
* * @param: Types, a csv-string of action types
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomSceneWithAnyActionForActorCSV(Actor[] Actors, int Position, string Types) Global Native

;/* GetRandomSceneWithAllActionsForActor
* * returns a random scene applicable for the actors with all of a list of actions of an actor
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: Position, the index of the action actor in the scene
* * @param: Types, an array of action types
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomSceneWithAllActionsForActor(Actor[] Actors, int Position, string[] Types) Global Native

;/* GetRandomSceneWithAllActionsForActorCSV
* * same as GetRandomSceneWithAllActionsForActor, except types are passed as csv-string
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: Position, the index of the action actor in the scene
* * @param: Types, a csv-string of action types
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomSceneWithAllActionsForActorCSV(Actor[] Actors, int Position, string Types) Global Native


;/* GetRandomFurnitureSceneWithActionForActor
* * returns a random furniture scene applicable for the actors with an action of an actor
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: FurnitureType, the type of furniture for the scene
* * @param: Position, the index of the action actor in the scene
* * @param: Type, the action type
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomFurnitureSceneWithActionForActor(Actor[] Actors, string FurnitureType, int Position, string Type) Global Native

;/* GetRandomFurnitureSceneWithAnyActionForActor
* * returns a random furniture scene applicable for the actors with any of a list of actions of an actor
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: FurnitureType, the type of furniture for the scene
* * @param: Position, the index of the action actor in the scene
* * @param: Types, an array of action types
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomFurnitureSceneWithAnyActionForActor(Actor[] Actors, string FurnitureType, int Position, string[] Types) Global Native

;/* GetRandomFurnitureSceneWithAnyActionForActorCSV
* * same as GetRandomFurnitureSceneWithAnyActionForActor, except types are passed as csv-string
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: FurnitureType, the type of furniture for the scene
* * @param: Position, the index of the action actor in the scene
* * @param: Types, a csv-string of action types
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomFurnitureSceneWithAnyActionForActorCSV(Actor[] Actors, string FurnitureType, int Position, string Types) Global Native

;/* GetRandomFurnitureSceneWithAllActionsForActor
* * returns a random furniture scene applicable for the actors with all of a list of actions of an actor
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: FurnitureType, the type of furniture for the scene
* * @param: Position, the index of the action actor in the scene
* * @param: Types, an array of action types
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomFurnitureSceneWithAllActionsForActor(Actor[] Actors, string FurnitureType, int Position, string[] Types) Global Native

;/* GetRandomFurnitureSceneWithAllActionsForActorCSV
* * same as GetRandomFurnitureSceneWithAllActionsForActor, except types are passed as csv-string
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: FurnitureType, the type of furniture for the scene
* * @param: Position, the index of the action actor in the scene
* * @param: Types, a csv-string of action types
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomFurnitureSceneWithAllActionsForActorCSV(Actor[] Actors, string FurnitureType, int Position, string Types) Global Native

; ██████╗ ██╗   ██╗     █████╗  ██████╗████████╗██╗ ██████╗ ███╗   ██╗    ████████╗ █████╗ ██████╗  ██████╗ ███████╗████████╗
; ██╔══██╗╚██╗ ██╔╝    ██╔══██╗██╔════╝╚══██╔══╝██║██╔═══██╗████╗  ██║    ╚══██╔══╝██╔══██╗██╔══██╗██╔════╝ ██╔════╝╚══██╔══╝
; ██████╔╝ ╚████╔╝     ███████║██║        ██║   ██║██║   ██║██╔██╗ ██║       ██║   ███████║██████╔╝██║  ███╗█████╗     ██║   
; ██╔══██╗  ╚██╔╝      ██╔══██║██║        ██║   ██║██║   ██║██║╚██╗██║       ██║   ██╔══██║██╔══██╗██║   ██║██╔══╝     ██║   
; ██████╔╝   ██║       ██║  ██║╚██████╗   ██║   ██║╚██████╔╝██║ ╚████║       ██║   ██║  ██║██║  ██║╚██████╔╝███████╗   ██║   
; ╚═════╝    ╚═╝       ╚═╝  ╚═╝ ╚═════╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝       ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝   ╚═╝   

;/* GetRandomSceneWithActionForTarget
* * returns a random scene applicable for the actors with an action of a target
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: Position, the index of the action target in the scene
* * @param: Type, the action type
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomSceneWithActionForTarget(Actor[] Actors, int Position, string Type) Global Native

;/* GetRandomSceneWithAnyActionForTarget
* * returns a random scene applicable for the actors with any of a list of actions of a target
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: Position, the index of the action target in the scene
* * @param: Types, an array of action types
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomSceneWithAnyActionForTarget(Actor[] Actors, int Position, string[] Types) Global Native

;/* GetRandomSceneWithAnyActionForTargetCSV
* * same as GetRandomSceneWithAnyActionForTarget, except types are passed as csv-string
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: Position, the index of the action target in the scene
* * @param: Types, a csv-string of action types
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomSceneWithAnyActionForTargetCSV(Actor[] Actors, int Position, string Types) Global Native

;/* GetRandomSceneWithAllActionsForTarget
* * returns a random scene applicable for the actors with all of a list of actions of a target
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: Position, the index of the action target in the scene
* * @param: Types, an array of action types
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomSceneWithAllActionsForTarget(Actor[] Actors, int Position, string[] Types) Global Native

;/* GetRandomSceneWithAllActionsForTargetCSV
* * same as GetRandomSceneWithAllActionsForTarget, except types are passed as csv-string
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: Position, the index of the action target in the scene
* * @param: Types, a csv-string of action types
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomSceneWithAllActionsForTargetCSV(Actor[] Actors, int Position, string Types) Global Native


;/* GetRandomFurnitureSceneWithActionForTarget
* * returns a random furniture scene applicable for the actors with an action of a target
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: FurnitureType, the type of furniture for the scene
* * @param: Position, the index of the action target in the scene
* * @param: Type, the action type
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomFurnitureSceneWithActionForTarget(Actor[] Actors, string FurnitureType, int Position, string Type) Global Native

;/* GetRandomFurnitureSceneWithAnyActionForTarget
* * returns a random furniture scene applicable for the actors with any of a list of actions of a target
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: FurnitureType, the type of furniture for the scene
* * @param: Position, the index of the action target in the scene
* * @param: Types, an array of action types
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomFurnitureSceneWithAnyActionForTarget(Actor[] Actors, string FurnitureType, int Position, string[] Types) Global Native

;/* GetRandomFurnitureSceneWithAnyActionForTargetCSV
* * same as GetRandomFurnitureSceneWithAnyActionForTarget, except types are passed as csv-string
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: FurnitureType, the type of furniture for the scene
* * @param: Position, the index of the action target in the scene
* * @param: Types, a csv-string of action types
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomFurnitureSceneWithAnyActionForTargetCSV(Actor[] Actors, string FurnitureType, int Position, string Types) Global Native

;/* GetRandomFurnitureSceneWithAllActionsForTarget
* * returns a random furniture scene applicable for the actors with all of a list of actions of a target
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: FurnitureType, the type of furniture for the scene
* * @param: Position, the index of the action target in the scene
* * @param: Types, an array of action types
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomFurnitureSceneWithAllActionsForTarget(Actor[] Actors, string FurnitureType, int Position, string[] Types) Global Native

;/* GetRandomFurnitureSceneWithAllActionsForTargetCSV
* * same as GetRandomFurnitureSceneWithAllActionsForTarget, except types are passed as csv-string
* *
* * @param: Actors, the actors the check scene conditions against
* * @param: FurnitureType, the type of furniture for the scene
* * @param: Position, the index of the action target in the scene
* * @param: Types, a csv-string of action types
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomFurnitureSceneWithAllActionsForTargetCSV(Actor[] Actors, string FurnitureType, int Position, string Types) Global Native

; ██████╗ ██╗   ██╗    ███████╗██╗   ██╗██████╗ ███████╗██████╗ ██╗      ██████╗  █████╗ ██████╗ 
; ██╔══██╗╚██╗ ██╔╝    ██╔════╝██║   ██║██╔══██╗██╔════╝██╔══██╗██║     ██╔═══██╗██╔══██╗██╔══██╗
; ██████╔╝ ╚████╔╝     ███████╗██║   ██║██████╔╝█████╗  ██████╔╝██║     ██║   ██║███████║██║  ██║
; ██╔══██╗  ╚██╔╝      ╚════██║██║   ██║██╔═══╝ ██╔══╝  ██╔══██╗██║     ██║   ██║██╔══██║██║  ██║
; ██████╔╝   ██║       ███████║╚██████╔╝██║     ███████╗██║  ██║███████╗╚██████╔╝██║  ██║██████╔╝
; ╚═════╝    ╚═╝       ╚══════╝ ╚═════╝ ╚═╝     ╚══════╝╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚═════╝ 

;/* GetRandomSceneSuperloadCSV
* * returns a random scene matching the given conditions
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
* *
* * @return: the id of a matching random scene, "" if no scene was found
*/;
string Function GetRandomSceneSuperloadCSV(Actor[] Actors, string FurnitureType = "", string AnySceneTag = "", string AllSceneTags = "", string AnyActorTagForAny = "", string AnyActorTagForAll = "", string AllActorTagsForAny = "", string AllActorTagsForAll = "", string AnyActionType = "", string AnyActionActor = "", string AnyActionTarget = "", string AnyActionPerformer = "", string AnyActionMatesAny = "", string AnyActionMatesAll = "", string AnyActionParticipantAny = "", string AnyActionParticipantAll = "", string AllActionTypes = "", string AllActionActors = "", string AllActionTargets = "", string AllActionPerformers = "", string AllActionMatesAny = "", string AllActionMatesAll = "", string AllActionParticipantsAny = "", string AllActionParticipantsAll = "") Global Native