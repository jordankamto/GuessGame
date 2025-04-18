% Base de connaissances avec sous-cat�gories et propri�t�s
categorie(animal).
categorie(super_heros).
categorie(jeu_video).
categorie(anime).

sous_categorie(animal, mamifere).
sous_categorie(animal, oiseau).
sous_categorie(super_heros, marvel).
sous_categorie(super_heros, dc).
sous_categorie(jeu_video, rpg).
sous_categorie(jeu_video, action).
sous_categorie(anime, shonen).
sous_categorie(anime, seinen).

% Propri�t�s des �l�ments
% Format: propriete(Element, Propriete).
propriete(lion, carnivore).
propriete(lion, a_criniere).
propriete(tigre, carnivore).
propriete(tigre, rayures).
propriete(aigle, vole).
propriete(aigle, rapace).
propriete(perroquet, vole).
propriete(perroquet, parle).
propriete(spiderman, marvel).
propriete(spiderman, pouvoirs_aranee).
propriete(ironman, marvel).
propriete(ironman, armure).
propriete(batman, dc).
propriete(batman, pas_de_pouvoirs).
propriete(superman, dc).
propriete(superman, super_pouvoirs).
propriete(final_fantasy, rpg).
propriete(final_fantasy, univers_fantastique).
propriete(zelda, rpg).
propriete(zelda, aventure).
propriete(call_of_duty, action).
propriete(call_of_duty, guerre).
propriete(fortnite, action).
propriete(fortnite, battle_royale).
propriete(naruto, shonen).
propriete(naruto, ninja).
propriete(one_piece, shonen).
propriete(one_piece, pirates).
propriete(attack_on_titan, seinen).
propriete(attack_on_titan, titans).
propriete(death_note, seinen).
propriete(death_note, surnaturel).

% Demander � l'utilisateur de penser � quelque chose
deviner :-
    write('Pensez � quelque chose dans une des cat�gories suivantes: animal, super-h�ros, jeu vid�o, anim�.'), nl,
    write('Avez-vous pens� � quelque chose ? (oui/non) '), read(Reponse),
    Reponse == oui, choisir_categorie.

% Choisir une cat�gorie
choisir_categorie :-
    write('Dans quelle cat�gorie se trouve votre choix ? '), read(Categorie),
    categorie(Categorie), !, poser_questions_sous_categorie(Categorie).

% Poser des questions en fonction de la sous-cat�gorie
poser_questions_sous_categorie(Categorie) :-
    sous_categorie(Categorie, SousCategorie),
    write('Est-ce que cela appartient � la sous-cat�gorie '), write(SousCategorie), write(' ? (oui/non) '),
    read(Reponse),
    (Reponse == oui -> poser_questions_proprietes(SousCategorie); poser_questions_sous_categorie(Categorie)).

% Poser des questions sur les propri�t�s
poser_questions_proprietes(SousCategorie) :-
    propriete(Element, Propriete),
    write('Est-ce que ce que vous avez en t�te a la propri�t� suivante : '), write(Propriete), write(' ? (oui/non) '),
read(Reponse),
(Reponse == oui -> deviner_element(SousCategorie, [Propriete]); poser_questions_proprietes(SousCategorie)).

% Deviner l'�l�ment
deviner_element(SousCategorie, Proprietes) :-
element(SousCategorie, Element),
verifier_proprietes(Element, Proprietes),
write('Pensez-vous � '), write(Element), write(' ? (oui/non) '),
read(Reponse),
(Reponse == oui -> annoncer_defaite; annoncer_victoire).

% V�rifier si un �l�ment a toutes les propri�t�s
verifier_proprietes(Element, Proprietes) :-
forall(member(Propriete, Proprietes), propriete(Element, Propriete)).

% Annoncer la d�faite de l'utilisateur
annoncer_defaite :-
write('J'ai devin�! Vous avez perdu.').

% Annoncer la victoire de l'utilisateur
annoncer_victoire :-
write('F�licitations! Vous avez gagn�. Je n'ai pas pu deviner � quoi vous pensiez.').

% Lancer le jeu
lancer_jeu :- deviner.

% Ex�cuter le jeu
:- lancer_jeu.
