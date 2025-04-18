% Base de connaissances avec sous-catégories et propriétés
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

% Propriétés des éléments
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

% Demander à l'utilisateur de penser à quelque chose
deviner :-
    write('Pensez à quelque chose dans une des catégories suivantes: animal, super-héros, jeu vidéo, animé.'), nl,
    write('Avez-vous pensé à quelque chose ? (oui/non) '), read(Reponse),
    Reponse == oui, choisir_categorie.

% Choisir une catégorie
choisir_categorie :-
    write('Dans quelle catégorie se trouve votre choix ? '), read(Categorie),
    categorie(Categorie), !, poser_questions_sous_categorie(Categorie).

% Poser des questions en fonction de la sous-catégorie
poser_questions_sous_categorie(Categorie) :-
    sous_categorie(Categorie, SousCategorie),
    write('Est-ce que cela appartient à la sous-catégorie '), write(SousCategorie), write(' ? (oui/non) '),
    read(Reponse),
    (Reponse == oui -> poser_questions_proprietes(SousCategorie); poser_questions_sous_categorie(Categorie)).

% Poser des questions sur les propriétés
poser_questions_proprietes(SousCategorie) :-
    propriete(Element, Propriete),
    write('Est-ce que ce que vous avez en tête a la propriété suivante : '), write(Propriete), write(' ? (oui/non) '),
read(Reponse),
(Reponse == oui -> deviner_element(SousCategorie, [Propriete]); poser_questions_proprietes(SousCategorie)).

% Deviner l'élément
deviner_element(SousCategorie, Proprietes) :-
element(SousCategorie, Element),
verifier_proprietes(Element, Proprietes),
write('Pensez-vous à '), write(Element), write(' ? (oui/non) '),
read(Reponse),
(Reponse == oui -> annoncer_defaite; annoncer_victoire).

% Vérifier si un élément a toutes les propriétés
verifier_proprietes(Element, Proprietes) :-
forall(member(Propriete, Proprietes), propriete(Element, Propriete)).

% Annoncer la défaite de l'utilisateur
annoncer_defaite :-
write('J'ai deviné! Vous avez perdu.').

% Annoncer la victoire de l'utilisateur
annoncer_victoire :-
write('Félicitations! Vous avez gagné. Je n'ai pas pu deviner à quoi vous pensiez.').

% Lancer le jeu
lancer_jeu :- deviner.

% Exécuter le jeu
:- lancer_jeu.
