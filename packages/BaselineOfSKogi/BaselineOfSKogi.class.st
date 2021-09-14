Class {
	#name : #BaselineOfSKogi,
	#superclass : #BaselineOf,
	#category : #BaselineOfSKogi
}

{ #category : #'as yet unclassified' }
BaselineOfSKogi class >> createSAR [

	| preamble zip |
	zip := ZipArchive new.
	preamble := String streamContents: [:preambleStream |
	    preambleStream
	        nextPutAll: '| loader |
	loader := MCVersionLoader new.';
	        cr.
	    (((self project version: 'baseline') allPackagesForSpecNamed: #default) collect: #name) do: [:name | | stream version |
	        stream := RWBinaryOrTextStream on: (String new: 10000).
	        version := MCVersion
	            package: (MCPackage named: name)
	            info: ((MCPackage named: 'Sandblocks-Core') workingCopy ancestry ancestors
					ifNotEmpty: #first
					ifEmpty: [MCVersionInfo name: name, '-generated.1' id: UUID new message: '' date: Date today time: Time now author: 'generated' ancestors: #()]).
	        version fileOutOn: stream.
	        (zip addString: stream contents as: name, '.mcz') desiredCompressionLevel: 0.
	        preambleStream
	            nextPutAll: 'loader addVersion: (MCMczReader versionFromStream: (self memberNamed: ''';
	            nextPutAll: name;
	            nextPutAll: '.mcz'') contentStream).';
	            cr].
	    preambleStream nextPutAll: 'loader load.'].
	zip addString: preamble as: 'install/preamble'.
	zip writeToFileNamed: 'sandblocks.sar'
]

{ #category : #'as yet unclassified' }
BaselineOfSKogi class >> projectVersion [

	^ '0.0.0'
]

{ #category : #baseline }
BaselineOfSKogi >> baseline: spec [
	<baseline>

	spec for: #common do: [
		spec baseline: 'Sandblocks' with: [spec repository: 'github://tom95/sandblocks:master/packages'].
		spec configuration: 'OSProcess' with: [spec repository: 'http://www.squeaksource.com/OSProcess'].
		
		spec package: 'SKogi' with: [spec requires: #('SKogi-Core' 'Sandblocks' 'OSProcess')].
		
		spec
			group: 'default' with: #('SKogi');
			group: 'test' with: #('default')]
]

{ #category : #baseline }
BaselineOfSKogi >> projectClass [
	^ Smalltalk
		at: #MetacelloCypressBaselineProject
		ifAbsent: [super projectClass]
]
