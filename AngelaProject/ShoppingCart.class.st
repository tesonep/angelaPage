Class {
	#name : #ShoppingCart,
	#superclass : #Object,
	#instVars : [
		'articles',
		'total',
		'basicDeliveryPrice',
		'extraDeliveryPrice',
		'deliveryPricePerKgOver10kg'
	],
	#category : #AngelaProject
}

{ #category : #operations }
ShoppingCart >> addArticle: anArticle [
	articles add: anArticle
]

{ #category : #charge }
ShoppingCart >> delivery [
	| delivery totalWeight |
	delivery := 0.
	totalWeight := self weightTotal.
	totalWeight < 5
		ifTrue: [ delivery := basicDeliveryPrice ].
	(totalWeight >= 5 and: totalWeight <= 10)
		ifTrue: [ delivery := basicDeliveryPrice + extraDeliveryPrice ].
	totalWeight > 10
		ifTrue: [ delivery := basicDeliveryPrice + extraDeliveryPrice
				+ ((totalWeight - 10) * deliveryPricePerKgOver10kg) ].
	^ delivery
]

{ #category : #initialize }
ShoppingCart >> initialize [
	super initialize.
	articles := OrderedCollection new.
	basicDeliveryPrice := 2.
	extraDeliveryPrice := 5.
	deliveryPricePerKgOver10kg := 1.
]

{ #category : #operations }
ShoppingCart >> removeArticle: anArticle [
	articles remove: anArticle
]

{ #category : #charge }
ShoppingCart >> subTotal [
	| subTotal |
	subTotal := 0.
	articles do: [ :e | subTotal := subTotal + e price ].
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
