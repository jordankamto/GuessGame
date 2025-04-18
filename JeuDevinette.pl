% Base de connaissances
categorie(animal).
categorie(super_heros).
categorie(jeu_video).
categorie(anime).

% Sous-catégories et éléments
sous_categorie(animal, mamifere).
sous_categorie_B(animal, oiseau).
sous_categorie_C(animal, poisson).
sous_categorie_D(animal, reptile).
sous_categorie(super_heros, marvel).
sous_categorie_B(super_heros, dc).
sous_categorie_C(super_heros, avengers).
sous_categorie_D(super_heros, xmen).
sous_categorie(jeu_video, rpg).
sous_categorie_B(jeu_video, action).
sous_categorie_C(jeu_video, simulation).
sous_categorie_D(jeu_video, sport).
sous_categorie(anime, shonen).
sous_categorie_B(anime, seinen).
sous_categorie_C(anime, isekai).
sous_categorie_D(anime, slice_of_life).

element(mamifere, lion).
element_B(mamifere, tigre).
element(oiseau, aigle).
element_B(oiseau, perroquet).
element(poisson, requin).
element_B(poisson, carpe).
element(reptile, serpent).
element_B(reptile, tortue).
element(marvel, spiderman).
element_B(marvel, ironman).
element(avengers, captain_america).
element_B(avengers, thor).
element(dc, batman).
element_B(dc, superman).
element(xmen, wolverine).
element_B(xmen, magneto).
element(rpg, final_fantasy).
element_B(rpg, zelda).
element(action, call_of_duty).
element_B(action, fortnite).
element(simulation, the_sims).
element_B(simulation, sim_city).
element(sport, fifa).
element_B(sport, nba_2k).
element(shonen, naruto).
element_B(shonen, one_piece).
element(seinen, attack_on_titan).
element_B(seinen, death_note).
element(isekai, sword_art_online).
element_B(isekai, reincarnated_as_a_slime).
element(slice_of_life, your_name).
element_B(slice_of_life, oshi_no_ko).

% Demander à l'utilisateur de penser à quelque chose
deviner :-
    write('Pensez \u00e0 quelque chose dans une des cat\u00e9gories suivantes: animal, super-h\u00e9ros, jeu vid\u00e9o, anim\u00e9.'), nl,
    write('Avez-vous pens\u00e9 \u00e0 quelque chose ? (oui/non) '), read(Reponse),
    (Reponse == oui, write(''), nl, choisir_categorie, nl ;
    Reponse == non, write('Vous devez pensez à quelque chose dans ces catégories.'), nl, write(''), nl, deviner, nl ;
    write('Réponse incorect. Vous devez répondre par "oui" ou par "non".'), nl, write(''), nl, deviner, nl).

% Choisir une catégorie
choisir_categorie :-
    write('Dans quelle cat\u00e9gorie se trouve votre choix ? '), read(Categorie),
    categorie(Categorie), !, poser_questions(Categorie).

% Poser des questions en fonction de la catégorie
poser_questions(Categorie) :-
    sous_categorie(Categorie, SousCategorie),
    write('Est-ce que cela appartient \u00e0 la sous-cat\u00e9gorie '), write(SousCategorie), write(' ? (oui/non) '),
    read(Reponse),
    (Reponse == oui -> deviner_element(SousCategorie); poser_questions_B(Categorie)).
    
% Poser des questions en fonction de la catégorie
poser_questions_B(Categorie) :-
    sous_categorie_B(Categorie, SousCategorie),
    write('Est-ce que cela appartient \u00e0 la sous-cat\u00e9gorie '), write(SousCategorie), write(' ? (oui/non) '),
    read(Reponse),
    (Reponse == oui -> deviner_element_B(SousCategorie); poser_questions_C(Categorie)).
    
% Poser des questions en fonction de la catégorie
poser_questions_C(Categorie) :-
    sous_categorie_C(Categorie, SousCategorie),
    write('Est-ce que cela appartient \u00e0 la sous-cat\u00e9gorie '), write(SousCategorie), write(' ? (oui/non) '),
    read(Reponse),
    (Reponse == oui -> deviner_element_C(SousCategorie); poser_questions_D(Categorie)).
    
% Poser des questions en fonction de la catégorie
poser_questions_D(Categorie) :-
    sous_categorie_D(Categorie, SousCategorie),
    write('Est-ce que cela appartient \u00e0 la sous-cat\u00e9gorie '), write(SousCategorie), write(' ? (oui/non) '),
    read(Reponse),
    (Reponse == oui -> deviner_element_D(SousCategorie); poser_questions(Categorie)).

% Deviner l'élément
deviner_element(SousCategorie) :-
    element(SousCategorie, Element),
    write('Pensez-vous \u00e0 '), write(Element), write(' ? (oui/non) '),
    read(Reponse),
    (Reponse == oui -> annoncer_defaite; annoncer_victoire).
    
% Deviner l'élément
deviner_element_B(SousCategorie) :-
    element_B(SousCategorie, Element),
    write('Pensez-vous \u00e0 '), write(Element), write(' ? (oui/non) '),
    read(Reponse),
    (Reponse == oui -> annoncer_defaite; annoncer_victoire).
    
% Deviner l'élément
deviner_element_C(SousCategorie) :-
    element(SousCategorie, Element),
    write('Pensez-vous \u00e0 '), write(Element), write(' ? (oui/non) '),
    read(Reponse),
    (Reponse == oui -> annoncer_defaite; annoncer_victoire).
    
% Deviner l'élément
deviner_element_D(SousCategorie) :-
    element_B(SousCategorie, Element),
    write('Pensez-vous \u00e0 '), write(Element), write(' ? (oui/non) '),
    read(Reponse),
    (Reponse == oui -> annoncer_defaite; annoncer_victoire).

% Annoncer la défaite de l'utilisateur
annoncer_defaite :-
    write('J\'ai devin\u00e9! Vous avez perdu.').

% Annoncer la victoire de l'utilisateur
annoncer_victoire :- write('Félicitations! Vous avez gagné. Je n\'ai pas pu deviner à quoi vous pensiez.').

% Lancer le jeu
lancer_jeu :- deviner.

% Exécuter le jeu
:- lancer_jeu.
