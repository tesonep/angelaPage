Class {
	#name : #ShopTest,
	#superclass : #TestCase,
	#category : #AngelaProject
}

{ #category : #tests }
ShopTest >> testAddingAProduct [
	|aShop|
	
	aShop := Shop new.
	aShop addArticle:
			(Article new
				name: 'Red Yoyo';
				price: 10;
				weight: 0.5;
				yourself).
				
	self assert: aShop articles size equals: 1
]

{ #category : #tests }
ShopTest >> testFilteringANonExistingProductReturnsEmpty [
	|aShop|
	
	aShop := Shop new.
	aShop addArticle:
			(Article new
				name: 'Red Yoyo';
				price: 10;
				weight: 0.5;
				yourself).

	aShop addArticle:
			(Article new
				name: 'Blue Yoyo';
				price: 10;
				weight: 0.5;
				yourself).
				
	self assert: aShop articles size equals: 2.
	self assert: (aShop filter: 'green') size equals: 0
]

{ #category : #tests }
ShopTest >> testFilteringAllCapitalShouldReturnTheRedYoyo [
	|aShop|
	
	aShop := Shop new.
	aShop addArticle:
			(Article new
				name: 'Red Yoyo';
				price: 10;
				weight: 0.5;
				yourself).

	aShop addArticle:
			(Article new
				name: 'Blue Yoyo';
				price: 10;
				weight: 0.5;
				yourself).
				
	self assert: aShop articles size equals: 2.
	self assert: (aShop filter: 'RED') size equals: 1
]

{ #category : #tests }
ShopTest >> testFilteringFindTextInbetween [

	| aShop |
	aShop := Shop new.
	aShop
		addArticle:
			(Article new
				name: 'Red Yoyo';
				price: 10;
				weight: 0.5;
				yourself).
	aShop
		addArticle:
			(Article new
				name: 'Blue Yoyo';
				price: 10;
				weight: 0.5;
				yourself).
				
	self assert: aShop articles size equals: 2.
	self assert: (aShop filter: 'u') size equals: 1 
]

{ #category : #tests }
ShopTest >> testFilteringLowercaseShouldReturnTheRedYoyo [
	|aShop|
	
	aShop := Shop new.
	aShop addArticle:
			(Article new
				name: 'Red Yoyo';
				price: 10;
				weight: 0.5;
				yourself).

	aShop addArticle:
			(Article new
				name: 'Blue Yoyo';
				price: 10;
				weight: 0.5;
				yourself).
				
	self assert: aShop articles size equals: 2.
	self assert: (aShop filter: 'red') size equals: 1
]

{ #category : #tests }
ShopTest >> testFilteringShouldReturnTheRedYoyo [
	|aShop|
	
	aShop := Shop new.
	aShop addArticle:
			(Article new
				name: 'Red Yoyo';
				price: 10;
				weight: 0.5;
				yourself).

	aShop addArticle:
			(Article new
				name: 'Blue Yoyo';
				price: 10;
				weight: 0.5;
				yourself).
				
	self assert: aShop articles size equals: 2.
	self assert: (aShop filter: 'Red') size equals: 1
]
