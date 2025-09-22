% Family Facts Database

% Parent Facts
% Format: parent(Child, Parent).
parent(alex, tom).
parent(alex, lisa).
parent(mary, tom).
parent(mary, lisa).
parent(john, alex).
parent(sarah, alex).
parent(lisa, bob).
parent(mark, mary).

% Gender Facts
% Format: male(Person).
male(tom).
male(bob).
male(john).
male(mark).
male(alex).

% Format: female(Person).
female(lisa).
female(mary).
female(sarah).

% Married Couples Facts
% Format: married(Husband, Wife).
married(tom, lisa).
married(bob, lisa). % Assuming lisa remarried after tom
married(alex, sarah).
married(mark, mary).