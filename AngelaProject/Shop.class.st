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

{ #category : #initialization }
Shop >> addArticle: aProduct [

  allArticles add: aProduct 
]

{ #category : #accessing }
Shop >> articles [
	
	^ allArticles
]

{ #category : #accessing }
Shop >> filter: aString [

	^ self articles select: [ :e | (e name asLowercase) includesSubstring: aString asLowercase ]
]

{ #category : #initialization }
Shop >> initialize [ 

	super initialize.
	allArticles  := OrderedCollection new
]

{ #category : #initialization }
Shop >> removeArticle: aProduct [

  allArticles remove: aProduct 
]
