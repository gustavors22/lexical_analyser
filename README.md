# What is lexical analysis

The lexical analysis also known as scanner or reading is the first phase of a compilation process and its function is to read the source program, character by character, group the characters in lexemes and produce a sequence of lexical symbols known as tokens.

The sequence of tokens is sent to be processed by parsing which is the next phase of the compilation process.

The lexical analyzer must interact with the symbol table by inserting information from some tokens, such as identifiers. At the implementation level, lexical analysis is usually a subroutine of syntactic analysis forming a single step, but there is a conceptual division to simplify the modularization of a compiler project.

![Compilers and Interpreters. Welcome to the second article in the… | by  Faiçal Tchirou | HackerNoon.com | Medium](https://miro.medium.com/max/1828/1*RILS4frRfsqfyuvPINojOw.png)

# Flex

Flex (fast lexical analyzer generator) is a free and open-source software alternative to lex. It is a computer program that generates lexical analyzers (also known as "scanners" or "lexers"). It is frequently used as the lex implementation together with Berkeley Yacc parser generator on BSD-derived operating systems (as both lex and yacc are part of POSIX), or together with GNU bison (a version of yacc) in *BSD ports[8] and in Linux distributions. Unlike Bison, flex is not part of the GNU Project and is not released under the GNU General Public License, although a manual for Flex was produced and published by the Free Software Foundation.

![Using Lex 1 Flex Lexical Analyzer Generator A](https://slidetodoc.com/presentation_image_h/1212a3574e7a1768ecf1aea0412c28cc/image-2.jpg)

# How to run



```shell
sudo apt-get update
sudo apt-get install flex

git clone https://github.com/gustavors22/lexical_analyser.git

cd lexical_analyser
flex lexicalAnalyser.l
gcc lex.yy.c -o lexic 
./lexic <your_file.c> <output.txt>
```

