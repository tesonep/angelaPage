Class {
	#name : #ShoppingCart,
	#superclass : #Object,
	#instVars : [
		'articles',
		'badge'
	],
	#category : #AngelaProject
}

{ #category : #operations }
ShoppingCart >> addArticle: anArticle [
	articles add: anArticle
]

{ #category : #charge }
ShoppingCart >> basicDeliveryPrice [
	^ 2
]

{ #category : #charge }
ShoppingCart >> delivery [
	| delivery totalWeight|
	delivery := 0.
	totalWeight := self weightTotal.
	totalWeight < 5
		ifTrue: [ delivery := self basicDeliveryPrice].
	(totalWeight >= 5 and: totalWeight <= 10)
		ifTrue: [ delivery := self basicDeliveryPrice + self extraDeliveryPrice ].
	totalWeight > 10
		ifTrue: [ delivery := self basicDeliveryPrice + self extraDeliveryPrice
				+ ((totalWeight - 10) * self deliveryPricePerKgOver10kg) ].
	^ delivery
]

{ #category : #charge }
ShoppingCart >> deliveryPricePerKgOver10kg [
	^ 1
]

{ #category : #operations }
ShoppingCart >> elementsNumber [

	^ articles size
]

{ #category : #charge }
ShoppingCart >> extraDeliveryPrice [
	^ 5
]

{ #category : #initialize }
ShoppingCart >> initialize [
	super initialize.
	articles := OrderedCollection new.

]

{ #category : #operations }
ShoppingCart >> removeArticle: anArticle [
	articles remove: anArticle
]

{ #category : #charge }
ShoppingCart >> subTotal [
	| subTotal |
	subTotal := 0.
	articles do: [ :article | subTotal := subTotal + article price ].
	^ subTotal
]

{ #category : #charge }
ShoppingCart >> total [
	self subTotal = 0
		ifTrue: [ ^ 0 ]
		ifFalse: [ ^ self subTotal + self delivery ]
]

{ #category : #charge }
ShoppingCart >> weightTotal [
	| weightTotal |
	weightTotal := 0.
	articles do: [ :e | weightTotal := weightTotal + e weight ].
	^ weightTotal	
]
