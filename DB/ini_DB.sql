

-- Drop table Word

CREATE TABLE Words (
   id_word				serial,
   word					text			not null,
   kind					char(5)			not null,
   meanings				text			not null,
   CONSTRAINT Words_PK PRIMARY KEY (id_word)
)
WITH ( OIDS = FALSE );
ALTER TABLE Words   OWNER TO barba;
COMMENT ON TABLE Words  IS 'Word list for english vocabulary';


CREATE TABLE Play_Words (
   id_word				numeric			not null,
   id_play				numeric			not null,
   loop_count			numeric			not null,
   error_count			numeric			not null
   CONSTRAINT Plat_Words_PK PRIMARY KEY (id_word, id_play)
)
WITH ( OIDS = FALSE );
ALTER TABLE Play_Words   OWNER TO barba;
COMMENT ON TABLE Play_Words  IS 'Words in a match';



-- CREATE SEQUENCE seq_id_word START 101;

-- ="select '" & B4 & "', '" & C4 & "', '" & D4 & "' union all"
