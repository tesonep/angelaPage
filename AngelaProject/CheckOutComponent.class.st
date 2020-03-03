Class {
	#name : #CheckOutComponent,
	#superclass : #WAComponent,
	#instVars : [
		'articles',
		'client'
	],
	#category : #AngelaProject
}

{ #category : #removing }
CheckOutComponent >> removeArticle: anArticle [
	
	client removeArticle: anArticle.
	
]

{ #category : #rendering }
CheckOutComponent >> renderContentOn: html [
	
	html tbsContainer
		with: [ html heading
				style: 'text-align: center';
				level: 2;
				with: 'Your Shopping Cart'.
			html div
				with: [ html
						tbsForm: [ html tbsButton
								callback: [ self checkOutPayment ];
								beLight;
								with: 'Check Out'.
				] ] ]
]

{ #category : #'tags-tables' }
CheckOutComponent >> tableBody: html [
	^ html
		tableBody: [ articles do: [ :anArticle | 
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
			html tableHeading: ' Edit '.
			html tableHeading: ' Remove' ]
]
