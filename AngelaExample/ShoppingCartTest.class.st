Class {
	#name : #ShoppingCartTest,
	#superclass : #TestCase,
	#instVars : [
		'aShoppingCart'
	],
	#category : #AngelaExample
}

{ #category : #tests }
ShoppingCartTest >> setUp [
	super setUp.
	aShoppingCart := ShoppingCart new
]

{ #category : #tests }
ShoppingCartTest >> testAddOneProductToBasket [
	| anArticle |
	anArticle := Article new.
	anArticle name: 'yoyo-red'.
	anArticle price: 10.
	anArticle weight: 20.
	aShoppingCart addArticle: anArticle.
	self assert: aShoppingCart subTotal equals: 10
]

{ #category : #tests }
ShoppingCartTest >> testAddOneProductWithDelivery [
	| anArticle |
	anArticle := Article new.
	anArticle name: 'yoyo-red'.
	anArticle price: 10.
	anArticle weight: 2.
	aShoppingCart addArticle: anArticle.
	self assert: aShoppingCart total equals: 12
]

{ #category : #tests }
ShoppingCartTest >> testAddTwoProductToBasket [
	| aProduct bProduct |
	aProduct := Article new
		name: 'yoyo-red';
		price: 10;
		weight: 5.
	bProduct := Article new
		name: 'yoyo-blue';
		price: 10;
		weight: 10.
		
	aShoppingCart addArticle: aProduct.
	aShoppingCart addArticle: bProduct.
	self assert: aShoppingCart subTotal equals: 20
]

{ #category : #tests }
ShoppingCartTest >> testAddTwoProductWithDelivery [
	| aProduct  bProduct |
	aProduct := Article new name: 'yoyo-red';
	price: 10;
	weight: 2.
	
	bProduct := Article new name: 'yoyo-metal';
	price: 20;
	weight: 3.
	
	aShoppingCart addArticle: aProduct.
	aShoppingCart addArticle: bProduct.
	self assert: aShoppingCart total equals: 37
]

{ #category : #tests }
ShoppingCartTest >> testBasketIsEmpty [
	self assert: aShoppingCart subTotal equals: 0.
	self assert: aShoppingCart total equals: 0.
]

{ #category : #tests }
ShoppingCartTest >> testRemoveWithOneProductLeftInBasket [
	| aProduct bProduct |
	aProduct := Article new 
		name: 'yoyo-red';
		price: 10;
		weight: 2.
	bProduct := Article new
		name: 'yoyo-metal';
		price: 20;
		weight: 3.
	aShoppingCart
		addArticle: aProduct;
		addArticle: bProduct.
	aShoppingCart removeArticle: aProduct.
	
	self assert: aShoppingCart subTotal equals: 20.
	self assert: aShoppingCart total equals: 22
]

{ #category : #tests }
ShoppingCartTest >> testRemoveWithTwoProductLeftInBasket [
	| aProduct bProduct cProduct |
	aProduct := Article new 
		name: 'yoyo-red';
		price: 10;
		weight: 2.
	bProduct := Article new
		name: 'yoyo-metal';
		price: 20;
		weight: 3.
	cProduct := Article new
		name: 'yoyo-green';
		price: 10;
		weight: 2.	
		
	aShoppingCart
		addArticle: aProduct;
		addArticle: bProduct;
		addArticle: cProduct.
	aShoppingCart removeArticle: aProduct.
	
	self assert: aShoppingCart subTotal equals: 30.
	self assert: aShoppingCart total equals: 37
]
