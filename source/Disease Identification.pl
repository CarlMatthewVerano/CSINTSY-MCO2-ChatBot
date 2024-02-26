go:-
    write('Answer y/yes when you have a certain symptom, otherwise answer n/no'),
    nl,
    hypothesis(Disease),
    write('I believe that the patient has '),
    write(Disease),
    nl,
    write('TAKE CARE '),
    undo.

% Hypothesis that should be tested
hypothesis(rabies)     :- rabies, !.
hypothesis(diabetes)      :- diabetes, !.
hypothesis(asthma)  :- asthma, !.
hypothesis(cholera)  :- cholera, !.
hypothesis(pneumonia)  :- pneumonia, !.
hypothesis(diarrhea)  :- diarrhea, !.
hypothesis(tuberculosis)     :- tuberculosis, !.
hypothesis(measles)      :- measles, !.
hypothesis(dengue)  :- dengue, !.
hypothesis(leptospirosis)  :- leptospirosis, !.
hypothesis(disease_cannot_be_determined). /* no diagnosis*/


% Hypothesis Identification Rules
rabies :-
    verify(fever),
    verify(headache),
    verify(weakness/discomfort),
    (verify(hydrophobia);
    verify(hallucinations);
    verify(abnormal_behavior);
    verify(agitation);
    verify(delirium);
    verify(dizziness);
    verify(anxiety);
    verify(insomnia);
    verify(_)),
    write('Advices and Suggestions:'),
    nl,
    write('1: Rapid and accurate laboratory diagnosis of rabies in humans and other animals is essential for timely administration of postexposure prophylaxis.'),
    nl.

diabetes :-
    verify(darkened_skin),
    verify(frequent_urination),
    verify(increased_thirst),
    verify(fatigue),
    (verify(numbness);
    verify(blurred_vision);
    verify(increased_hunger);
    verify(_)),
    write('Advices and Suggestions:'),
    nl,
    write('1: Healthy eating, regular exercise, weight loss, possibly, diabetes medication or insulin therapy, or blood sugar monitoring.'),
    nl.

asthma :-
    verify(wheezing),
    verify(breathlessness),
    verify(tight_chest),
    verify(pain_behind_eyes),
    write('Advices and Suggestions:'),
    nl,
    write('1: Use a reliever inhaler to treat your symptoms when they occur.'),
    nl.

cholera :-
    verify(watery_stools),
    verify(diarrhea),
    verify(vomiting),
    verify(dehydration),
    verify(leg_cramps),
    (verify(fever);
    verify(restlessness);
    verify(_)),
    write('Advices and Suggestions:'),
    nl,
    write('1: Hydration, antibiotics and zinc supplements'),
    nl.

pneumonia :-
    verify(difficult_breathing),
    verify(coughs_with_yellow/green/bloody_mucus),
    verify(fever),
    verify(chest_pain),
    (verify(fast_breathing);
    verify(wheezing);
    verify(chills);
    verify(loss_of_appetite);
    verify(fatigue);
    verify(_)),
    write('Advices and Suggestions:'),
    nl,
    write('1: Pneumonia should be treated with antibiotics. The antibiotic of choice for first line treatment is amoxicillin dispersible tablets.'),
    nl,
    write('2: Most cases of pneumonia require oral antibiotics, which are often prescribed at a health center.'),
    nl.

diarrhea :-
    verify(watery_stools),
    verify(abdominal_pain),
    verify(abdominal_cramps),
    verify(fever),
    verify(bleeding_in_the_butt),
    verify(dizziness),
    (verify(cramping);
    verify(nausea);
    verify(bloody_stools);
    verify(vomiting);
    verify(_)),
    write('Advices and Suggestions:'),
    nl,
    write('1: Interventions to prevent diarrhoea, including safe drinking-water, use of improved sanitation and hand washing with soap can reduce disease risk.'),
    nl,
    write('2: Diarrhoea should be treated with oral rehydration solution, a solution of clean water, sugar and salt.'),
    nl.

tuberculosis :-
    verify(cough),
    verify(chest_pain),
    verify(fatigue),
    verify(night_sweats),
    verify(chills),
    verify(fever),
    verify(loss_of_appetite),
    verify(weight_loss),
    (verify(back_pain);
    verify(blood_in_urine);
    verify(swollen_neck_veins);
    verify(difficulty_breathing);
    verify(_)),
    write('Advices and Suggestions:'),
    nl,
    write('1: If you have latent TB, your doctor will give you medication to kill the bacteria so the infection does not become active. You might get isoniazid, rifapentine, or rifampin, either alone or combined. You will have to take the drugs for up to 9 months.'),
    nl,
    write('2: A combination of medicines also treats active TB. The most common are ethambutol, isoniazid, pyrazinamide, and rifampin. You will take them for 6 to 12 months.'),
    nl.

measles :-
    verify(fever),
    verify(skin_rash),
    verify(runny_nose),
    verify(red_eyes),
    verify(sore_throat),
    verify(tiny_white_bumps_in_mouth),
    write('Advices and Suggestions:'),
    nl,
    write('1: If you do get the measles virus, medicine will not cure it (most drugs does not kill viruses).'),
    nl,
    write('2: The best way to speed up your recovery and prevent complications is to drink plenty of fluids and get lots of rest.'),
    nl.

dengue :-
    verify(vomiting),
    verify(nausea),
    verify(skin_rash),
    verify(fatigue),
    verify(fever),
    (verify(joint/muscle_pain),
    verify(pain_behind_eyes);
    verify(mild_bleeding);
    verify(_)),
    write('Advices and Suggestions:'),
    nl,
    write('1: There is no specific medicine to treat dengue.'),
    nl,
    write('2: Treat the symptoms of dengue and see your healthcare provider.'),
    nl.

leptospirosis :-
    verify(skin_rash),
    verify(abdominal_pain),
    verify(jaundice),
    verify(diarrhea),
    (verify(vomiting);
    verify(headache);
    verify(chills);
    verify(red_eyes);
    verify(fever);
    verify(join/muscle_pain);
    verify(_)),
    write('Advices and Suggestions:'),
    nl,
    write('1: Leptospirosis is treated with antibiotics, such as doxycycline or penicillin, which should be given early in the course of the disease.'),
    nl.

/* how to ask questions */
ask(Question) :-
    write('Does the patient have following symptom:'),
    write(Question),
    write('? '),
    read(Response),
    nl,
    ( (Response == yes ; Response == y)
    ->
    assert(yes(Question)) ;
    assert(no(Question)), fail).

:- dynamic yes/1,no/1.

/*How to verify something */
verify(S) :-
    (yes(S) -> true ;
    (no(S)  -> fail ;
     ask(S))).

/* undo all yes/no assertions*/
undo :- retract(yes(_)),fail.
undo :- retract(no(_)),fail.
undo.