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

{ #category : #rendering }
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

{ #category : #rendering }
AngelaPage >> renderHeaderOn: html [
	html
		header: [ html heading
				level1;
				with: [ html image url: AngelaLibrary / #logoSvg ].
						
				html textInput
					placeholder: 'Search here';
					callback: [ :value | searchCriteria := value ];
					onKeyUp:
						(html jQuery ajax
							serializeThis;
							script: [ :s | s << ((s jQuery id: 'articles-list') 
									html: [: h | (self renderPhotos: Shop uniqueInstance  with: h ) ])   ]).
							
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
						with: 'Contact' ] ]
]

{ #category : #rendering }
AngelaPage >> renderList: theShop with: html [

	html section
		id: 'articles-list';
		class: 'list';
		with: [ theShop articles
				do: [ :e |
					self renderName: e image text: e name , ' $ ' , e price printString  on: html ]]
]

{ #category : #rendering }
AngelaPage >> renderName: aFile text: aText on: html [
	html anchor
		url: '#';
		with: [ html span: aText.
			html image url: aFile ]
]

{ #category : #rendering }
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
			html image url: aFile ]
]

{ #category : #rendering }
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

{ #category : #accessing }
AngelaPage >> showedSection [
	^ showedSection ifNil: [ showedSection := #grid ]
]

{ #category : #accessing }
AngelaPage >> showedSection: anObject [
	showedSection := anObject
]
