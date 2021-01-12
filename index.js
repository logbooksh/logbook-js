import antlr4 from 'antlr4';
import MyGrammarLexer from './logbookLexer.js';
import MyGrammarParser from './logbookParser.js';
import MyGrammarListener from './logbookListener.js';

const input = `
#mytag #mytag2 [myprop: value with spaces ] #myspace
[otherprop: 123]
#tag3-with-dashes_and_underscores

(21:12) [Title: Task title]

This is my log entry note;

(22:13) This is another log entry, with a title.

This is the note.

(22:13) [Start] My task #with-a-tag [Prop: propval]
                [Id: 123]

This is a fancy task with tags and properties.

[Prop: trailing-prop]
`;

const chars = new antlr4.InputStream(input);
const lexer = new MyGrammarLexer(chars);
const tokens  = new antlr4.CommonTokenStream(lexer);
const parser = new MyGrammarParser(tokens);
parser.buildParseTrees = true;

const tree = parser.logsheet();
console.log(tree.toStringTree(parser.ruleNames));
