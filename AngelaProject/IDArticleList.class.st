Class {
	#name : #IDArticleList,
	#superclass : #WAComponent,
	#instVars : [
		'articles'
	],
	#category : #AngelaProject
}

{ #category : #accessing }
IDArticleList >> articles [
	^ articles
]

{ #category : #accessing }
IDArticleList >> articles: anObject [
	articles := anObject
]

{ #category : #rendering }
IDArticleList >> renderContentOn: html [
	| headerBlock tableBlock |
						
	headerBlock := self tableHeader: html.
	
	tableBlock := [ html tableHead: headerBlock. self tableBody: html ].

	html tbsTable
		beBordered;
		with: tableBlock.
	
		
	
]

{ #category : #rendering }
IDArticleList >> tableBody: html [
	^ html
		tableBody: [ articles
				do: [ :anArticle | 
					html
						tableRow: [ html tableData: anArticle name.
							html tableData: anArticle price.
							html tableData: anArticle weight.
							html
								tableData: [ html image
										width: 80;
										url: (AngelaLibrary / anArticle image) ].
							html
								tableData: [ html tbsButton
										beLight;
										with: [ html tbsGlyphIcon iconEdit ] ].
							html
								tableData: [ html tbsButton
										beDanger;
										with: [ html tbsGlyphIcon iconRemove ] ] ] ] ]
]

{ #category : #rendering }
IDArticleList >> tableHeader: html [
	^ [ html tableHeading: ' Name '.
	html tableHeading: ' price '.
	html tableHeading: ' Weight '.
	html tableHeading: ' Product Image '.
	html tableHeading: ' Edit '.
	html tableHeading: ' Remove' ]
]
