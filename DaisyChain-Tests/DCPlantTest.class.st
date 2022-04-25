Class {
	#name : #DCPlantTest,
	#superclass : #TestCase,
	#category : #'DaisyChain-Tests'
}

{ #category : #tests }
DCPlantTest >> testPlantIsCreatedCorrectly [
| plant |
plant := DCPlant 
			name: 'Orange Tree' 
			description: 'A lovely orange tree ready to bear fruit.' 
			category: 'Tree'.
			
self assert: plant name equals: 'Orange Tree'.
self assert: plant description equals: 'A lovely orange tree ready to bear fruit.'.
self assert: plant category equals: 'Tree'
"title: 'Welcome to TinyBlog'
text: 'TinyBlog is a small blog engine made with Pharo.'
category: 'TinyBlog'.
self assert: plant title equals: 'Welcome to TinyBlog' .
self assert: plant text equals: 'TinyBlog is a small blog engine made with Pharo.' ."
]
