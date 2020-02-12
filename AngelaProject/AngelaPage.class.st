Class {
	#name : #AngelaPage,
	#superclass : #WAComponent,
	#instVars : [
		'showedSection',
		'searchCriteria'
	],
	#category : #AngelaProject
}

{ #category : #testing }
AngelaPage class >> canBeRoot [

	^ true
]

{ #category : #accessing }
AngelaPage >> filter: aString [
	
	^ Shop uniqueInstance filter: aString
]

{ #category : #rendering }
AngelaPage >> renderContentOn: html [
	| theShop |
	theShop := Shop uniqueInstance.
	
	self renderHeaderOn: html.
	self showedSection = #grid
		ifTrue: [ self renderPhotos: theShop with: html ].
	self showedSection = #list
		ifTrue: [ self renderList: theShop with: html ].
	self renderFooterOn: html
]

{ #category : #renderingFoot }
AngelaPage >> renderFooterOn: html [
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
AngelaPage >> renderHeaderOn: html [
	html
		header: [ 
			self renderLogoOn: html.
			self renderSearchOn: html.
			self renderNavigationOn: html 
			]
]

{ #category : #renderingList }
AngelaPage >> renderList: theShop with: html [

	html section
		id: 'articles-list';
		class: 'list';
		with: [ theShop articles
				do: [ :e |
					self renderName: e image text: e name , ' $ ' , e price printString  on: html ]]
]

{ #category : #renderingHead }
AngelaPage >> renderLogoOn: html [
	html heading
		level1;
		with: [ html image url: AngelaLibrary / #logoSvg ]
]

{ #category : #renderingList }
AngelaPage >> renderName: aFile text: aText on: html [
	html anchor
		url: '#';
		with: [ html span: aText.
			html image url: AngelaLibrary / aFile ]
]

{ #category : #renderingHead }
AngelaPage >> renderNavigationOn: html [
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

{ #category : #renderingGrid }
AngelaPage >> renderPhoto: aFile text: aText price: aPrice additionalClass: additionalClass on: html [

	html div
		class: 'photo' , ' ' , additionalClass;
		with: [ 
			html div
				class: 'overlay';
				with: [ html heading
						level: 2;
						with: [
							html span: aText.
					      html break.
							html span: '$ ', aPrice printString.
						]
					].
			html image url: AngelaLibrary / aFile ]
]

{ #category : #renderingGrid }
AngelaPage >> renderPhotos: theShop with: html [
	
	| articlesToShow |

	(searchCriteria isNil or: [ searchCriteria isEmpty ])
		ifTrue: [ articlesToShow := theShop articles. ]
		ifFalse: [ articlesToShow := theShop filter: searchCriteria ].

	html section
		id: 'articles-list';
		class: 'photos';
		with: [ 
			articlesToShow
				do: [ :e | 
					self
						renderPhoto: e image
						text: e name
						price: e price
						additionalClass: e additionalClass
						on: html ] ]
]

{ #category : #renderingHead }
AngelaPage >> renderResultSpanOn: html [
	^ html span
		id: 'result';
		with: [ (searchCriteria isNil or: [ searchCriteria isEmpty ])
				ifTrue: [ html span: '	Showing all products' ]
				ifFalse: [ html span: '	Showing products contains ' , searchCriteria ] ]
]

{ #category : #renderingHead }
AngelaPage >> renderSearchOn: html [
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
												html: [ :h | self renderPhotos: Shop uniqueInstance with: h ]).
								
									s << ((s jQuery id: 'result') html:
												[ :h | self renderResultSpanOn: h ]).
											]).
					self renderResultSpanOn: html ]
]

{ #category : #accessing }
AngelaPage >> showedSection [
	^ showedSection ifNil: [ showedSection := #grid ]
]

{ #category : #accessing }
AngelaPage >> showedSection: anObject [
	showedSection := anObject
]
