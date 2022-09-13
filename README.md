#  CSCI 1103 Computer Science I Honors

## Fall 2022

Boston College

---

## Lecture Notes

## Week 14

**Topics:**

1. Data Integrity; Data Modeling
2. Message Passing Style; Object-Oriented Programming
3. Abstract Data Types

---

### 1. Data Integrity; Data Modeling

An information system representing students, might have an `age` field of type integer. The value of this field is probably a natural number between 5 and say 25. But if the constraint is that it is an integer, what is to prevent the `age` field from containing the integer 800? Distinctions between integers in the range 5 and 25 and integers like 800 cannot be discerned by a compiler. Instead we can install *assertions* in the code which express invariants on the data. These assertions can be executed at run-time.

##### Making Impossible States Unrealizable

In some cases, we can increase our confidence in the integrity of data by a judicious design of our data types. In particular, by exposing data integrity constraints to the type checker. For example, an infant and an adult are both people. But we would not expect an infant to have a driver's license. It would be wrong to have a data structure representing an infant that possesses one. An error like this can be detected when the program is executed (i.e., at run-time) but it's also possible to design the data structures so that it would be impossible to express such a structure. See the code in `src/dataintegrity` and see the slides in `slides/`.

### 2. Message Passing Style; Object-Oriented Programming

[Message Passing](https://en.wikipedia.org/wiki/Message_passing) is a coding style in which a set of computational artifacts carry out a computation by sending "messages" to one another. If a language has record types and function types, then one can code in message passing style by representing the artifacts as records in which fields contain function values. The "messages" are then simply the names of the record fields containing function values.

Object-oriented programming is a message passing style in which the record includes fields with state information and in which the functions residing in the fields holding function values, can access the fields with the state information.

See the code in `src/messagepassing` and see the slides in `slides/`.

### 3. Abstract Data Types

See some background on [Turing Award](https://www.heidelberg-laureate-forum.org/laureates/awards/acm-am-turing-award.html#:~:text=Turing%20Award%20is%20an%20annual,%22Nobel%20Prize%20of%20Computing%22.) winner [Barbara Liskov](https://www.quantamagazine.org/barbara-liskov-is-the-architect-of-modern-algorithms-20191120/) in Quantamagazine, see the code in `src/adts/` and see the slides in `slides/`.

At the outset of this course we were naturally focussed on developing simple programs that solved small problems.  We learned that functions played the key role and we've spent a fair amount of time writing functions and collections of functions that cooperatively carry out a computational task.

Here at the tail end of the course, we've turned out attention to aspects of coding in the large. We've found that groups of related definitions can be grouped together in larger modular units. These related definitions common implement either:

1. some sort of useful service, or

2. a new type.

Examples of services include input/output support, network support, graphical support and so on. We won't consider them further here.

Learning how to develop new types is an especially important topic and is one of the main themes of the follow-on course (CS1102). Generally speaking, most people follow the practice of abstract data types (ADTs) as proposed by Barbara Liskov (in the programming language CLU).

The ideas relating to ADTs are motivated by practical concerns about the engineering of software and the software lifecycle.  In particular, well-designed ADTs ensure that when some agent designs and implements a new type, those making use of the new type (the clients) have what they need and they don't have what they don't need.  In particular, they don't have to know about the type's internal representation and implementation details.

ADTs have two parts:

1. a *specification*

2. an *implementation*

Different programming languages provide varying levels of support for developing ADTs. Generally speaking, specifications involve types so languages without type notation (such as Python) don't support ADTs as robustly as languages that feature type notation such as Java, OCaml, C#, F#, Swift and so forth.

The main requirements for the specification of an ADT are:

1. a name for the new type
2. a list of specifications of operations on values of the new type

The main requirements for the implementation of an ADT are:

1. a hidden, internal type for representing values of the new type
2. implementations of each of the specified operations.

In practice, the documentation of the specified operations on the new type often include efficiency information. 
