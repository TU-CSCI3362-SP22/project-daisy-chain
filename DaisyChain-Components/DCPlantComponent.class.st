Class {
	#name : #DCPlantComponent,
	#superclass : #WAComponent,
	#instVars : [
		'post'
	],
	#category : #'DaisyChain-Components'
}

{ #category : #initialization }
DCPlantComponent >> date [
	^ post date
]

{ #category : #initialization }
DCPlantComponent >> initialize [ 
	super initialize.
	post := DCPlant new
]

{ #category : #accessing }
DCPlantComponent >> post: aPost [
post := aPost

]

{ #category : #initialization }
DCPlantComponent >> renderContentOn: html [
html heading level: 2; with: self title.
html heading level: 6; with: self date.
html text: self text

]

{ #category : #initialization }
DCPlantComponent >> text [
	^ post text
]

{ #category : #initialization }
DCPlantComponent >> title [ 
	^ post title
]
