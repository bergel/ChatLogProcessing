Class {
	#name : #ChatLogTest,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #ChatLogProcessing
}

{ #category : #tests }
ChatLogTest >> exampleChatLog [
	^ (IceRepository registry detect: [ :each | each includesPackageNamed: 'ChatLogProcessing' ] ifNone: [ self error: 'Please add a clone of this project to Iceberg to access to the resources' ]) location / 'learning-help-chatlog.csv'
"	^ '/Users/alexandrebergel/Desktop/learning-help-chatlog - copy.csv' asFileReference contents"
]

{ #category : #running }
ChatLogTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	super setUp.
	model := ChatLog new 
]

{ #category : #tests }
ChatLogTest >> testBasic [
	model importFrom: self exampleChatLog.
	self assert: model numberOfMessages equals: 4422
]
