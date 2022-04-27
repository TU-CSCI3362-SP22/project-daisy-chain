Class {
	#name : #DCPlantDisplayComponent,
	#superclass : #WAComponent,
	#instVars : [
		'plant'
	],
	#category : #'DaisyChain-Components'
}

{ #category : #initialization }
DCPlantDisplayComponent >> description [
	^ plant description 
]

{ #category : #initialization }
DCPlantDisplayComponent >> initialize [ 
	super initialize.
	plant := DCPlant new
]

{ #category : #initialization }
DCPlantDisplayComponent >> name [
	^ plant name
]

{ #category : #accessing }
DCPlantDisplayComponent >> plant: aPlant [
	plant := aPlant
]

{ #category : #rendering }
DCPlantDisplayComponent >> renderContentOn: html [
	^ self subclassResponsibility
]
