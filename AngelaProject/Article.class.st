Class {
	#name : #Article,
	#superclass : #Object,
	#instVars : [
		'image',
		'name',
		'price',
		'weight',
		'additionalClass'
	],
	#category : #AngelaProject
}

{ #category : #initialization }
Article class >> exampleArticles [
	Article new
		image: #image3Jpg;
		name: 'Fence Sign Reach';
		price: 8.50;
		weight: 2;
		additionalClass: 'large';
		save.
	Article new
		image: #image4Jpg;
		name: 'Green Grass Line';
		price: 8.50;
		weight: 2;
		additionalClass: '';
		save.
	Article new
		image: #image5Jpg;
		name: 'Fill Outline';
		price: 8.50;
		weight: 2;
		additionalClass: 'large';
		save.
	Article new
		image: #image6Jpg;
		name: 'Bollard Bag Black Grey';
		price: 8.50;
		weight: 2;
		additionalClass: 'small';
		save.
	Article new
		image: #image7Jpg;
		name: 'Three Shutters';
		price: 8.50;
		weight: 2;
		additionalClass: 'small';
		save.
	Article new
		image: #image8Jpg;
		name: 'Green Bag White Wall';
		price: 8.50;
		weight: 2;
		additionalClass: '' save.
	Article new
		image: #image9Jpg;
		name: 'Temporary Barrier Bin';
		price: 8.50;
		weight: 2;
		additionalClass: 'large';
		save
]

{ #category : #testing }
Article class >> isVoyageRoot [
	^ true
]

{ #category : #initialization }
Article class >> setUpConnection [
	| repository |
	repository := VOMongoRepository
		host: 'localhost'
		database: 'AngelaProject'.
	repository enableSingleton
]

{ #category : #accessing }
Article >> additionalClass [
	^ additionalClass
]

{ #category : #accessing }
Article >> additionalClass: aClass [
	additionalClass := aClass
]

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
	super initialize.
	additionalClass := ''.
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
