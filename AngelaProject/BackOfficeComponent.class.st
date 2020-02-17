Class {
	#name : #BackOfficeComponent,
	#superclass : #WAComponent,
	#instVars : [
		'content'
	],
	#category : #AngelaProject
}

{ #category : #testing }
BackOfficeComponent class >> canBeRoot [
	^ true
]

{ #category : #rendering }
BackOfficeComponent >> initialize [ 
	super initialize.
	self showArticleList 
]

{ #category : #rendering }
BackOfficeComponent >> renderContentOn: html [
	html tbsContainer
		with: [ html heading
						style: 'text-align: center';
						level: 2;
						with: 'All Product List'.
				  html div
						with: [ html tbsForm: [
									html tbsButton
										callback: [self showAddArticle ];
										beLight;
										with: [ html tbsGlyphIcon iconPlus ]].
          		html render: content	] ]
]

{ #category : #rendering }
BackOfficeComponent >> showAddArticle [
	content := ArticleAddComponent new 
		backOfficeComponent: self;
		yourself
]

{ #category : #rendering }
BackOfficeComponent >> showArticleList [
	| articles |
	articles := Shop uniqueInstance articles.
	content := ArticleTableComponent new
		articles: articles;
		backOfficeComponent: self;
		yourself
]

{ #category : #'as yet unclassified' }
BackOfficeComponent >> showEditArticle: anArticle [
	content := ArticleEditComponent new 
		article: anArticle;
		backOfficeComponent: self;
		yourself.
	
]
