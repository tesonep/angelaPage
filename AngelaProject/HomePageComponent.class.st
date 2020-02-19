Class {
	#name : #HomePageComponent,
	#superclass : #WAComponent,
	#instVars : [
		'showedSection',
		'searchCriteria'
	],
	#category : #AngelaProject
}

{ #category : #testing }
HomePageComponent class >> canBeRoot [

	^ true
]

{ #category : #accessing }
HomePageComponent >> addToCart: anArticle [

| sc |
sc := ShoppingCart new.
sc addArticle: anArticle.
]

{ #category : #accessing }
HomePageComponent >> filter: aString [
	
	^ Shop uniqueInstance filter: aString
]

{ #category : #renderingGrid }
HomePageComponent >> renderArticle: anArticle on: html [
	
	html div 	class: 'photo' , ' ' , anArticle additionalClass;
		with: [ html div class: 'overlay';
							 with: [ html heading level: 2;
														with:[ html anchor callback:[ self addToCart: anArticle ];
																				with:[		html image width: 35; id: 'plusIcon'; url: AngelaLibrary / #'plusPng'].
																							html break.
																						   html span: anArticle name.
																					      html break.
																							html span: '$ ', anArticle price printString ]].
		html image url: AngelaLibrary / anArticle image]
]

{ #category : #renderingGrid }
HomePageComponent >> renderArticles: theShop with: html [
	| articlesToShow |
	(searchCriteria isNil or: [ searchCriteria isEmpty ])
		ifTrue: [ articlesToShow := theShop articles. ]
		ifFalse: [ articlesToShow := theShop filter: searchCriteria ].
	html section
		id: 'articles-list';
		class: 'photos';
		with: [ articlesToShow do: [ :anArticle | self renderArticle: anArticle on: html ] ]
																
]

{ #category : #rendering }
HomePageComponent >> renderContentOn: html [
	| theShop |
	theShop := Shop uniqueInstance.
	
	self renderHeaderOn: html.
	self showedSection = #grid
		ifTrue: [ self renderArticles: theShop with: html ].
	self showedSection = #list
		ifTrue: [ self renderList: theShop with: html ].
	self renderFooterOn: html
]

{ #category : #renderingFoot }
HomePageComponent >> renderFooterOn: html [
	html footer
		with: [ 
			html paragraph: 'Copyright © 2019'.
			html navigation	 with: [  
				html anchor 
					url: 'http://facebook.com';
					with: [ html image url: AngelaLibrary / #iconfacebookSvg ].
				html anchor 
					url: 'http://instagram.com';
					with: [ html image url: AngelaLibrary / #iconinstagramSvg ].
				html anchor 
					url: 'http://twitter.com';
					with: [ html image url: AngelaLibrary / #icontwitterSvg ].
			]
	]
]

{ #category : #renderingHead }
HomePageComponent >> renderHeaderOn: html [
	html
		header: [ 
			self renderLogoOn: html.
			self renderSearchOn: html.
			self renderShoppingCartOn: html.
			self renderNavigationOn: html.
			
			]
]

{ #category : #renderingList }
HomePageComponent >> renderList: theShop with: html [

	html section
		id: 'articles-list';
		class: 'list';
		with: [ theShop articles
				do: [ :e |
					self renderName: e image text: e name , ' $ ' , e price printString  on: html ]]
]

{ #category : #renderingHead }
HomePageComponent >> renderLogoOn: html [
	html heading
		level1;
		with: [ html image url: AngelaLibrary / #logoSvg ]
]

{ #category : #renderingList }
HomePageComponent >> renderName: aFile text: aText on: html [
	html anchor
		url: '#';
		with: [ html span: aText.
			html image url: AngelaLibrary / aFile ]
]

{ #category : #renderingHead }
HomePageComponent >> renderNavigationOn: html [
	html navigation
		with: [ | gridAnchor listAnchor contactAnchor |
			gridAnchor := html anchor.
			self showedSection = #grid
				ifTrue: [ gridAnchor class: 'selected' ].
			gridAnchor
				callback: [ self showedSection: #grid ];
				with: 'Grid'.
				
			listAnchor := html anchor.
			self showedSection = #list
				ifTrue: [ listAnchor class: 'selected' ].
			listAnchor
				callback: [ self showedSection: #list ];
				with: 'List'.
				
			contactAnchor := html anchor.
			self showedSection = #contact
				ifTrue: [ contactAnchor class: 'selected' ].
			contactAnchor
				callback: [ self showedSection: #contact ];
				with: 'Contact' ]
]

{ #category : #renderingHead }
HomePageComponent >> renderResultSpanOn: html [
	^ html span
		id: 'result';
		with: [ (searchCriteria isNil or: [ searchCriteria isEmpty ])
				ifTrue: [ html span: '	Showing all products' ]
				ifFalse: [ html span: '	Showing products contains ' , searchCriteria ] ]
]

{ #category : #renderingHead }
HomePageComponent >> renderSearchOn: html [
	html div
		class: 'searching';
		with: [ html textInput
						id: 'textInput';
						placeholder: 'Search here';
						callback: [ :value | searchCriteria := value ];
						onKeyUp:
							(html jQuery ajax
								serializeThis;
								script: [ :s | 
									s << ((s jQuery id: 'articles-list')
												html: [ :h | self renderArticles: Shop uniqueInstance with: h ]).
								
									s << ((s jQuery id: 'result') html:
												[ :h | self renderResultSpanOn: h ]).
											]).
					self renderResultSpanOn: html ]
]

{ #category : #renderingHead }
HomePageComponent >> renderShoppingCartOn: html [ 
	html anchor
			class:'notification';
			callback:[];
			with: [ html image  
							width:35; 
							url: AngelaLibrary / #'téléchargementPng' . html span class: 'badge'; with:'0'. ] 
				  
				
]

{ #category : #accessing }
HomePageComponent >> showedSection [
	^ showedSection ifNil: [ showedSection := #grid ]
]

{ #category : #accessing }
HomePageComponent >> showedSection: anObject [
	showedSection := anObject
]
