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
DCPlantComponent >> nickname [
	^ plant nickname
]

{ #category : #accessing }
DCPlantComponent >> plant: aPlant [
	plant := aPlant
]

{ #category : #initialization }
DCPlantComponent >> renderContentOn: html [
html heading level: 2; with: self nickname.
html heading level: 3; with: self name.

html text: self description.

plant nickname = ''
ifTrue:[
html form: [ 
		html text: 'Nickname: '.
		html textInput on: #nickname of: plant. 
		html break.
		html submitButton
	]
]
ifFalse:[
	html break.
	html anchor
		callback: [ plant nickname: '' ];
		with: 'Clear Nickname'.
].

html break.

html anchor
       callback: [ self session presenter call: DCPlantNotesComponent new ];
       with: 'notes'.


]

{ #category : #initialization }
DCPlantComponent >> setNickname: aString [
	plant nickname: aString
]
