Class {
	#name : #DCPlantComponent,
	#superclass : #WAComponent,
	#instVars : [
		'plant'
	],
	#category : #'DaisyChain-Components'
}

{ #category : #initialization }
DCPlantComponent >> description [
	^ plant description 
]

{ #category : #initialization }
DCPlantComponent >> initialize [ 
	super initialize.
	plant := DCPlant new
]

{ #category : #initialization }
DCPlantComponent >> name [
	^ plant name
]

{ #category : #accessing }
DCPlantComponent >> plant: aPlant [
	plant := aPlant
]

{ #category : #initialization }
DCPlantComponent >> renderContentOn: html [
html heading level: 2; with: self name.
html text: self description.

]
