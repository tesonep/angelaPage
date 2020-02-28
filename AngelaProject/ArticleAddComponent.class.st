Class {
	#name : #ArticleAddComponent,
	#superclass : #WAComponent,
	#instVars : [
		'backOfficeComponent',
		'articleName',
		'articlePrice',
		'articleWeight',
		'articleImage'
	],
	#category : #AngelaProject
}

{ #category : #operations }
ArticleAddComponent >> addArticleToShop [
	| theShop |
	theShop := Shop uniqueInstance.
	theShop addArticle: (Article new
										name: articleName ;
										price: articlePrice ;
										weight: articleWeight ;
										image: articleImage asSymbol).	
	self returnToInternalData.
]

{ #category : #accessing }
ArticleAddComponent >> backOfficeComponent [
	^ backOfficeComponent
]

{ #category : #accessing }
ArticleAddComponent >> backOfficeComponent: anObject [
	backOfficeComponent := anObject
]

{ #category : #rendering }
ArticleAddComponent >> formForAdding: html [
	html tbsFormGroup: [ html textInput
										tbsFormControl;
										id: 'articleName';
										callback: [ :value | articleName := value ];
										placeholder: 'Put article name here' ].
	html tbsFormGroup: [ html textInput
										tbsFormControl;
										id: 'articlePrice';
										callback: [ :value | articlePrice := value ];
										placeholder: 'Put article price here' ].
	html tbsFormGroup: [ html textInput
										tbsFormControl;
										id: 'articleWeight';
										callback: [ :value | articleWeight := value ];
										placeholder: 'Put article weight here' ].
	html tbsFormGroup: [ html textInput
										tbsFormControl;
										id: 'articleImage';
										callback: [ :value | articleImage := value ];
										placeholder: 'Put article image here' ]
]

{ #category : #rendering }
ArticleAddComponent >> renderContentOn: html [ 

	html heading style: 'text-align: center'; level: 2; with: 'Add Article'.
	html tbsForm: [ self formForAdding: html.
						 html tbsFormGroup: [ html tbsButton
															callback: [ self addArticleToShop ];
															beLight;
															with: 'Add this article'	]]
]

{ #category : #operations }
ArticleAddComponent >> returnToInternalData [

	backOfficeComponent showArticleTable 
	
]
