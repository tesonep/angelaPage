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

{ #category : #initialize }
BackOfficeComponent >> initialize [ 
	super initialize.
	self showArticleTable 
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

{ #category : #contents }
BackOfficeComponent >> showAddArticle [
	content := ArticleAddComponent new 
		backOfficeComponent: self;
		yourself
]

{ #category : #contents }
BackOfficeComponent >> showArticleTable [
	| articles |
	articles := Shop uniqueInstance allArticles.
	content := ArticleTableComponent new
		articles: articles;
		backOfficeComponent: self;
		yourself
]

{ #category : #contents }
BackOfficeComponent >> showEditArticle: anArticle [
	content := ArticleEditComponent new 
		article: anArticle;
		backOfficeComponent: self;
		yourself.
	
]
