"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestAngelaProject,
	#superclass : #PackageManifest,
	#category : #'AngelaProject-Manifest'
}

{ #category : #'code-critics' }
ManifestAngelaProject class >> ruleGRBlockFormattingRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#FrontPageComponent #renderHeaderOn: #false)) #'2020-03-18T22:07:05.415877+01:00') #(#(#RGMethodDefinition #(#ArticleEditComponent #renderContentOn: #false)) #'2020-03-23T19:45:18.449877+01:00') )
]

{ #category : #'code-critics' }
ManifestAngelaProject class >> ruleGRTempsFormattingRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#ShopTest #testAddingAProduct #false)) #'2020-03-25T18:19:26.314877+01:00') #(#(#RGMethodDefinition #(#ShoppingCartTest #testAddTwoProductWithDelivery #false)) #'2020-03-25T18:51:00.988877+01:00') )
]

{ #category : #'code-critics' }
ManifestAngelaProject class >> ruleRBAssignmentInIfTrueRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#FrontPageComponent #renderArticles:with: #false)) #'2020-03-18T19:00:38.626877+01:00') )
]
