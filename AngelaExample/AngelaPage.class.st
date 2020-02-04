Class {
	#name : #AngelaPage,
	#superclass : #WAComponent,
	#instVars : [
		'section'
	],
	#category : #AngelaExample
}

{ #category : #testing }
AngelaPage class >> canBeRoot [

	^ true
]

{ #category : #rendering }
AngelaPage >> renderContentOn: html [ 

	self renderHeaderOn: html.
	self renderPhotoSection: html.
	self renderFooter: html
	
]

{ #category : #rendering }
AngelaPage >> renderFooter: html [
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

	html header: [  
		html heading 
			level1;
			with: [ html image url: (AngelaLibrary / #logoSvg) ].
			
		html navigation with: [  | gridAnchor listAnchor contactAnchor|
			gridAnchor := html anchor.
			self section = #grid ifTrue: [ gridAnchor class: 'selected' ].
			gridAnchor
				callback: [ self section: #grid ];
				with: 'Grid'.

			listAnchor := html anchor.
			self section = #list ifTrue: [ listAnchor class: 'selected' ].
			listAnchor
				callback: [ self section: #list ];
				with: 'List'.

			contactAnchor := html anchor.
			self section = #contact ifTrue: [ contactAnchor class: 'selected' ].
			contactAnchor
				callback: [ self section: #contact ];
				with: 'Contact'.
				
				
		]].
]

{ #category : #'as yet unclassified' }
AngelaPage >> renderPhotoSection: html [ 

]

{ #category : #accessing }
AngelaPage >> section [
	^ section ifNil: [ section := #grid ]
]

{ #category : #accessing }
AngelaPage >> section: anObject [
	section := anObject
]
