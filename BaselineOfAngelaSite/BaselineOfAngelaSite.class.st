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
				baseline: 'Seaside3'
				with: [ spec repository: 'github://SeasideSt/Seaside:master/repository' ].
			spec package: 'AngelaProject' with: [ spec requires: #('Seaside3') ] ].
	spec group: 'default' with: #(AngelaProject)
]
