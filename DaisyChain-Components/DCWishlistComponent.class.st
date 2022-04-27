Class {
	#name : #DCWishlistComponent,
	#superclass : #DCPlantDisplayComponent,
	#category : #'DaisyChain-Components'
}

{ #category : #removing }
DCWishlistComponent >> remove: aPlant [
	DCInv current wishlist: (DCInv current wishlist reject: [ :p | p == aPlant ])
	
	
]

{ #category : #rendering }
DCWishlistComponent >> renderContentOn: html [
html heading level: 3; with: self name.
html text: self description.

html form: [ 
	html anchor 
		callback: [ self remove: plant ];
		with: 'Delete Plant'.
].
]
