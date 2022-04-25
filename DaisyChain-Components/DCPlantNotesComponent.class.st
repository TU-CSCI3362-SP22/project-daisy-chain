Class {
	#name : #DCPlantNotesComponent,
	#superclass : #WAComponent,
	#instVars : [
		'plant'
	],
	#category : #'DaisyChain-Components'
}

{ #category : #accessing }
DCPlantNotesComponent >> plant [
	^ plant
]

{ #category : #accessing }
DCPlantNotesComponent >> plant: anObject [
	plant := anObject
]

{ #category : #rendering }
DCPlantNotesComponent >> renderContentOn: html [
html text: 'hell'
]
