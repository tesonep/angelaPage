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
CheckOutComponent >> myShoppingCart [
	^ myShoppingCart
]

{ #category : #accessing }
CheckOutComponent >> myShoppingCart: anObject [
	myShoppingCart := anObject
]

{ #category : #removing }
CheckOutComponent >> removeArticle: anArticle [
	
	myShoppingCart removeArticle: anArticle.
	
]

{ #category : #rendering }
CheckOutComponent >> renderContentOn: html [
	| headerBlock tableBlock |
	headerBlock := self tableHeader: html.
	tableBlock := [ html tableHead: headerBlock.
	self tableBody: html ].
	html div 
	id: 'shopping_cart_table';
	with: [ html tbsContainer
		with: [ html heading
					style: 'text-align: center';
					level2;
					with: 'Your Shopping Cart'.
				html div
					with: [ html tbsTable
							beBordered;
							with: tableBlock.
						html
							tbsForm: [ html tbsButton
									callback: [ self goToPayment ];
									with: 'Check Out' ] ] ] ].

						
	
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
