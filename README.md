# <center>Intro to YAP </brYet><br>The building block for Hebrew NLP</center>
## Intro
**Yet Another (natural language) Parser** is a tool for parsing the hebrew language.
It is a really powerful tool to analyze text data in hebrew.
It helps convert text into analysis such as **Morphological Analysis ,Morphological Disambiguation  ,Dependency Parse Tree** and different  variations which are presented below.
[![YAPExample](https://github.com/OnlpLab/yap/blob/master/screenshot.png?raw=true "YAPExample")](https://github.com/OnlpLab/yap "YAPExample")

## History

YAP was implemented to test the hypothesis on Joint Morpho-Syntactic Processing of Morphologically Rich Languages (MRLs) in a Transition Based Framework. The parser was written as part Amir More's MSc thesis at IDC Herzliya under the supervision of Dr. Reut Tsarfaty from the Open University of Israel. The models and training regimes have been tuned and improved by Amit Seker from the Open University.
## YAP Overview
### [Morphological Analysis](https://en.wikipedia.org/wiki/Morphological_parsing)
Morphological Analysis shows shows all the options of interpretations for each word in the sentence.

For example the sentence “אכלתי ארוחה טעימה אתמול”
```console
0    1    אכלתי    איכל    VB    VB    gen=F|gen=M|num=S|per=1|tense=PAST    1
1    2    ארוחה    ארוחה    NN    NN    gen=F|num=S    2
2    3    טעימה    טעים    JJ    JJ    gen=F|num=S    3
3    4    אתמול    אתמול    RB    RB    _    4
```
To find more on Morphological Analysis:
- [A paper on the morphological analysis and disambiguation aspect for Modern Hebrewand Universal Dependencies](https://aclanthology.org/C16-1033.pdf)

### [Morphological Disambiguation](http://cs.haifa.ac.il/~shuly/publications/danny-thesis.pdf)
Morphological Disambiguation is the next step after a full Morphological Analysis.
Since the Morphological Analysis gave us all the possible options of each word in the sentence Morphological Disambiguation narrows down on the **most viable** option for each woord in the sentence.

For example the sentence “אכלתי ארוחה טעימה אתמול”
```console
0    1    אכלתי    איכל    VB    VB    gen=F|gen=M|num=S|per=1|tense=PAST   1
0    1    אכלתי    אכל    VB    VB    gen=F|gen=M|num=S|per=1|tense=PAST    1
1    2    ארוחה    ארוחה    NN    NN    gen=F|num=S    2
2    3    טעימה    טעימה    NN    NN    gen=F|num=S    3
2    3    טעימה    טעים    JJ    JJ    gen=F|num=S    3
3    4    אתמול    אתמול    RB    RB    _    4
```
To find more on Morphological Disambiguation:
- [Morphological Disambiguation of Hebrew](http://cs.haifa.ac.il/~shuly/publications/danny-thesis.pdf)
- [An Unsupervised Morpheme-Based HMM for Hebrew Morphological Disambiguation](https://aclanthology.org/P06-1084.pdf)

### [Dependency Parsing](https://towardsdatascience.com/natural-language-processing-dependency-parsing-cf094bbbe3f7)

Dependency Parsing is the process to analyze the grammatical structure in a sentence and find out related words as well as the type of the relationship between them.
YAP returns a dependency tree of the inputted sentence.
To find more on Morphological Disambiguation:
- [Hebrew Dependency Parsing: Initial Results](https://aclanthology.org/W09-3819.pdf)
- [Natural Language Processing — Dependency Parsing](https://towardsdatascience.com/natural-language-processing-dependency-parsing-cf094bbbe3f7)

For example the sentence “אכלתי ארוחה טעימה אתמול”
```console
1    אכלתי    איכל    VB    VB    gen=F|gen=M|num=S|per=1|tense=PAST    0    ROOT    _    _
2    ארוחה    ארוחה    NN    NN    gen=F|num=S    1    obj
 _    _
3    טעימה    טעים    JJ    JJ    gen=F|num=S    2    amod
 _    _
4    אתמול    אתמול    RB    RB        3    mod
 _    _
```

### The Repository

- The original repository: **https://github.com/OnlpLab/yap**
- A live demo of parsing Hebrew texts is provided [**here**](http://nlp.biu.ac.il/~rtsarfaty/onlp/hebrew/).
- [**API Website**](https://www.langndata.com/heb_parser/overview)

### YAP Prerequisites

In order to install YAP we need 
 - [Go](https://go.dev/dl/) (**Go 1.15** the **exact** version)
 - [Git](https://git-scm.com/downloads)
 - [bzip](http://gnuwin32.sourceforge.net/packages/bzip2.htm)
 
Hardware
 - 6GB RAM

### Setting Up YAP

An installation manual is also found at the [The original repository](https://github.com/OnlpLab/yap):
Make sure you have Go and Git installed and on the command PATH.
**If you are new to GOlang:**
Set up your envioroment with one of these guides:

- [GopherGuides](https://learn.gopherguides.com/courses/preparing-your-environment-for-go-development)
- [Tutorialspoint](https://www.tutorialspoint.com/go/go_environment.htm)

**Check if Go 1.15 installed**
For Linux
```console
$ go version
go version go1.15 linux/amd64
```
Or for Windows
```console
$ go version
go version go1.15 windows/amd64
```

Or for Mac
```console
$ go version
go version go1.15 mac
```
**Check if Bz2 is installed**
```console
$ bz2 --help
bzip2, a block-sorting file compressor.  Version 1.0.8, 13-Jul-2019...(etc)
```
##Installing YAP
**Once you have Go version 1.15  and bzip2 installed **
Set up a new folder for the project and open command line at that folder
**For Linux:**
```console
export GOPATH=${PWD}
mkdir src
cd src
git clone https://github.com/OnlpLab/yap.git
cd yap
bunzip2 data/*.bz2
go get .
go build .
./yap
./yap - invoke yap as a standalone app or as an api server

Commands:

    api         start api server
    dep         runs dependency training/parsing
    hebma       run lexicon-based morphological analyzer on raw input
    joint       runs joint morpho-syntactic training and parsing
    ma          run data-driven morphological analyzer on raw input
    md          runs standalone morphological disambiguation training and parsing

Use "./yap help <command>" for more information about a command
```
**For Windows**
- Create a new project folder
- Set ``$GOPATH`` environment variable to your workspace - [here](https://www.freecodecamp.org/news/setting-up-go-programming-language-on-windows-f02c8c14e2f/) (Also shown in the Golang guide) (Also shown in the Golang guide)

```console
mkdir src
cd src
git clone https://github.com/OnlpLab/yap.git
cd yap
bunzip2 data/*.bz2
go get .
go build .
./yap
./yap - invoke yap as a standalone app or as an api server

Commands:

    api         start api server
    dep         runs dependency training/parsing
    hebma       run lexicon-based morphological analyzer on raw input
    joint       runs joint morpho-syntactic training and parsing
    ma          run data-driven morphological analyzer on raw input
    md          runs standalone morphological disambiguation training and parsing

Use "./yap help <command>" for more information about a command
```
### Troubleshooting
If the set up is not working it is ussually either 1 of these 3 things:
- Go version is above 1.15.
- GOPATH is not set up correctly.
- bzip2 is not installed on your pc.

If bunzip does not work the extraction of the bzip files can be done manually which allows you to delete the ``bunzip2 data/*.bz2`` line.

### Using Yap
You can use YAP in variety of ways:
- Install YAP and run it manually via command line.
- Install YAP and run it via API.
- Sign Up and use the YAP API [here](https://www.langndata.com/heb_parser/overview)

Here is a comparison for using YAP:

| Category/YAP Usage                | Manually | Local API | Remote API |
|-----------------------------------|----------|-----------|------------|
| Need Installation                 | Yes      | Yes       | No         |
| RAM Usage                         | 2.5GB    | 5GB       | 1GB        |
| Changeable Code                   | Yes      | Yes       | No         |
| Can use Different Models          | Yes      | Yes       | No         |
| Can be used with current Wrappers | No       | Yes       | Yes        |
| Speed                             | Fast     | Fast      | Slow       |

#### Running YAP commands Manually
We can run the commands from the terminal/cmd using a local text file and analyizing it.
From the command line you can process one input file at a time.
Note it is possible to have multiple sentences in a single file.
###  Creating Input File
YAP works on a tokenized sentence level,meaning that the input to YAP is a list of tokens
Create a new text file named input.txt with each word in a new line and end of sentence using “.”.
For example:

```console
$ cat input.txt
דני
קטף
את
התפוח
הטעים
והיפה
.
```

**Windows users:** YAP does not handle Windows style text files with:
- [BOM](https://en.wikipedia.org/wiki/Byte_order_mark) marks
- [CRLF](https://en.wikipedia.org/wiki/Newline) newlines.

So if you are running on Windows and YAP does not work make sure you do not have CRLF line endings and no BOM mark.
**Note: The input must be in UTF-8 encoding .**

## Analyzing the input
### Hebma - Morphological Analysis to a Lattice File
In order to run the [Morphological Analysis](https://en.wikipedia.org/wiki/Morphological_analysis) to a lattice file we need to run this line:
```console
$ ./yap hebma -raw input.txt -out input.lattice
```
-out input.lattice means that Yap will creates a file named input.lattice and 
After the command is complete , a file named input.lattice will be created in the yap folder. When opened, the file will contain a Morphological Analysis of the input in lattice format.


Morphological Analysis Lattice:
```console
0	1	דני	דני	NNP	NNP	gen=M|num=S	1
0	1	דני	דני	JJ	JJ	gen=M|num=S	1
1	2	קטף	קטף	VB	VB	gen=M|num=S|per=3|tense=PAST	2
2	3	את	הוא	PRP	PRP	gen=F|num=S|per=2	3
2	3	את	את	AT	AT	_	3
3	4	ה	ה	DEF	DEF	_	4
3	5	ה	ה	REL	REL	_	4
3	6	התפוח	התפוח	NNP	NNP	gen=F|num=S	4
3	6	התפוח	התפוח	NN	NN	gen=M|num=S	4
3	6	התפוח	התפוח	NN	NN	gen=M|num=P|num=S	4
3	6	התפוח	התפוח	NNP	NNP	gen=M|num=S	4
3	6	התפוח	התפוח	NNP	NNP	_	4
3	6	התפוח	התפוח	NNP	NNP	gen=F|gen=M|num=S	4
3	6	התפוח	התפוח	NN	NN	gen=F|num=P	4
3	6	התפוח	התפוח	NN	NN	gen=F|num=S	4
3	6	התפוח	התפוח	NN	NN	gen=M|num=P	4
4	6	תפוח	תפוח	NNT	NNT	gen=M|num=S	4
4	6	תפוח	תפוח	NN	NN	gen=M|num=S	4
4	6	תפוח	תפוח	JJ	JJ	gen=M|num=S	4
4	6	תפוח	תפוח	JJT	JJT	gen=M|num=S	4
5	6	תפוח	תפוח	NNT	NNT	gen=M|num=S	4
5	6	תפוח	תפוח	NN	NN	gen=M|num=S	4
5	6	תפוח	תפוח	JJ	JJ	gen=M|num=S	4
5	6	תפוח	תפוח	JJT	JJT	gen=M|num=S	4
6	7	ה	ה	DEF	DEF	_	5
6	8	ה	ה	REL	REL	_	5
6	9	הטעים	הטעים	VB	VB	gen=M|num=S|per=3|tense=PAST	5
7	9	טעים	טעים	JJT	JJT	gen=M|num=S	5
7	9	טעים	טעים	JJ	JJ	gen=M|num=S	5
8	9	טעים	טעים	JJT	JJT	gen=M|num=S	5
8	9	טעים	טעים	JJ	JJ	gen=M|num=S	5
9	10	ו	ו	CONJ	CONJ	_	6
9	12	והיפה	והיפה	NNP	NNP	gen=M|num=S	6
9	12	והיפה	והיפה	NN	NN	gen=M|num=P|num=S	6
9	12	והיפה	והיפה	NN	NN	gen=M|num=S	6
9	12	והיפה	והיפה	NNP	NNP	gen=F|num=S	6
9	12	והיפה	והיפה	NNP	NNP	gen=F|gen=M|num=S	6
9	12	והיפה	והיפה	NNP	NNP	_	6
9	12	והיפה	והיפה	NN	NN	gen=M|num=P	6
9	12	והיפה	והיפה	NN	NN	gen=F|num=S	6
9	12	והיפה	והיפה	NN	NN	gen=F|num=P	6
10	11	ה	ה	DEF	DEF	_	6
11	12	יפה	יפה	JJ	JJ	gen=F|num=S	6
11	12	יפה	יפה	VB	VB	gen=M|num=S|per=3|tense=PAST	6
11	12	יפה	יפה	JJT	JJT	gen=M|num=S	6
11	12	יפה	יפה	JJ	JJ	gen=M|num=S	6
11	12	יפה	יפה	RB	RB	_	6
11	12	יפה	יפה	INTJ	INTJ	_	6
11	12	יפה	יפה	NNP	NNP	gen=F|num=S	6
11	12	יפה	ייפה	VB	VB	gen=M|num=S|per=3|tense=PAST	6
11	12	יפה	ייפה	VB	VB	gen=M|num=S|per=2|tense=IMPERATIVE	6
12	13	.	_	yyDOT	yyDOT	_	7
```
The result shows all the options of interpretations for each word in the sentence.
Each column has it's own representation:
-  **Column 1-2**: From/To - The start and end nodes of the morpheme.
 The numbers are with respect to the maximal length route.
-  **Column 3**: Form - the surface form of the morphological segment.
- **Column 4** Lemma
- **Column 5** Part of Speech
- **Column 6**: Morphological Features
- **Column 7**: Token Number - represents the index of the raw (space-delimited) token in the input before segmentation.
### md  - Morphological Disambiguation
In order to run Morphological Disambiguation we need to run this line:
```console
    $ ./yap md -in input.lattice -om output.mapping
```
Given the input ambiguous lattices, output the disambiguated lattice.
The result will be an output.mapping file which contains:
```console
0	1	דני	דני	NNP	NNP	gen=M|num=S	1
1	2	קטף	קטף	VB	VB	gen=M|num=S|per=3|tense=PAST	2
2	3	את	את	AT	AT	_	3
3	4	ה	ה	DEF	DEF	_	4
4	5	תפוח	תפוח	NN	NN	gen=M|num=S	4
5	6	ה	ה	DEF	DEF	_	5
6	7	טעים	טעים	JJ	JJ	gen=M|num=S	5
7	8	ו	ו	CONJ	CONJ	_	6
8	9	ה	ה	DEF	DEF	_	6
9	10	יפה	יפה	JJ	JJ	gen=M|num=S	6
10	11	.	_	yyDOT	yyDOT	_	7
```
The result shows all the options of interpretations for each word in the sentence.
Each column has it's own representation:
- **Column 1-2**: From/To - The start and end nodes of the morpheme. The numbers are with respect to the maximal length route.
- **Column 3**:  Form of the Morpheme - the surface form of the morphological segment.
- **Column 4**: Lemma of the Morpheme
- **Column 5**: Coarse Part of Speech Tag
- **Column 6**: Fine Part of Speech Tag
- **Column 7**:  Morphological Features
- **Column 8**:  Source Token Index
### dep  - Dependency Parsing
In order to run [Dependency Parsing](https://towardsdatascience.com/natural-language-processing-dependency-parsing-cf094bbbe3f7) we need to run this line:
```console
    $ ./yap dep -inl output.mapping -oc output.conll
```
Given the disambiguated lattice, output the dependency tree
The result will be an output.conll file which contains:
```console
1	דני	דני	NNP	NNP	gen=M|num=S	2	subj
	_	_
2	קטף	קטף	VB	VB	gen=M|num=S|per=3|tense=PAST	0	ROOT	_	_
3	את	את	AT	AT	_	2	obj
	_	_
4	ה	ה	DEF	DEF	_	5	def
	_	_
5	תפוח	תפוח	NN	NN	gen=M|num=S	3	hd
	_	_
6	ה	ה	DEF	DEF	_	7	def
	_	_
7	טעים	טעים	JJ	JJ	gen=M|num=S	8	conj
	_	_
8	ו	ו	CONJ	CONJ	_	5	amod
	_	_
9	ה	ה	DEF	DEF	_	10	def
	_	_
10	יפה	יפה	JJ	JJ	gen=M|num=S	8	conj
	_	_
11	.	_	yyDOT	yyDOT	_	2	punct
	_	_
```
The result shows all the options of interpretations for each word in the sentence.
Each line of the dependency CoNLL output file represents a node in the parse tree. The MD lattice and Dep CoNLL output files are aligned, meaning that in order to get back the token id of a dependency node you can look up the last column of the corresponding line in the lattice file.

Each column has it is own representation:
- **Column 1**: Morpheme Index in the Sentence
- **Column 2**:  Form of the Morpheme
- **Column 3**: Lemma of the Morpheme
- **Column 4**: Coarse Part of Speech Tag
- **Column 5**: Fine Part of Speech Tag
- **Column 6**: Morphological Features
- **Column 7**:  Head Index Pointer
- **Column 8**:  Dependency relation to the HEAD
- **Column 9**:  Projective Head **Unused**
- **Column 10**:  Dependency relation to the PHEAD **Unused**

### joint  - Full analysis of the text
Joint gets the [Morphological Disambiguation](http://cs.haifa.ac.il/~shuly/publications/danny-thesis.pdf) file (lattice), runs morpho-syntactic training, [Dependency Parsing](https://towardsdatascience.com/natural-language-processing-dependency-parsing-cf094bbbe3f7) and [Word Segmentation](https://en.wikipedia.org/wiki/Text_segmentation#Word_segmentation) consecutively.
In order to run the joint command we shall use this line:
```console
    $ ./yap joint -in input.lattice -os output.segmentation -om output.mapping -oc 	output.conll
```
The output files will be in the yap folder.
The output of the of the word segmentation:
```console
	דני
	קטף
	את
	ה:תפוח
	ה:טעים
	ו:ה:יפה
	.
```

**MA and MD:**
The node indices in the MA and MD outputs do not match. This means that while the MA output represents an ambiguous lattice
with several possible paths through the graph, the MD output represents a single path and you'll notice that the node indices
are sequential and do not map to the original MA lattice.

#### Running YAP API Manually
YAP can run as a server listening on port 8000:
```console
    $ ./yap api
```
To change the port from 8000 we need to **yap/webapi/webapi.go** and change the 8000 to the wanted port (line 12 here):
```GO
func StartAPIServer(cmd *commander.Command, args []string) error {
	HebrewMorphAnalyazerInitialize(cmd, args)
	MorphDisambiguatorInitialize(cmd, args)
	DepParserInitialize(cmd, args)
	JointParserInitialize()
	router = mux.NewRouter()
	router.HandleFunc("/yap/heb/ma", HebrewMorphAnalyzerHandler)
	router.HandleFunc("/yap/heb/md", MorphDisambiguatorHandler)
	router.HandleFunc("/yap/heb/dep", DepParserHandler)
	router.HandleFunc("/yap/heb/pipeline", HebrewPipelineHandler)
	router.HandleFunc("/yap/heb/joint", HebrewJointHandler)
	log.Fatal(http.ListenAndServe(":8000", router))
	return nil

```

#### Running API from Docker
In order to run the project api from Docker Need to make sure docker is installed.

```console
    $ docker run --name yap -d -p 8000:8000 yap
```
#### Using the YAP API
You can then send HTTP GET requests with json objects in the request body, **pay attention that the input string should end with two space characters**. You'll receive back a json object containing the 3 output levels:
```console
    $ curl -s -X GET -H 'Content-Type: application/json' -d'{"text": "  דני קטף את התפוח הטעים והיפה "}' localhost:8000/yap/heb/joint | jq .
```
The output will be:
```console
{'ma_lattice': '0\t1\tדני\tדני\tNNP\tNNP\tgen=M|num=S\t1\n0\t1\tדני\tדני\tJJ\tJJ\tgen=M|num=S\t1\n1\t2\tקטף\tקטף\tVB\tVB\tgen=M|num=S|per=3|tense=PAST\t2\n2\t3\tאת\tהוא\tPRP\tPRP\tgen=F|num=S|per=2\t3\n2\t3\tאת\tאת\tAT\tAT\t_\t3\n3\t4\tה\tה\tDEF\tDEF\t_\t4\n3\t5\tה\tה\tREL\tREL\t_\t4\n3\t6\tהתפוח\tהתפוח\tNNP\tNNP\tgen=F|num=S\t4\n3\t6\tהתפוח\tהתפוח\tNN\tNN\tgen=M|num=S\t4\n3\t6\tהתפוח\tהתפוח\tNN\tNN\tgen=M|num=P|num=S\t4\n3\t6\tהתפוח\tהתפוח\tNNP\tNNP\tgen=M|num=S\t4\n3\t6\tהתפוח\tהתפוח\tNNP\tNNP\t_\t4\n3\t6\tהתפוח\tהתפוח\tNNP\tNNP\tgen=F|gen=M|num=S\t4\n3\t6\tהתפוח\tהתפוח\tNN\tNN\tgen=F|num=P\t4\n3\t6\tהתפוח\tהתפוח\tNN\tNN\tgen=F|num=S\t4\n3\t6\tהתפוח\tהתפוח\tNN\tNN\tgen=M|num=P\t4\n4\t6\tתפוח\tתפוח\tNNT\tNNT\tgen=M|num=S\t4\n4\t6\tתפוח\tתפוח\tNN\tNN\tgen=M|num=S\t4\n4\t6\tתפוח\tתפוח\tJJ\tJJ\tgen=M|num=S\t4\n4\t6\tתפוח\tתפוח\tJJT\tJJT\tgen=M|num=S\t4\n5\t6\tתפוח\tתפוח\tNNT\tNNT\tgen=M|num=S\t4\n5\t6\tתפוח\tתפוח\tNN\tNN\tgen=M|num=S\t4\n5\t6\tתפוח\tתפוח\tJJ\tJJ\tgen=M|num=S\t4\n5\t6\tתפוח\tתפוח\tJJT\tJJT\tgen=M|num=S\t4\n6\t7\tה\tה\tDEF\tDEF\t_\t5\n6\t8\tה\tה\tREL\tREL\t_\t5\n6\t9\tהטעים\tהטעים\tVB\tVB\tgen=M|num=S|per=3|tense=PAST\t5\n7\t9\tטעים\tטעים\tJJT\tJJT\tgen=M|num=S\t5\n7\t9\tטעים\tטעים\tJJ\tJJ\tgen=M|num=S\t5\n8\t9\tטעים\tטעים\tJJT\tJJT\tgen=M|num=S\t5\n8\t9\tטעים\tטעים\tJJ\tJJ\tgen=M|num=S\t5\n9\t10\tו\tו\tCONJ\tCONJ\t_\t6\n9\t12\tוהיפה\tוהיפה\tNNP\tNNP\tgen=M|num=S\t6\n9\t12\tוהיפה\tוהיפה\tNN\tNN\tgen=M|num=P|num=S\t6\n9\t12\tוהיפה\tוהיפה\tNN\tNN\tgen=M|num=S\t6\n9\t12\tוהיפה\tוהיפה\tNNP\tNNP\tgen=F|num=S\t6\n9\t12\tוהיפה\tוהיפה\tNNP\tNNP\tgen=F|gen=M|num=S\t6\n9\t12\tוהיפה\tוהיפה\tNNP\tNNP\t_\t6\n9\t12\tוהיפה\tוהיפה\tNN\tNN\tgen=M|num=P\t6\n9\t12\tוהיפה\tוהיפה\tNN\tNN\tgen=F|num=S\t6\n9\t12\tוהיפה\tוהיפה\tNN\tNN\tgen=F|num=P\t6\n10\t11\tה\tה\tDEF\tDEF\t_\t6\n11\t12\tיפה\tיפה\tJJ\tJJ\tgen=F|num=S\t6\n11\t12\tיפה\tיפה\tVB\tVB\tgen=M|num=S|per=3|tense=PAST\t6\n11\t12\tיפה\tיפה\tJJT\tJJT\tgen=M|num=S\t6\n11\t12\tיפה\tיפה\tJJ\tJJ\tgen=M|num=S\t6\n11\t12\tיפה\tיפה\tRB\tRB\t_\t6\n11\t12\tיפה\tיפה\tINTJ\tINTJ\t_\t6\n11\t12\tיפה\tיפה\tNNP\tNNP\tgen=F|num=S\t6\n11\t12\tיפה\tייפה\tVB\tVB\tgen=M|num=S|per=3|tense=PAST\t6\n11\t12\tיפה\tייפה\tVB\tVB\tgen=M|num=S|per=2|tense=IMPERATIVE\t6\n\n', 
'md_lattice': '0\t1\tדני\tדני\tNNP\tNNP\tgen=M|num=S\t1\n1\t2\tקטף\tקטף\tVB\tVB\tgen=M|num=S|per=3|tense=PAST\t2\n2\t3\tאת\tאת\tAT\tAT\t_\t3\n3\t4\tה\tה\tDEF\tDEF\t_\t4\n4\t5\tתפוח\tתפוח\tNN\tNN\tgen=M|num=S\t4\n5\t6\tה\tה\tDEF\tDEF\t_\t5\n6\t7\tטעים\tטעים\tJJ\tJJ\tgen=M|num=S\t5\n7\t8\tו\tו\tCONJ\tCONJ\t_\t6\n8\t9\tה\tה\tDEF\tDEF\t_\t6\n9\t10\tיפה\tיפה\tJJ\tJJ\tgen=M|num=S\t6\n\n', 
'dep_tree': '1\tדני\tדני\tNNP\tNNP\tgen=M|num=S\t2\tsubj\r\t_\t_\n2\tקטף\tקטף\tVB\tVB\tgen=M|num=S|per=3|tense=PAST\t8\tconj\r\t_\t_\n3\tאת\tאת\tAT\tAT\t\t2\tobj\r\t_\t_\n4\tה\tה\tDEF\tDEF\t\t5\tdef\r\t_\t_\n5\tתפוח\tתפוח\tNN\tNN\tgen=M|num=S\t3\thd\r\t_\t_\n6\tה\tה\tDEF\tDEF\t\t7\tdef\r\t_\t_\n7\tטעים\tטעים\tJJ\tJJ\tgen=M|num=S\t5\tamod\r\t_\t_\n8\tו\tו\tCONJ\tCONJ\t\t0\tROOT\t_\t_\n9\tה\tה\tDEF\tDEF\t\t10\tdef\r\t_\t_\n10\tיפה\tיפה\tJJ\tJJ\tgen=M|num=S\t8\tconj\r\t_\t_\n\n'}

```
Or if you want you can clean the escape characters and get the output in the same format as the command line output files:

```console
    $ curl -s -X GET -H 'Content-Type: application/json' -d'{"text": "דני קטף את התפוח היפה והטעים  "}' localhost:8000/yap/heb/joint | jq '.ma_lattice, .md_lattice, .dep_tree' | sed -e 's/^.//' -e 's/.$//' -e 's/\\t/\t/g' -e 's/\\n/\n/g'
```
In order to have the commands above need to make sure jq is installed.

#### YAP remote API Server
There is an API that can be used for all the features mentioned:
- [The API website](https://www.langndata.com/heb_parser/overview)
This API has limititations:
- A registration is needed.
- 1 call per 3 seconds
- 250 words max per call
- Long text needs longer processing time, Need to set your HTTP call timeout accordingly

### Using YAP API via Python
When sending the request from a Python client, try using this code:
```python
    import requests
    text = 'דני קטף את התפוח הטעים והיפה '
    localhost_yap = "http://localhost:8000/yap/heb/joint"
    data = '{{"text": "{}  "}}'.format(text).encode('utf-8')  # input string ends with two space characters
    headers = {'content-type': 'application/json'}
    response = requests.get(url=localhost_yap, data=data, headers=headers)
    json_response = response.json()
```
## Wrappers
**Python Wrapper** - credit to Amit Shkolnik
The Python Wrapper connects to the YAP api.
The API needs to be running either locally or remotely.
The wrapper sends the server a joint command, parses the response and can give these results from the input:
- Tokenized Text
- Segmented Text
- Lemmas
- Dependency tree
- md command result
- ma command result
To Run the python wrapper we can use these commands:
```python
    text1 = 'היום הם הולכים לקניון'
    ip='127.0.0.1:8000'
    yap=YapApi()
    tokenized_text, segmented_text, lemmas, dep_tree, md_lattice, ma_lattice=yap.run(text1, ip)
```

```python
	tokenized_text
	היום הם הולכים לקניון
	segmented_text
	היום הם הולכים ל ה קניון
	lemmas
	היום הוא הלך ל ה קניון
	dep_tree
	  num    word  lemma          pos        pos_2              empty dependency_arc dependency_part dependency_arc_2 dependency_part_2
	0   1    היום   היום           RB           RB                                 3            tmod                _                 _
	1   2      הם    הוא          PRP          PRP  gen=M|num=P|per=3              3            subj                _                 _
	2   3  הולכים    הלך           BN           BN  gen=M|num=P|per=A              0            ROOT                _                 _
	3   4       ל      ל  PREPOSITION  PREPOSITION                                 3         prepmod                _                 _
	4   5       ה      ה          DEF          DEF                                 6             def                _                 _
	5   6   קניון  קניון           NN           NN        gen=M|num=S              4            pobj                _                 _
	md_lattice
	  num num_2    word  empty          pos  ... num_s_p per tense num_last  lemma
	0   0     1    היום     -1           RB  ...      -1  -1    -1        1   היום
	1   1     2      הם     -1          PRP  ...       P   3    -1        2    הוא
	2   2     3  הולכים     -1           BN  ...       P   A    -1        3    הלך
	3   3     4       ל     -1  PREPOSITION  ...      -1  -1    -1        4      ל
	4   4     5       ה     -1          DEF  ...      -1  -1    -1        4      ה
	5   5     6   קניון     -1           NN  ...       S  -1    -1        4  קניון

	[6 rows x 12 columns]
	ma_lattice
	   num num_2    word   lemma  ... num_last suf_gen  suf_num suf_per
	0    0     1       ה       ה  ...       -1      -1       -1      -1
	1    0     2       ה       ה  ...       -1      -1       -1      -1
	2    0     3    היום    היום  ...       -1      -1       -1      -1
	3    1     3     יום     יום  ...       -1      -1       -1      -1
	4    1     3     יום     יום  ...       -1      -1       -1      -1
	5    2     3     יום     יום  ...       -1      -1       -1      -1
	6    2     3     יום     יום  ...       -1      -1       -1      -1
	7    3     4      הם     הוא  ...       -1      -1       -1      -1
	8    3     4      הם     הוא  ...       -1      -1       -1      -1
	9    4     5  הולכים     הלך  ...       -1      -1       -1      -1
	10   4     5  הולכים     הלך  ...       -1      -1       -1      -1
	11   5     6       ל       ל  ...       -1      -1       -1      -1
	12   5     8  לקניון  לקניון  ...       -1      -1       -1      -1
	13   5     8  לקניון  לקניון  ...       -1      -1       -1      -1
	14   5     8  לקניון  לקניון  ...       -1      -1       -1      -1
	15   5     8  לקניון  לקניון  ...       -1      -1       -1      -1
	16   5     8  לקניון  לקניון  ...       -1      -1       -1      -1
	17   5     8  לקניון  לקניון  ...       -1      -1       -1      -1
	18   5     8  לקניון  לקניון  ...       -1      -1       -1      -1
	19   5     8  לקניון  לקניון  ...       -1      -1       -1      -1
	20   5     8  לקניון  לקניון  ...       -1      -1       -1      -1
	21   6     7       ה       ה  ...       -1      -1       -1      -1
	22   6     8   קניון   קניון  ...       -1      -1       -1      -1
	23   6     8   קניון   קניון  ...       -1      -1       -1      -1
	24   7     8   קניון   קניון  ...       -1      -1       -1      -1
	25   7     8   קניון   קניון  ...       -1      -1       -1      -1

	[26 rows x 15 columns]
```

**R Wrapper** - credit to Almog Simchon
The Python Wrapper connects to the YAP api.
The API needs to be running either locally or remotely.
The wrapper sends the server a joint command, parses the response and can give these results from the input:
- Lemmas
- CoNLL style dependency tree
- Lattice style dependency tree

You can find the R Wrapper GitHub Repository [**here**](https://github.com/almogsi/yappr)

To Run the R wrapper we can use these commands:
```R
text <- "גנן גידל דגן בגן"
token <- "YourAPIToken"
yap_list <- yap(text, token)

yap_lemmas(yap_list) #get lemmas
dep_conll(yap_list) #get CoNLL style dependency tree
dep_lattice(yap_list) #get Lattice style dependency tree
```
The results will be the same as the python wrapper.

## Future Projections
Our goal is to make YAP easy to use for every developer who is interested in using it.
We also indend on having Hebrew NLP in the forefront of NLP and all in Open Source.