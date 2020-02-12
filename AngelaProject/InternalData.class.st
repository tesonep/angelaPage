Class {
	#name : #InternalData,
	#superclass : #WAComponent,
	#instVars : [
		'content'
	],
	#category : #AngelaProject
}

{ #category : #testing }
InternalData class >> canBeRoot [
	^ true
]

{ #category : #rendering }
InternalData >> initialize [ 

	| articles |
	super initialize.
	
	articles := Shop uniqueInstance articles.
	content := IDArticleList new
									articles: articles;
									yourself.

]

{ #category : #rendering }
InternalData >> renderContentOn: html [

	html tbsContainer
		with: [ html heading
				style: 'text-align: center';
				level: 2;
				with: 'All Product List'.
				
				html div
					with: [ 
						html tbsForm: [
							html tbsButton
								callback: [self showAddArticle ];
								beLight;
								with: [ html tbsGlyphIcon iconPlus ]].
							
				html render: content	
				] ]
]

{ #category : #rendering }
InternalData >> showAddArticle [
		
	content := IDAddArticle new
]
