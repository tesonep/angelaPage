Class {
	#name : #ArticleTableComponent,
	#superclass : #WAComponent,
	#instVars : [
		'articles',
		'backOfficeComponent'
	],
	#category : #AngelaProject
}

{ #category : #accessing }
ArticleTableComponent >> articles [
	^ articles
]

{ #category : #accessing }
ArticleTableComponent >> articles: anObject [
	articles := anObject
]

{ #category : #accessing }
ArticleTableComponent >> backOfficeComponent [
	^ backOfficeComponent
]

{ #category : #accessing }
ArticleTableComponent >> backOfficeComponent: anObject [
	backOfficeComponent := anObject
]

{ #category : #accessing }
ArticleTableComponent >> editArticle: anArticle [
 	 backOfficeComponent showEditArticle: anArticle
]

{ #category : #accessing }
ArticleTableComponent >> removeArticle: anArticle [
	| theShop |
	theShop := Shop uniqueInstance.
	theShop removeArticle: anArticle
]

{ #category : #rendering }
ArticleTableComponent >> renderContentOn: html [
	| headerBlock tableBlock |
				
	headerBlock := self tableHeader: html.
	tableBlock := [ html tableHead: headerBlock. self tableBody: html ].
	html tbsTable
		beBordered;
		with: tableBlock.
	
		
	
]

{ #category : #rendering }
ArticleTableComponent >> tableBody: html [
	^ html
		tableBody: [ articles do: [ :anArticle | 
					html tableRow: [ 	html tableData: anArticle name.
										  	html tableData: anArticle price.
											html tableData: anArticle weight.
											html tableData: [ html image width: 80; url: (AngelaLibrary / anArticle image) ].
											html tableData: [ html tbsForm: [ html tbsButton
																								callback:[ self editArticle: anArticle ];
																								beLight;
																								with: [ html tbsGlyphIcon iconEdit ] ]].
											html tableData: [ html tbsForm: [html tbsButton
																								callback:[ self removeArticle: anArticle ];
																								beDanger;
																								with: [ html tbsGlyphIcon iconRemove ]] ] ] ] ]
]

{ #category : #rendering }
ArticleTableComponent >> tableHeader: html [
	^ [ 	html tableHeading: ' Name '.
			html tableHeading: ' price '.
			html tableHeading: ' Weight '.
			html tableHeading: ' Image '.
			html tableHeading: ' Edit '.
			html tableHeading: ' Remove' ]
]
