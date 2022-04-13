Class {
	#name : #DCCategoriesComponent,
	#superclass : #WAComponent,
	#instVars : [
		'categories',
		'postsList'
	],
	#category : #'DaisyChain-Components'
}

{ #category : #'as yet unclassified' }
DCCategoriesComponent class >> categories: categories postsList: aTBScreen [
	^ self new categories: categories; postsList: aTBScreen
]

{ #category : #accessing }
DCCategoriesComponent >> categories [ 
	^ categories
]

{ #category : #accessing }
DCCategoriesComponent >> categories: aCollection [
	categories := aCollection asSortedCollection 
]

{ #category : #accessing }
DCCategoriesComponent >> postsList [
	^ postsList
]

{ #category : #accessing }
DCCategoriesComponent >> postsList: aComponent [
	postsList := aComponent
]

{ #category : #'as yet unclassified' }
DCCategoriesComponent >> renderCategoryLinkOn: html with: aCategory [
html tbsLinkifyListGroupItem
class: 'active' if: aCategory = self postsList currentCategory;
callback: [ self selectCategory: aCategory ];
with: aCategory
]

{ #category : #'as yet unclassified' }
DCCategoriesComponent >> renderContentOn: html [
html tbsListGroup: [
html tbsListGroupItem
with: [ html strong: 'Categories' ].
categories do: [ :cat |
self renderCategoryLinkOn: html with: cat ] ]

]

{ #category : #'as yet unclassified' }
DCCategoriesComponent >> selectCategory: aCategory [
	postsList currentCategory: aCategory
]
