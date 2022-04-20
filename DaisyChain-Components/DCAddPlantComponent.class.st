Class {
	#name : #DCAddPlantComponent,
	#superclass : #WAComponent,
	#instVars : [
		'addPlant'
	],
	#category : #'DaisyChain-Components'
}

{ #category : #initialization }
DCAddPlantComponent >> initialize [ 
	super initialize.
	addPlant := DCPlant new.
]

{ #category : #rendering }
DCAddPlantComponent >> renderContentOn: html [ 
html form: [  
	html text: 'Name: '.
	html textInput on: #name of: addPlant.
	html break.
	html text: 'Description: '.
	html textInput on: #description of: addPlant.
	html break.
	html text: 'Category: '.
	html textInput on: #category of: addPlant.
	html break.
	html submitButton
		callback: [ DCInv current writeBlogPost: (addPlant visible: true)].
]

]
