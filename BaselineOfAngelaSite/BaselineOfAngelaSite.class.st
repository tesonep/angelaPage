Class {
	#name : #BaselineOfAngelaSite,
	#superclass : #BaselineOf,
	#category : #BaselineOfAngelaSite
}

{ #category : #baseline }
BaselineOfAngelaSite >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				baseline: 'Seaside'
				with: [ spec repository: 'github://SeasideSt/Seaside:master/repository' ].
			spec package: 'AngelaSite' with: [ spec requires: #('Seaside') ] ].
	spec group: 'default' with: #(AngelaSite)
]
