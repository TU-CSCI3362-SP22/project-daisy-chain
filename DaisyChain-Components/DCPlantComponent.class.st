Class {
	#name : #DCPlantComponent,
	#superclass : #DCPlantDisplayComponent,
	#category : #'DaisyChain-Components'
}

{ #category : #accessing }
DCPlantComponent >> nickname [
	^ plant nickname
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

]

{ #category : #initialization }
DCPlantComponent >> setNickname: aString [
	plant nickname: aString
]
