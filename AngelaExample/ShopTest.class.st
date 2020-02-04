Class {
	#name : #ShopTest,
	#superclass : #TestCase,
	#category : #AngelaExample
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
