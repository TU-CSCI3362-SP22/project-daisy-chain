Class {
	#name : #TBPostsListComponent,
	#superclass : #TBScreenComponent,
	#instVars : [
		'currentCategory'
	],
	#category : #'TinyBlog-Components'
}

{ #category : #'as yet unclassified' }
TBPostsListComponent >> basicRenderCategoriesOn: html [
html render: self categoriesComponent
]

{ #category : #'as yet unclassified' }
TBPostsListComponent >> basicRenderPostsOn: html [
self readSelectedPlants do: [ :p |
html render: (self postComponentFor: p) ]

]

{ #category : #'as yet unclassified' }
TBPostsListComponent >> categoriesComponent [
^ TBCategoriesComponent
categories: self blog allCategories
postsList: self
]

{ #category : #accessing }
TBPostsListComponent >> currentCategory [
	^ currentCategory 
]

{ #category : #accessing }
TBPostsListComponent >> currentCategory: anObject [ 
	currentCategory := anObject
]

{ #category : #rendering }
TBPostsListComponent >> initialize [ 	
	super initialize.
]

{ #category : #'as yet unclassified' }
TBPostsListComponent >> postComponentFor: aPost [
^ TBPostComponent new post: aPost

]

{ #category : #'as yet unclassified' }
TBPostsListComponent >> renderCategoryColumnOn: html [
html tbsColumn
extraSmallSize: 12;
smallSize: 2;
mediumSize: 4;
with: [ self basicRenderCategoriesOn: html ]
]

{ #category : #'as yet unclassified' }
TBPostsListComponent >> renderContentOn: html [
super renderContentOn: html.
html
tbsContainer: [
html tbsRow
showGrid;
with: [ self renderCategoryColumnOn: html.
self renderPostColumnOn: html ] ]

]

{ #category : #'as yet unclassified' }
TBPostsListComponent >> renderPostColumnOn: html [
html tbsColumn
extraSmallSize: 12;
smallSize: 10;
mediumSize: 8;
with: [ self basicRenderPostsOn: html ]
]
