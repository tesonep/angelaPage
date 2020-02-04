Class {
	#name : #AngelaPage,
	#superclass : #WAComponent,
	#instVars : [
		'showedSection'
	],
	#category : #AngelaProject
}

{ #category : #testing }
AngelaPage class >> canBeRoot [

	^ true
]

{ #category : #rendering }
AngelaPage >> renderContentOn: html [ 

	self renderHeaderOn: html.
	
	self showedSection = #grid
		ifTrue: [self renderPhotoSection: html].

	self showedSection = #list
		ifTrue: [self renderListSection: html].

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
			self showedSection = #grid ifTrue: [ gridAnchor class: 'selected' ].
			gridAnchor
				callback: [ self showedSection: #grid ];
				with: 'Grid'.

			listAnchor := html anchor.
			self showedSection = #list ifTrue: [ listAnchor class: 'selected' ].
			listAnchor
				callback: [ self showedSection: #list ];
				with: 'List'.

			contactAnchor := html anchor.
			self showedSection = #contact ifTrue: [ contactAnchor class: 'selected' ].
			contactAnchor
				callback: [ self showedSection: #contact ];
				with: 'Contact'.
				
				
		]].
]

{ #category : #rendering }
AngelaPage >> renderListSection: html [

	html section
		class: 'list';
		with: [ 
			
				self renderName: (AngelaLibrary / #image1Jpg ) text: 'Black Line Yellow Box' on: html.
				self renderName: (AngelaLibrary / #image2Jpg ) text: 'Desk Flowers' on: html.
				self renderName: (AngelaLibrary / #image3Jpg ) text: 'Fence Sign Reach' on: html.
			   self renderName: (AngelaLibrary / #image4Jpg ) text: 'Green Grass Line' on: html.
				self renderName: (AngelaLibrary / #image5Jpg ) text: 'Fill Outline' on: html.
				self renderName: (AngelaLibrary / #image6Jpg ) text: 'Bollard Bag Black Grey' on: html.
				self renderName: (AngelaLibrary / #image7Jpg ) text: 'Three Shutters' on: html.
			   self renderName: (AngelaLibrary / #image8Jpg ) text: 'Green Bag White Wall' on: html.
				self renderName: (AngelaLibrary / #image9Jpg ) text: 'Temporary Barrier Bin' on: html.				
			
			]
]

{ #category : #rendering }
AngelaPage >> renderName: aFile text: aText on: html [
	html anchor
		url: '#';
		with: [ html span: aText.
			html image url: aFile ]
]

{ #category : #'as yet unclassified' }
AngelaPage >> renderPhoto: aFile text: aText additionalClass: additionalClass on: html [

	html div
		class: 'photo' , ' ' , additionalClass;
		with: [ html div
				class: 'overlay';
				with: [ html heading
						level: 2;
						with: aText ].
			html image url: aFile ]
]

{ #category : #'as yet unclassified' }
AngelaPage >> renderPhotoSection: html [ 

	html section 
		class: 'photos';
		with: [  

				self renderPhoto: (AngelaLibrary / #image1Jpg ) text: 'Black Line Yellow Box' additionalClass: '' on: html.
				self renderPhoto: (AngelaLibrary / #image2Jpg ) text: 'Desk Flowers' additionalClass: 'small' on: html.
				self renderPhoto: (AngelaLibrary / #image3Jpg ) text: 'Fence Sign Reach' additionalClass: 'large' on: html.
			   self renderPhoto: (AngelaLibrary / #image4Jpg ) text: 'Green Grass Line' additionalClass: ''	on: html.
				self renderPhoto: (AngelaLibrary / #image5Jpg ) text: 'Fill Outline' additionalClass: 'large' on: html.
				self renderPhoto: (AngelaLibrary / #image6Jpg ) text: 'Bollard Bag Black Grey' additionalClass: 'small' on: html.
				self renderPhoto: (AngelaLibrary / #image7Jpg ) text: 'Three Shutters' additionalClass: 'small' on: html.
			   self renderPhoto: (AngelaLibrary / #image8Jpg ) text: 'Green Bag White Wall' additionalClass: ''	on: html.
				self renderPhoto: (AngelaLibrary / #image9Jpg ) text: 'Temporary Barrier Bin' additionalClass: 'large'	on: html.				
		
		]
    

]

{ #category : #accessing }
AngelaPage >> showedSection [
	^ showedSection ifNil: [ showedSection := #grid ]
]

{ #category : #accessing }
AngelaPage >> showedSection: anObject [
	showedSection := anObject
]
