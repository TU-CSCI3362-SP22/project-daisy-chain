Class {
	#name : #DCWishlistTest,
	#superclass : #TestCase,
	#instVars : [
		'blog',
		'previousRepository',
		'plant',
		'first'
	],
	#category : #'DaisyChain-Tests'
}

{ #category : #initialization }
DCWishlistTest >> setUp [ 
	previousRepository := VORepository current.
	VORepository setRepository: VOMemoryRepository new.
	blog := DCInv current.
	first := DCPlant name: 'Test Tree' description: 'A tree for tests' category: 'Test'.
	blog writeWishlistPlant: first.
	blog writeWishlistPlant: (DCPlant name: 'Po' description:'Po' category: 'Po').
	plant := (DCPlant name: 'Test Bush' description: 'A bush for tests' category: 'Test').
	
]

{ #category : #running }
DCWishlistTest >> tearDown [ 
	VORepository setRepository: previousRepository
]

{ #category : #tests }
DCWishlistTest >> testAddWishlist [
	blog writeWishlistPlant: plant.
	self assert: blog wishlist size equals: 3
]

{ #category : #tests }
DCWishlistTest >> testRemove [ 
	blog remove: first.
	self assert: blog wishlist size equals: 1.
]
