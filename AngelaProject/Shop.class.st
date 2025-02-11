Class {
	#name : #Shop,
	#superclass : #Object,
	#instVars : [
		'allArticles'
	],
	#category : #AngelaProject
}

{ #category : #testing }
Shop class >> bootstrapDatabase [
	<example>
	| repo |
	repo := VOMongoRepository database: 'Shop'.
	repo enableSingleton.
	Article exampleArticles.
	Article selectAll do: [ :a | self uniqueInstance addArticle: a ]
]

{ #category : #testing }
Shop class >> isVoyageRoot [
	^ true
]

{ #category : #accessing }
Shop class >> uniqueInstance [
	^ Shop selectAll
		ifEmpty: [ Shop new
				save;
				yourself ]
		ifNotEmpty: [ :sl | sl first ]
]

{ #category : #operations }
Shop >> addArticle: aProduct [

  allArticles add: aProduct.
  self save. "save to mongoDB"
]

{ #category : #accessing }
Shop >> allArticles [
	
	^ allArticles
]

{ #category : #accessing }
Shop >> allArticles: anObject [
	allArticles := anObject
]

{ #category : #operations }
Shop >> filter: aString [

	^ self allArticles select: [ :e | (e name asLowercase) includesSubstring: aString asLowercase ]
]

{ #category : #initialization }
Shop >> initialize [ 

	super initialize.
	allArticles  := OrderedCollection new
]

{ #category : #operations }
Shop >> removeArticle: aProduct [

  allArticles remove: aProduct 
]
