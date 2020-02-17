Class {
	#name : #ArticleEditComponent,
	#superclass : #WAComponent,
	#instVars : [
		'backOfficeComponent',
		'article',
		'articleImage',
		'articleIName',
		'articleIPrice',
		'articleIWeight'
	],
	#category : #AngelaProject
}

{ #category : #accessing }
ArticleEditComponent >> article [
	^ article
]

{ #category : #accessing }
ArticleEditComponent >> article: anObject [
	article := anObject
]

{ #category : #accessing }
ArticleEditComponent >> backOfficeComponent [
	^ backOfficeComponent
]

{ #category : #accessing }
ArticleEditComponent >> backOfficeComponent: anObject [
	backOfficeComponent := anObject
]

{ #category : #rendering }
ArticleEditComponent >> formForEditing: html [
	html tbsFormGroup: [ html textInput
										tbsFormControl;
										id: 'productName';
										callback: [ :value | articleIName := value ];
										value: article name ].
	html tbsFormGroup: [ html textInput
										tbsFormControl;
										id: 'productPrice';
										callback: [ :value | articleIPrice := value ];
										value: article price ].
	html tbsFormGroup: [ html textInput
										tbsFormControl;
										id: 'productWeight';
										callback: [ :value | articleIWeight := value ];
										value: article weight ].
	html tbsFormGroup: [ html textInput
										tbsFormControl;
										id: 'productImage';
										callback: [ :value | articleImage := value ];
										value: article image ]
]

{ #category : #rendering }
ArticleEditComponent >> renderContentOn: html [ 

	html heading style: 'text-align: center'; level: 2; with: 'Edit Article'.
	html tbsForm: [ self formForEditing: html.
						 html tbsFormGroup: [ html tbsButton
															callback: [ self updateArticleContent ];
															beLight;
															with: 'Save' ]]
]

{ #category : #accessing }
ArticleEditComponent >> returnToInternalData [

	backOfficeComponent showArticleList 
]

{ #category : #'as yet unclassified' }
ArticleEditComponent >> updateArticleContent [
	article 
		name: articleIName ;
		price: articleIPrice ;
		weight: articleIWeight ;
		image: articleImage asSymbol.	
	self returnToInternalData.
]
