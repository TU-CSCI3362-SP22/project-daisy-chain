Class {
	#name : #DCWishlistComponent,
	#superclass : #DCPlantDisplayComponent,
	#category : #'DaisyChain-Components'
}

{ #category : #rendering }
DCWishlistComponent >> renderContentOn: html [
html heading level: 3; with: self name.
html text: self description.

html form: [ 
	html anchor 
		callback: [ DCInv current remove: plant ];
		with: 'Delete Plant'.
].
]
