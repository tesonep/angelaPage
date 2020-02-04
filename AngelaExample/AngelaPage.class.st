Class {
	#name : #AngelaPage,
	#superclass : #WAComponent,
	#instVars : [
		'showedSection'
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
					
				html div 
					class: 'photo';
					with: [ 
						html div
							class:'overlay';
							with:[
								html heading level:2; with:'Green Grass Line' ].
						html image url: (AngelaLibrary / #image4Jpg )	].
						
				html div		
					class: 'photo large';
					with: [ 
						html div 
							class: 'overlay';
							with:[
								html heading level:2; with: 'Fill Outline' ].
						html image url: (AngelaLibrary / #image5Jpg ) ].
						
				html div		
					class: 'photo small';
					with: [ 
						html div 
							class: 'overlay';
							with:[
								html heading level:2; with: 'Bollard Bag Black Grey' ].
						html image url: (AngelaLibrary / #image6Jpg ) ].		
					
				html div		
					class: 'photo small';
					with: [ 
						html div 
							class: 'overlay';
							with:[
								html heading level:2; with: 'Three Shutters' ].
						html image url: (AngelaLibrary / #image7Jpg ) ].	
				
				html div		
					class: 'photo';
					with: [ 
						html div 
							class: 'overlay';
							with:[
								html heading level:2; with: 'Green Bag White Wall' ].
						html image url: (AngelaLibrary / #image8Jpg ) ].	
				
				html div		
					class: 'photo large';
					with: [ 
						html div 
							class: 'overlay';
							with:[
								html heading level:2; with: 'Temporary Barrier Bin' ].
						html image url: (AngelaLibrary / #image9Jpg ) ].	
						
						
									
						
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
