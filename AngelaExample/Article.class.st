Class {
	#name : #Article,
	#superclass : #Object,
	#instVars : [
		'image',
		'name',
		'price',
		'weight'
	],
	#category : #AngelaExample
}

{ #category : #accessing }
Article >> image [
	^ image
]

{ #category : #accessing }
Article >> image: aPhoto [
	image := aPhoto
]

{ #category : #initialize }
Article >> initialize [
	super initialize
]

{ #category : #accessing }
Article >> name [
	^ name
]

{ #category : #accessing }
Article >> name: aText [
	name := aText
]

{ #category : #accessing }
Article >> price [
	^ price
]

{ #category : #accessing }
Article >> price: aNumber [
	price := aNumber
]

{ #category : #accessing }
Article >> weight [
	^ weight
]

{ #category : #accessing }
Article >> weight: aNumber [
	weight := aNumber
]
