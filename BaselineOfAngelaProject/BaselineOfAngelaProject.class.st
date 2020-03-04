Class {
	#name : #BaselineOfAngelaProject,
	#superclass : #BaselineOf,
	#category : #BaselineOfAngelaProject
}

{ #category : #baseline }
BaselineOfAngelaProject >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				baseline: 'Seaside3'
				with: [ spec repository: 'github://SeasideSt/Seaside:master/repository' ].
			spec package: 'AngelaProject' with: [ spec requires: #('Seaside3') ] ].
	spec group: 'default' with: #(AngelaProject)
]
