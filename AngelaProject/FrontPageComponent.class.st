Class {
	#name : #FrontPageComponent,
	#superclass : #WAComponent,
	#instVars : [
		'showedSection',
		'searchCriteria',
		'shoppingCart'
	],
	#category : #AngelaProject
}

{ #category : #testing }
FrontPageComponent class >> canBeRoot [

	^ true
]

{ #category : #operations }
FrontPageComponent >> addToCart: anArticle [

^ shoppingCart addArticle: anArticle 
]

{ #category : #operations }
FrontPageComponent >> filter: aString [
	
	^ Shop uniqueInstance filter: aString
]

{ #category : #initialize }
FrontPageComponent >> initialize [ 
	
	super initialize.
	shoppingCart := ShoppingCart new.
	showedSection := #grid.
	searchCriteria := ''.
]

{ #category : #renderingGrid }
FrontPageComponent >> renderArticle: anArticle on: html [
	
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
FrontPageComponent >> renderArticles: theShop with: html [
	| articlesToShow |
	searchCriteria isEmpty
		ifTrue: [ articlesToShow := theShop allArticles. ]
		ifFalse: [ articlesToShow := theShop filter: searchCriteria ].
	html section
		id: 'articles-list';
		class: 'photos';
		with: [ articlesToShow do: [ :anArticle | self renderArticle: anArticle on: html ] ]
																
]

{ #category : #rendering }
FrontPageComponent >> renderContentOn: html [
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
FrontPageComponent >> renderFooterOn: html [
	html footer
		with: [ 
			html paragraph: 'Copyright © 2020'.
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
FrontPageComponent >> renderHeaderOn: html [
	html header
		with: [ 
			html div
				class: 'header1';
				with: [ self renderLogoOn: html.
							self renderNavigationOn: html ].
			html div
				class: 'header2';
				with: [ self renderSearchOn: html.
							self renderShoppingCartOn: html ]]
]

{ #category : #renderingList }
FrontPageComponent >> renderList: theShop with: html [

	html section
		id: 'articles-list';
		class: 'list';
		with: [ theShop allArticles
				do: [ :e |
					self renderName: e image text: e name , ' $ ' , e price printString  on: html ]]
]

{ #category : #renderingHead }
FrontPageComponent >> renderLogoOn: html [
	html heading
		level1;
		with: [ html image url: AngelaLibrary / #logoSvg ]
]

{ #category : #renderingList }
FrontPageComponent >> renderName: aFile text: aText on: html [
	html anchor
		url: '#';
		with: [ html span: aText.
			html image url: AngelaLibrary / aFile ]
]

{ #category : #renderingHead }
FrontPageComponent >> renderNavigationOn: html [
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
FrontPageComponent >> renderResultSpanOn: html [
	^ html span
		id: 'result';
		with: [ (searchCriteria isEmpty)
				ifTrue: [ html span: '	Showing all products' ]
				ifFalse: [ html span: '	Showing products contains ' , searchCriteria ] ]
]

{ #category : #renderingHead }
FrontPageComponent >> renderSearchOn: html [
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
FrontPageComponent >> renderShoppingCartOn: html [ 
	html anchor
			class:'notification';
			callback:[ self showCheckOut ];
			with: [ html image  
								width:35; 
								url: AngelaLibrary / #'téléchargementPng'.
					  html span class: 'badge';
							   with: shoppingCart elementsNumber. ] 
				  
				
]

{ #category : #accessing }
FrontPageComponent >> searchCriteria [
	^ searchCriteria
]

{ #category : #accessing }
FrontPageComponent >> searchCriteria: anObject [
	^ searchCriteria := anObject
]

{ #category : #accessing }
FrontPageComponent >> shoppingCart [
	^ shoppingCart
]

{ #category : #accessing }
FrontPageComponent >> shoppingCart: anObject [
	shoppingCart := anObject
]

{ #category : #operations }
FrontPageComponent >> shoppingCartPage [
	^ CheckOutComponent new
		myShoppingCart: self shoppingCart;
		yourself
]

{ #category : #operations }
FrontPageComponent >> showCheckOut [
	self call: self shoppingCartPage
]

{ #category : #accessing }
FrontPageComponent >> showedSection [
	^ showedSection
]

{ #category : #accessing }
FrontPageComponent >> showedSection: anObject [
	showedSection := anObject
]
