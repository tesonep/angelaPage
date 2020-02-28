Class {
	#name : #Shop,
	#superclass : #Object,
	#instVars : [
		'allArticles'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #AngelaProject
}

{ #category : #accessing }
Shop class >> createShop [

	uniqueInstance := Shop new
]

{ #category : #accessing }
Shop class >> uniqueInstance [ 
	
	^ uniqueInstance 
]

{ #category : #operations }
Shop >> addArticle: aProduct [

  allArticles add: aProduct 
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
