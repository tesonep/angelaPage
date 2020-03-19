Class {
	#name : #CheckOutComponent,
	#superclass : #WAComponent,
	#instVars : [
		'articles',
		'myShoppingCart'
	],
	#category : #AngelaProject
}

{ #category : #accessing }
CheckOutComponent >> articles [
	^ articles
]

{ #category : #accessing }
CheckOutComponent >> articles: anObject [
	articles := anObject
]

{ #category : #accessing }
CheckOutComponent >> deliveryPrice [
	^ myShoppingCart delivery 
]

{ #category : #rendering }
CheckOutComponent >> goToPayment [
 ^ self answer
]

{ #category : #accessing }
CheckOutComponent >> myShoppingCart [
	^ myShoppingCart
]

{ #category : #accessing }
CheckOutComponent >> myShoppingCart: anObject [
	myShoppingCart := anObject.
	articles := myShoppingCart articles.
]

{ #category : #removing }
CheckOutComponent >> removeArticle: anArticle [
	
	myShoppingCart removeArticle: anArticle.
	
]

{ #category : #rendering }
CheckOutComponent >> renderCheckOutBoxOn: html [
	html div
		id: 'check_out_box';
		with: [ html table
			with:[ html paragraph: 'Subtotal: ', self subtotalPrice asString.
			html break.
			html paragraph 
				id: 'total_border';
				with: 'Delivery: ', self deliveryPrice asString.
			html break.
			html paragraph: 'Total: ', self totalPrice asString]. "cannot concatinate stirng and number so transform number to string with asString"
			html
				tbsForm: [ html tbsButton
						callback: [ self goToPayment ];
						with: 'Check Out' ] ]  
]

{ #category : #rendering }
CheckOutComponent >> renderContentOn: html [
	html div
		id: 'check_out';
		with: [ 
			self renderShoppingCartItemsOn: html.
			self renderCheckOutBoxOn: html ].
	
]

{ #category : #rendering }
CheckOutComponent >> renderShoppingCartItemsOn: html [
	| headerBlock tableBlock |
	headerBlock := self tableHeader: html.
	tableBlock := [ html tableHead: headerBlock.
	self tableBody: html ].
	html div
		id: 'shopping_cart_table';
		with: [ html heading
				style: 'text-align: center';
				level: 2;
				with: 'Your Shopping Cart'.
			html tbsContainer
				with: [ html break.
					html tbsTable: tableBlock ].
			html
				tbsForm: [ html tbsButton
						beInfo;
						callback: [ self returnToFrontPage ];
						with: 'Continue To Shopping' ] ]
]

{ #category : #rendering }
CheckOutComponent >> returnToFrontPage [

	^ self answer
]

{ #category : #accessing }
CheckOutComponent >> subtotalPrice [

	^ myShoppingCart subTotal.
	
	
	
"error: CheckOutComponent is indexable"
]

{ #category : #rendering }
CheckOutComponent >> tableBody: html [
	^ html
		tableBody: [ self myShoppingCart articles do: [ :anArticle | 
					html tableRow: [ 	html tableData: anArticle name.
										  	html tableData: anArticle price.
											html tableData: anArticle weight.
											html tableData: [ html image width: 80; url: (AngelaLibrary / anArticle image) ].
											html tableData: [ html tbsForm: [html tbsButton
																								callback:[ self removeArticle: anArticle ];
																								beDanger;
																								with: [ html tbsGlyphIcon iconRemove ]] ] ] ] ]
]

{ #category : #rendering }
CheckOutComponent >> tableHeader: html [
	^ [ 	html tableHeading: ' Name '.
			html tableHeading: ' price '.
			html tableHeading: ' Weight '.
			html tableHeading: ' Image '.
			html tableHeading: ' Remove' ]
]

{ #category : #accessing }
CheckOutComponent >> totalPrice [
	^ self subtotalPrice + self deliveryPrice
]
