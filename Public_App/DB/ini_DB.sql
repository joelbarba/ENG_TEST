-- create database EVT_GAME (usr=EVT_GAME_no_user, pwd=this_is_easy_00)

drop table if exists all_words;
create table all_words (
   id_word				serial,
   id_list				int,
   word					text			not null,
   word_type			char(5)			not null,
   word_lan				char(2)			not null,
   notes				text			null,
   translations			text			null,
   no_user_fails		bigint			null,
   no_user_hits			bigint			null,
   constraint all_words_pk primary key (id_word)
);

truncate table all_words;

insert into all_words (id_list, word, word_type, word_lan, notes, translations, no_user_fails, no_user_hits)
select 1, 'accomplish', 'V', 'en', null, 'aconseguir, lograr, cumplir, realizar', 0, 0 union all
select 1, 'ache', 'N', 'en', null, 'mal, dolor', 0, 0 union all
select 1, 'acknowledge', 'V', 'en', null, 'reconèixer, reconocer', 0, 0 union all
select 1, 'acorn', 'N', 'en', null, 'gla, bellota', 0, 0 union all
select 1, 'acres', 'N', 'en', null, 'hectaria, hectarees, hectàries, hectáreas', 0, 0 union all
select 1, 'actually', 'Adv', 'en', null, 'en realitat, de fet', 0, 0 union all
select 1, 'address', 'V', 'en', null, 'dirigir, tractar, resoldre, solucionar', 0, 0 union all
select 1, 'advertisement', 'N', 'en', null, 'anunci, anuncio, publicitat', 0, 0 union all
select 1, 'advise', 'V', 'en', null, 'aconsellar', 0, 0 union all
select 1, 'aid', 'N', 'en', null, 'ajuda, auxili, ayuda, asistencia', 0, 0 union all
select 1, 'aide', 'N', 'en', null, 'ajudant, ayudante', 0, 0 union all
select 1, 'aim', 'N', 'en', null, 'objectiu', 0, 0 union all
select 1, 'aim', 'V', 'en', null, 'pretendre, apuntar a un objectiu, dirigir-se', 0, 0 union all
select 1, 'alight', 'V', 'en', null, 'aterrisar, aterrar', 0, 0 union all
select 1, 'alike', 'Adv', 'en', null, 'igualment', 0, 0 union all
select 1, 'alley', 'N', 'en', null, 'carreró', 0, 0 union all
select 1, 'almond', 'N', 'en', null, 'ametlla, almendra', 0, 0 union all
select 1, 'almost', 'Adv', 'en', null, 'casi, gairabé, quasi', 0, 0 union all
select 1, 'aloud', 'Adv', 'en', null, 'en veu alta, en voz alta', 0, 0 union all
select 1, 'although', 'Con', 'en', null, 'malgrat, tot i, tot i que, encara que, aunque, a pesar de que, aún y', 0, 0 union all
select 1, 'always', 'Adv', 'en', null, 'sempre, 100%', 0, 0 union all
select 1, 'among', 'P', 'en', null, 'entre, entremig', 0, 0 union all
select 1, 'amuse', 'V', 'en', null, 'divertir, entretenir, entretener', 0, 0 union all
select 1, 'amused', 'Adj', 'en', null, 'divertit, entretingut', 0, 0 union all
select 1, 'ankle', 'N', 'en', null, 'turmell, tormell, tobillo', 0, 0 union all
select 1, 'appointment', 'N', 'en', null, 'cita, designació', 0, 0 union all
select 1, 'approach', 'N,V', 'en', null, 'enfoc, enfocar, dirigir, aproximació', 0, 0 union all
select 1, 'apron', 'N', 'en', null, 'devantal, delantal', 0, 0 union all
select 1, 'armchair', 'N', 'en', null, 'silló, butaca', 0, 0 union all
select 1, 'arse', 'N', 'en', null, 'cul, culo', 0, 0 union all
select 1, 'as if', 'Con', 'en', null, 'com si', 0, 0 union all
select 1, 'as though', 'Con', 'en', null, 'com si', 0, 0 union all
select 1, 'assess', 'V', 'en', null, 'evaluar, valorar', 0, 0 union all
select 1, 'at least', 'Adv', 'en', null, 'almenys, almenos, por lo menos, siquiera', 0, 0 union all
select 1, 'at once', 'Con', 'en', null, 'de seguida, immediatament', 0, 0 union all
select 1, 'attempt', 'N', 'en', null, 'intent, intento', 0, 0 union all
select 1, 'attend', 'V', 'en', null, 'atendre, assistir', 0, 0 union all
select 1, 'aunt', 'N', 'en', null, 'tieta, tia', 0, 0 union all
select 1, 'avoid', 'V', 'en', null, 'evitar', 0, 0 union all
select 1, 'award', 'N', 'en', null, 'premi, premio', 0, 0 union all
select 1, 'awful', 'Adj', 'en', null, 'horrible, terrible, horroros', 0, 0 union all
select 1, 'awkward', 'Adj', 'en', null, 'maldestre, torpe, incòmode, embarazoso', 0, 0 union all
select 1, 'bachelor party', 'N', 'en', null, 'despedida de solter', 0, 0 union all
select 1, 'backpack', 'N', 'en', null, 'motxila, motxilla, mochila', 0, 0 union all
select 1, 'badge', 'N', 'en', null, 'insignia, credencial, distintiu, enblema, distintivo', 0, 0 union all
select 1, 'baggage', 'N', 'en', null, 'equipatge, equipaje', 0, 0 union all
select 1, 'bait', 'N', 'en', null, 'cebo', 0, 0 union all
select 1, 'bald', 'N', 'en', null, 'calvo', 0, 0 union all
select 1, 'bare', 'N', 'en', null, 'despullat, desnudo, descobert', 0, 0 union all
select 1, 'barefoot', 'Adj', 'en', null, 'descals, descalç, descalzo', 0, 0 union all
select 1, 'bargain', 'N', 'en', null, 'ganga, chollo', 0, 0 union all
select 1, 'bargain', 'V', 'en', null, 'regatejar', 0, 0 union all
select 1, 'bathtub', 'N', 'en', null, 'banyera, bañera, bany', 0, 0 union all
select 1, 'bear', 'V', 'en', null, 'suportar, soportar, aguantar, tenir', 0, 0 union all
select 1, 'beat', 'V', 'en', null, 'vèncer, batre, derrotar', 0, 0 union all
select 1, 'beef', 'N', 'en', null, 'carn de vaca, carne de baca, carn de vedella', 0, 0 union all
select 1, 'beet', 'N', 'en', null, 'remolatxa, remolacha', 0, 0 union all
select 1, 'befall', 'V', 'en', null, 'succeïr, succeir, esdevenir, acontecer', 0, 0 union all
select 1, 'beg', 'V', 'en', null, 'suplicar, rogar, pregar', 0, 0;



-------------------------------------------------------------------------------------------------------------------
create table all_words_2 (
   id_word				serial,
   word					text			not null,
   word_type			char(5)			not null,
   word_lan				char(2)			not null,
   notes				text			null,
   constraint all_words_pk primary key (id_word)
);


create table translations (
   id_word_from			bigint,
   id_word_to			bigint,
   notes				text			null,
   constraint translations_pk primary key (id_word_from, id_word_to)
)


-- insert into all_words_2 (word, word_type, word_lan, notes) select 'hello', 'n', 'en', null
-- =IF(B1="","","select '" & B1 & "', '" & C1 & "', '" & E1 & "', null " & IF(D2="","","union all"))


-- Duplicate both language (b = ct and es) words
insert into all_words_2 (word, word_type, word_lan, notes)
select word, word_type, 'ct' as word_lan, notes from all_words_2 where word_lan = 'b'
union all
select word, word_type, 'es' as word_lan, notes from all_words_2 where word_lan = 'b';



truncate all_words_2;

insert into all_words_2 (id_word, word, word_type, word_lan, notes)
select 1, 'accomplish', 'v', 'en', null union all
select 2, 'ache', 'n', 'en', null union all
select 3, 'acknowledge', 'v', 'en', null union all
select 4, 'acorn', 'n', 'en', null union all
select 5, 'acres', 'n', 'en', null union all
select 6, 'actually', 'adv', 'en', null union all
select 7, 'address', 'v', 'en', null union all
select 8, 'advertisement', 'n', 'en', null union all
select 9, 'advise', 'v', 'en', null union all
select 10, 'aid', 'n', 'en', null union all
select 11, 'aide', 'n', 'en', null union all
select 12, 'aim', 'n', 'en', null union all
select 13, 'aim', 'v', 'en', null union all
select 14, 'alight', 'v', 'en', null union all
select 15, 'alike', 'adv', 'en', null union all
select 16, 'alley', 'n', 'en', null union all
select 17, 'almond', 'n', 'en', null union all
select 18, 'almost', 'adv', '', null union all
select 19, 'aloud', 'adv', '', null union all
select 20, 'although', 'con', '', null union all
select 21, 'always', 'adv', '', null union all
select 22, 'among', 'p', '', null union all
select 23, 'amuse', 'v', '', null union all
select 24, 'amused', 'adj', '', null union all
select 25, 'ankle', 'n', '', null union all
select 26, 'appointment', 'n', '', null union all
select 27, 'approach', 'n', '', null union all
select 28, 'approach', 'v', '', null union all
select 29, 'apron', 'n', '', null union all
select 30, 'armchair', 'n', '', null union all
select 31, 'arse', 'n', '', null union all
select 32, 'as if', 'con', '', null union all
select 33, 'as though', 'con', '', null union all
select 34, 'assess', 'v', '', null union all
select 35, 'at least', 'adv', '', null union all
select 36, 'at once', 'con', '', null union all
select 37, 'attempt', 'n', '', null union all
select 38, 'attend', 'v', '', null union all
select 39, 'aunt', 'n', '', null union all
select 40, 'avoid', 'v', '', null ;



insert into all_words_2 (id_word, word, word_type, word_lan, notes)
select 41, 'aconseguir', 'v', 'ct', null union all
select 42, 'lograr', 'v', 'es', null union all
select 43, 'cumplir', 'v', 'es', null union all
select 44, 'realizar', 'v', 'es', null union all
select 45, 'mal', 'n', 'ct', null union all
select 46, 'dolor', 'n', 'b', null union all
select 47, 'reconèixer', 'v', 'ct', null union all
select 48, 'reconocer', 'v', 'es', null union all
select 49, 'gla', 'n', 'ct', null union all
select 50, 'bellota', 'n', 'es', null union all
select 51, 'hectaria', 'n', 'ct', null union all
select 52, 'hectarees', 'n', 'ct', null union all
select 53, 'hectàries', 'n', 'ct', null union all
select 54, 'hectáreas', 'n', 'es', null union all
select 55, 'en realitat', 'adv', 'ct', null union all
select 56, 'de fet', 'adv', 'ct', null union all
select 57, 'dirigir', 'v', 'ct', null union all
select 58, 'tractar', 'v', 'ct', null union all
select 59, 'resoldre', 'v', 'ct', null union all
select 60, 'solucionar', 'v', 'b', null union all
select 61, 'anunci', 'n', 'ct', null union all
select 62, 'anuncio', 'n', 'es', null union all
select 63, 'publicitat', 'n', 'ct', null union all
select 64, 'aconsellar', 'v', 'ct', null union all
select 65, 'ajuda', 'n', 'ct', null union all
select 66, 'auxili', 'n', 'ct', null union all
select 67, 'ayuda', 'n', 'es', null union all
select 68, 'asistencia', 'n', 'b', null union all
select 69, 'ajudant', 'n', 'ct', null union all
select 70, 'ayudante', 'n', 'es', null union all
select 71, 'objectiu', 'n', 'ct', null union all
select 72, 'pretendre', 'v', 'ct', null union all
select 73, 'apuntar a un objectiu', 'v', 'ct', null union all
select 74, 'dirigir-se', 'v', 'ct', null union all
select 75, 'aterrisar', 'v', 'ct', null union all
select 76, 'aterrar', 'v', 'es', null union all
select 77, 'igualment', 'adv', 'ct', null union all
select 78, 'carreró', 'n', 'ct', null union all
select 79, 'ametlla', 'n', 'ct', null union all
select 80, 'almendra', 'n', 'es', null union all
select 81, 'casi', 'adv', 'b', null union all
select 82, 'gairabé', 'adv', 'ct', null union all
select 83, 'quasi', 'adv', 'ct', null union all
select 84, 'en veu alta', 'adv', 'ct', null union all
select 85, 'en voz alta', 'adv', 'es', null union all
select 86, 'malgrat', 'con', 'ct', null union all
select 87, 'tot i', 'con', 'ct', null union all
select 88, 'tot i que', 'con', 'ct', null union all
select 89, 'encara que', 'con', 'ct', null union all
select 90, 'aunque', 'con', 'es', null union all
select 91, 'a pesar de que', 'con', 'es', null union all
select 92, 'aún y', 'con', 'es', null union all
select 93, 'sempre', 'adv', 'ct', null union all
select 94, 'entre', 'p', 'b', null union all
select 95, 'entremig', 'p', 'ct', null union all
select 96, 'divertir', 'v', 'ct', null union all
select 97, 'entretenir', 'v', 'ct', null union all
select 98, 'entretener', 'v', 'es', null union all
select 99, 'divertit', 'adj', 'ct', null union all
select 100, 'entretingut', 'adj', 'ct', null union all
select 101, 'turmell', 'n', 'ct', null union all
select 102, 'tormell', 'n', 'ct', null union all
select 103, 'tobillo', 'n', 'es', null union all
select 104, 'cita', 'n', 'ct', null union all
select 105, 'designació', 'n', 'ct', null union all
select 106, 'enfoc', 'n', 'ct', null union all
select 107, 'aproximació', 'n', 'ct', null union all
select 108, 'enfocar', 'v', 'ct', null union all
select 109, 'dirigir', 'v', 'b', null union all
select 110, 'devantal', 'n', 'ct', null union all
select 111, 'delantal', 'n', 'es', null union all
select 112, 'silló', 'n', 'ct', null union all
select 113, 'butaca', 'n', 'b', null union all
select 114, 'cul', 'n', 'ct', null union all
select 115, 'culo', 'n', 'es', null union all
select 116, 'com si', 'con', 'ct', null union all
select 117, 'com si', 'con', 'ct', null union all
select 118, 'evaluar', 'v', 'ct', null union all
select 119, 'valorar', 'v', 'ct', null union all
select 120, 'almenys', 'adv', 'ct', null union all
select 121, 'almenos', 'adv', 'es', null union all
select 122, 'por lo menos', 'adv', 'es', null union all
select 123, 'siquiera', 'adv', 'es', null union all
select 124, 'de seguida', 'con', 'ct', null union all
select 125, 'immediatament', 'con', 'ct', null union all
select 126, 'intent', 'n', 'ct', null union all
select 127, 'intento', 'n', 'es', null union all
select 128, 'atendre', 'v', 'ct', null union all
select 129, 'assistir', 'v', 'ct', null union all
select 130, 'tieta', 'n', 'ct', null union all
select 131, 'tia', 'n', 'b', null union all
select 132, 'evitar', 'v', 'ct', null 



insert into translations (id_word_from, id_word_to, notes) 
select 1, 41, null union all
select 1, 42, null union all
select 1, 43, null union all
select 1, 44, null union all
select 2, 45, null union all
select 2, 46, null union all
select 3, 47, null union all
select 3, 48, null union all
select 4, 49, null union all
select 4, 50, null union all
select 5, 51, null union all
select 5, 52, null union all
select 5, 53, null union all
select 5, 54, null union all
select 6, 55, null union all
select 6, 56, null union all
select 7, 57, null union all
select 7, 58, null union all
select 7, 59, null union all
select 7, 60, null union all
select 8, 61, null union all
select 8, 62, null union all
select 8, 63, null union all
select 9, 64, null union all
select 10, 65, null union all
select 10, 66, null union all
select 10, 67, null union all
select 10, 68, null union all
select 11, 69, null union all
select 11, 70, null union all
select 12, 71, null union all
select 13, 72, null union all
select 13, 73, null union all
select 13, 74, null union all
select 14, 75, null union all
select 14, 76, null union all
select 15, 77, null union all
select 16, 78, null union all
select 17, 79, null union all
select 17, 80, null union all
select 18, 81, null union all
select 18, 82, null union all
select 18, 83, null union all
select 19, 84, null union all
select 19, 85, null union all
select 20, 86, null union all
select 20, 87, null union all
select 20, 88, null union all
select 20, 89, null union all
select 20, 90, null union all
select 20, 91, null union all
select 20, 92, null union all
select 21, 93, null union all
select 22, 94, null union all
select 22, 95, null union all
select 23, 96, null union all
select 23, 97, null union all
select 23, 98, null union all
select 24, 99, null union all
select 24, 100, null union all
select 25, 101, null union all
select 25, 102, null union all
select 25, 103, null union all
select 26, 104, null union all
select 26, 105, null union all
select 27, 106, null union all
select 27, 107, null union all
select 28, 108, null union all
select 28, 109, null union all
select 29, 110, null union all
select 29, 111, null union all
select 30, 112, null union all
select 30, 113, null union all
select 31, 114, null union all
select 31, 115, null union all
select 32, 116, null union all
select 33, 117, null union all
select 34, 118, null union all
select 34, 119, null union all
select 35, 120, null union all
select 35, 121, null union all
select 35, 122, null union all
select 35, 123, null union all
select 36, 124, null union all
select 36, 125, null union all
select 37, 126, null union all
select 37, 127, null union all
select 38, 128, null union all
select 38, 129, null union all
select 39, 130, null union all
select 39, 131, null union all
select 40, 132, null

