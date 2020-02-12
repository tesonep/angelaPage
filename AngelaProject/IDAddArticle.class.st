Class {
	#name : #IDAddArticle,
	#superclass : #WAComponent,
	#instVars : [
		'productName',
		'productPrice',
		'productWeight',
		'productImage'
	],
	#category : #AngelaProject
}

{ #category : #adding }
IDAddArticle >> addProductToShop [
	| theShop |
	theShop := Shop uniqueInstance.
	theShop addArticle: (Article new
				name: productName;
				price: productPrice;
				weight: productWeight;
				image: productImage asSymbol)
]

{ #category : #rendering }
IDAddArticle >> formForAdd: html [
	html
		tbsFormGroup: [ html textInput
				tbsFormControl;
				id: 'productName';
				callback: [ :value | productName := value ];
				placeholder: 'Put product name here' ].
	html
		tbsFormGroup: [ html textInput
				tbsFormControl;
				id: 'productPrice';
				callback: [ :value | productPrice := value ];
				placeholder: 'Put product price here' ].
	html
		tbsFormGroup: [ html textInput
				tbsFormControl;
				id: 'productWeight';
				callback: [ :value | productWeight := value ];
				placeholder: 'Put product weight here' ].
	html
		tbsFormGroup: [ html textInput
				tbsFormControl;
				id: 'productImage';
				callback: [ :value | productImage := value ];
				placeholder: 'Put product image here' ]
]

{ #category : #rendering }
IDAddArticle >> renderContentOn: html [ 

	html heading style: 'text-align: center'; level: 2; with: 'Add Article'.
	html tbsForm: [ self formForAdd: html.
						html tbsFormGroup: [ 	
					 		html tbsButton
									callback: [ self addProductToShop ];
									beLight;
									with: 'Add this article'
									]]
]
