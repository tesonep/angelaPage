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

	uniqueInstance := Shop new.
	Shop uniqueInstance addArticle: (Article new
  image: #image1Jpg ;
  name: 'Black Line Yellow Box';
  price: 8.50;
  weight: 2;
  additionalClass:''
  yourself).

Shop uniqueInstance addArticle: (Article new
  image: #image2Jpg ;
  name: 'Desk Flowers';
  price: 8.50;
  weight: 2;
  additionalClass:'small'
  yourself).

Shop uniqueInstance addArticle: (Article new
  image: #image3Jpg ;
  name: 'Fence Sign Reach';
  price: 8.50;
  weight: 2;
  additionalClass:'large'	
  yourself).

Shop uniqueInstance addArticle: (Article new
  image:  #image4Jpg ;
  name: 'Green Grass Line';
  price: 8.50;
  weight: 2;
  additionalClass:''	
  yourself).
				
Shop uniqueInstance addArticle: (Article new
  image: #image5Jpg ;
  name: 'Fill Outline';
  price: 8.50;
  weight: 2;
  additionalClass:'large'
  yourself).

Shop uniqueInstance addArticle: (Article new
  image: #image6Jpg ;
  name: 'Bollard Bag Black Grey';
  price: 8.50;
  weight: 2;
  additionalClass:'small'
  yourself).

Shop uniqueInstance addArticle: (Article new
  image: #image7Jpg ;
  name: 'Three Shutters';
  price: 8.50;
  weight: 2;
  additionalClass:'small'
  yourself).

Shop uniqueInstance addArticle: (Article new
  image: #image8Jpg ;
  name: 'Green Bag White Wall';
  price: 8.50;
  weight: 2;
  additionalClass:''
  yourself).	
	
Shop uniqueInstance addArticle: (Article new
  image: #image9Jpg ;
  name: 'Temporary Barrier Bin';
  price: 8.50;
  weight: 2;
  additionalClass:'large'
  yourself).				   
				
				
]

{ #category : #accessing }
Shop class >> uniqueInstance [
	^ uniqueInstance ifNil: [ 
		self createShop.
		uniqueInstance 
	]
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
