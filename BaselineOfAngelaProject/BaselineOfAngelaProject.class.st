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
			spec
				configuration: 'Bootstrap'
				with: [ spec
						repository: 'github://astares/Seaside-Bootstrap:master/src';
						versionString: #stable ].
			spec
				package: 'AngelaProject'
				with: [ spec requires: #(Seaside3 Bootstrap) ] ].
	spec group: 'default' with: #(AngelaProject)
]
