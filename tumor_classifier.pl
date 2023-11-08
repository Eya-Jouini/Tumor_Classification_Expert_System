% D�finition d'un pr�dicat dynamique pour stocker les valeurs des attributs.
:- dynamic attribute/2.

% R�gle 1
diagnose_tumor('Maligne') :-
    attribute(mean_radius, MeanRadius),
    MeanRadius < 10,
    !.

% R�gle 2
diagnose_tumor('Maligne') :-
    attribute(mean_smoothness, MeanSmoothness),
    (MeanSmoothness < 0.07 ; MeanSmoothness > 0.15),
    !.

% R�gle 3
diagnose_tumor('Maligne') :-
    attribute(mean_perimeter, MeanPerimeter),
    MeanPerimeter < 71,
    !.

% R�gle 4
diagnose_tumor('B�nigne') :-
    attribute(mean_perimeter, MeanPerimeter),
    MeanPerimeter > 115,
    !.

% R�gle 5
diagnose_tumor('B�nigne') :-
    attribute(mean_radius, MeanRadius),
    attribute(mean_perimeter, MeanPerimeter),
    attribute(mean_texture, MeanTexture),
    MeanRadius > 18,
    MeanPerimeter > 100,
    MeanTexture > 19,
    !.

% R�gle 6
diagnose_tumor('Maligne') :-
    attribute(mean_radius, MeanRadius),
    attribute(mean_smoothness, MeanSmoothness),
    MeanRadius < 15,
    MeanSmoothness < 0.12,
    !.

% R�gle 7
diagnose_tumor('B�nigne') :-
    attribute(mean_radius, MeanRadius),
    attribute(mean_smoothness, MeanSmoothness),
    MeanRadius > 15,
    MeanSmoothness > 0.08,
    !.

% R�gle 8
diagnose_tumor('Maligne') :-
    attribute(mean_radius, MeanRadius),
    attribute(mean_texture, MeanTexture),
    MeanRadius < 15,
    MeanTexture > 9,
    MeanTexture < 23,
    !.

% R�gle 9
diagnose_tumor('B�nigne') :-
    attribute(mean_radius, MeanRadius),
    attribute(mean_texture, MeanTexture),
    MeanRadius > 15,
    MeanTexture > 18,
    !.

% R�gle par d�faut
diagnose_tumor('Inconnu').

% Interroger l'utilisateur pour les valeurs des attributs
ask_attributes :-
    write('Entrez le rayon moyen: '),
    read(MeanRadius),
    assert(attribute(mean_radius, MeanRadius)),
    write('Entrez la texture moyenne: '),
    read(MeanTexture),
    assert(attribute(mean_texture, MeanTexture)),
    write('Entrez le p�rim�tre moyen: '),
    read(MeanPerimeter),
    assert(attribute(mean_perimeter, MeanPerimeter)),
    write('Entrez la douceur moyenne: '),
    read(MeanSmoothness),
    assert(attribute(mean_smoothness, MeanSmoothness)).

% R�gle principale de diagnostic
main :-
    write('Bienvenue dans le Syst�me Expert de Diagnostic des Tumeurs.'), nl,
    write('Veuillez fournir les informations suivantes:'), nl,
    ask_attributes,
    diagnose_tumor(Diagnosis),
    nl,
    write('Nature de la tumeur : '), write(Diagnosis), nl.

% D�marrer le syst�me expert
:- main.
