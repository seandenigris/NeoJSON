testing
benchmarkAsDictionary: count
	"self benchmarkAsDictionary: 1000"
	
	| collection json size |
	collection := Array new: count withAll: self example1 asDictionary.
	size := 2 + (count * (NeoJSONWriter toString: self example1 asDictionary) size) + count - 1.
	Transcript 
		cr;
		<< ('Serializing {1} objects took ms ' format: (Array with: count) );
		show: [ json := String new: size streamContents: [ :stream |
								(NeoJSONWriter on: stream) nextPut: collection ] ] timeToRun.
	Transcript 
		cr;
		<< ('Deserializing {1} objects took ms ' format: (Array with: count) );
		show: [ NeoJSONReader fromString: json ] timeToRun.