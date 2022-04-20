Class {
	#name : #DCPlantsListComponent,
	#superclass : #DCScreenComponent,
	#instVars : [
		'currentCategory'
	],
	#category : #'DaisyChain-Components'
}

{ #category : #'as yet unclassified' }
DCPlantsListComponent >> basicRenderCategoriesOn: html [
html render: self categoriesComponent
]

{ #category : #'as yet unclassified' }
DCPlantsListComponent >> basicRenderPostsOn: html [
self readSelectedPlants do: [ :p |
html render: (self postComponentFor: p) ]

]

{ #category : #'as yet unclassified' }
DCPlantsListComponent >> categoriesComponent [
^ DCCategoriesComponent
categories: self blog allCategories
postsList: self
]

{ #category : #accessing }
DCPlantsListComponent >> currentCategory [
	^ currentCategory 
]

{ #category : #accessing }
DCPlantsListComponent >> currentCategory: anObject [ 
	currentCategory := anObject
]

{ #category : #rendering }
DCPlantsListComponent >> initialize [ 	
	super initialize.
]

{ #category : #'as yet unclassified' }
DCPlantsListComponent >> postComponentFor: aPost [
^ DCPlantComponent new plant: aPost

]

{ #category : #'as yet unclassified' }
DCPlantsListComponent >> renderCategoryColumnOn: html [
html tbsColumn
extraSmallSize: 12;
smallSize: 2;
mediumSize: 4;
with: [ self basicRenderCategoriesOn: html ]
]

{ #category : #'as yet unclassified' }
DCPlantsListComponent >> renderContentOn: html [
	super renderContentOn: html.
	html tbsContainer: [
	html tbsRow
	showGrid;
	with: [ self renderCategoryColumnOn: html.
	self renderPostColumnOn: html ] ].
	

]

{ #category : #'as yet unclassified' }
DCPlantsListComponent >> renderPostColumnOn: html [
html tbsColumn
extraSmallSize: 12;
smallSize: 10;
mediumSize: 8;
with: [ self basicRenderPostsOn: html ]
]
