-- Création de la base de données
create database animehunter;

-- utilisation de la base de données
use animehunter;

create table anime (
id_anime int primary key auto_increment not null,
titre_anime varchar(50) not null,
synopsis_anime text not null,
nb_episodes_anime int not null,
date_diffusion_anime date not null,
image_couverture_anime varchar(50),
id_manga int not null
)engine=InnoDB;

create table utilisateur (
id_utilisateur int primary key auto_increment not null,
identifiant_utilisateur varchar(50) NOT NULL,
nom_utilisateur varchar(50) NOT NULL,
email_utilisateur varchar(50) NOT NULL,
mdp_utilisateur varchar(50) NOT NULL,
id_type_utilisateur int not null
)engine=InnoDB;

create table type_utilisateur (
id_type_utilisateur int primary key auto_increment not null,
type_utilisateur varchar(50) not null
)engine=InnoDB;

create table note (
id_note int primary key auto_increment not null,
id_anime int not null,
id_utilisateur int not null,
valeur_utilisateur int not null
)engine=InnoDB;

create table commentaire (
id_commentaire int primary key auto_increment not null,
id_anime int not null,
id_utilisateur int not null,
texte_commentaire text not null
)engine=InnoDB;

create table manga (
id_manga int primary key auto_increment not null,
titre_manga varchar(50) not null,
synopsis_manga text not null,
nb_volumes_manga int not null
)engine=InnoDB;

create table categorie(
id_categorie int primary key auto_increment not null,
type_categorie varchar(50) not null
)engine=InnoDB;

create table recommandation(
id_recommandation int primary key auto_increment not null,
anime_recommandation varchar(50) not null,
manga_recommandation varchar(50) not null
)engine=InnoDB;

create table forum(
id_forum int primary key auto_increment not null,
titre_forum varchar(50) not null,
description_forum text not null
)engine=InnoDB;

create table sujet(
id_sujet int primary key auto_increment not null,
discussion_sujet text not null,
titre_sujet varchar(50),
description_sujet text not null,
id_utilisateur int not null
)engine=InnoDB;

create table definir(
id_manga int not null,
id_categorie int not null,
primary key(id_manga, id_categorie)
)engine=InnoDB;

create table trier(
id_anime int not null,
id_categorie int not null,
primary key(id_anime, id_categorie)
)engine=InnoDB;

create table recommander_manga(
id_manga int not null,
id_recommandation int not null,
primary key(id_manga, id_recommandation)
)engine=InnoDB;

create table recommander_anime(
id_anime int not null,
id_recommandation int not null,
primary key(id_anime, id_recommandation)
)engine=InnoDB;

create table avoir(
id_anime int not null,
id_note int not null,
primary key(id_anime, id_note)
)engine=InnoDB;

create table lier(
id_anime int not null,
id_commentaire int not null,
primary key(id_anime, id_commentaire)
)engine=InnoDB;

create table donner(
id_utilisateur int not null,
id_note int not null,
primary key(id_utilisateur, id_note)
)engine=InnoDB;

create table associer( 
id_utilisateur int not null,
id_recommandation int not null,
primary key(id_utilisateur, id_recommandation)
)engine=InnoDB;

create table poster(
id_utilisateur int not null,
id_commentaire int not null,
primary key(id_utilisateur, id_commentaire)
)engine=InnoDB;

create table rejoindre(
id_utilisateur int not null,
id_forum int not null,
primary key(id_utilisateur, id_forum)
)engine=InnoDB;

create table contenir(
id_forum int not null,
id_sujet int not null,
primary key(id_forum, id_sujet)
)engine=InnoDB;
 
 -- CREATION D'ALTER TABLE
 
ALTER TABLE anime
ADD CONSTRAINT fk_correspondre_manga
FOREIGN KEY (id_manga)
REFERENCES manga(id_manga);

ALTER TABLE definir
ADD CONSTRAINT fk_definir_manga
FOREIGN KEY(id_manga)
REFERENCES manga(id_manga);

ALTER TABLE definir
ADD CONSTRAINT fk_definir_categorie
FOREIGN KEY(id_categorie)
REFERENCES categorie(id_categorie);

ALTER TABLE trier
ADD CONSTRAINT fk_trier_anime
FOREIGN KEY(id_anime)
REFERENCES anime(id_anime);

ALTER TABLE trier
ADD CONSTRAINT fk_trier_categorie
FOREIGN KEY(id_categorie)
REFERENCES categorie(id_categorie);

ALTER TABLE recommander_manga
ADD CONSTRAINT fk_recommander_manga_manga
FOREIGN KEY(id_manga)
REFERENCES manga(id_manga);

ALTER TABLE recommander_manga
ADD CONSTRAINT fk_recommander_manga_recommandation
FOREIGN KEY(id_recommandation)
REFERENCES recommandation(id_recommandation);

ALTER TABLE recommander_anime
ADD CONSTRAINT fk_recommander_anime_anime
FOREIGN KEY(id_anime)
REFERENCES anime(id_anime);

ALTER TABLE recommander_anime
ADD CONSTRAINT fk_recommander_anime_recommandation
FOREIGN KEY(id_recommandation)
REFERENCES recommandation(id_recommandation);

ALTER TABLE avoir
ADD CONSTRAINT fk_notation_anime
FOREIGN KEY(id_anime)
REFERENCES anime(id_anime);

ALTER TABLE lier
ADD CONSTRAINT fk_lier_anime
FOREIGN KEY(id_anime)
REFERENCES anime(id_anime);

ALTER TABLE associer
ADD CONSTRAINT fk_associer_recommandation_recommandation
FOREIGN KEY(id_recommandation)
REFERENCES recommandation(id_recommandation);

ALTER TABLE rejoindre
ADD CONSTRAINT fk_rejoindre_forum
FOREIGN KEY(id_forum)
REFERENCES forum(id_forum);

ALTER TABLE contenir
ADD CONSTRAINT fk_contenir_forum
FOREIGN KEY(id_forum)
REFERENCES forum(id_forum);

ALTER TABLE contenir
ADD CONSTRAINT fk_contenir_sujet
FOREIGN KEY(id_sujet)
REFERENCES sujet(id_sujet);

ALTER TABLE avoir
ADD CONSTRAINT fk_notation_note
FOREIGN KEY(id_note)
REFERENCES note(id_note);

ALTER TABLE donner
ADD CONSTRAINT fk_donner_note_note
FOREIGN KEY (id_note)
REFERENCES note(id_note);

ALTER TABLE donner
ADD CONSTRAINT fk_donner_utilisateur
FOREIGN KEY(id_utilisateur)
REFERENCES utilisateur(id_utilisateur);

ALTER TABLE associer
ADD CONSTRAINT fk_associer_utilisateur_utilisateur
FOREIGN KEY(id_utilisateur)
REFERENCES utilisateur(id_utilisateur);

ALTER TABLE poster
ADD CONSTRAINT fk_poster_utilisateur_utilisateur
FOREIGN KEY(id_utilisateur)
REFERENCES utilisateur(id_utilisateur);

ALTER TABLE rejoindre
ADD CONSTRAINT fk_rejoindre_utilisateur
FOREIGN KEY(id_utilisateur)
REFERENCES utilisateur(id_utilisateur);

ALTER TABLE sujet
ADD CONSTRAINT fk_creer_utilisateur
FOREIGN KEY (id_utilisateur)
REFERENCES utilisateur(id_utilisateur);

ALTER TABLE poster
ADD CONSTRAINT fk_poster_commentaire_commentaire
FOREIGN KEY(id_commentaire)
REFERENCES commentaire(id_commentaire);

ALTER TABLE lier
ADD CONSTRAINT fk_lier_commentaire
FOREIGN KEY(id_commentaire)
REFERENCES commentaire(id_commentaire);

ALTER TABLE utilisateur
ADD CONSTRAINT fk_affecter_type_utilisateur
FOREIGN KEY (id_type_utilisateur)
REFERENCES type_utilisateur(id_type_utilisateur);

-- Insertion d'une note dans la table note
INSERT INTO note (id_note, id_anime, id_utilisateur, valeur_utilisateur)
VALUES (1, 1, 1, 5);

-- Insertion d'un manga dans la table manga
INSERT INTO manga (titre_manga, synopsis_manga, nb_volumes_manga)
VALUES ('One Punch Man', "Saitama, un super-héros dégarni, est capable de vaincre n'importe quel ennemi d'un seul coup de poing. Malheureusement, personne ne le prend au sérieux.", 21);

-- Insertion d'un anime dans la table anime
INSERT INTO anime (id_anime, id_manga, titre_anime, synopsis_anime, nb_episodes_anime, date_diffusion_anime, image_couverture_anime)
VALUES (1, 1, 'One Punch Man', "Saitama, un super-héros dégarni, est capable de vaincre n'importe quel ennemi d'un seul coup de poing. Malheureusement, personne ne le prend au sérieux.", 12, '2015-10-04', 'one-punch-man.jpg');

-- Insertion d'un type_utilisateur dans la table type_utilisateur
INSERT INTO type_utilisateur (type_utilisateur)
VALUES ('weeb');

-- Insertion d'un utilisateur dans la table utilisateur
INSERT INTO utilisateur (id_type_utilisateur, identifiant_utilisateur, nom_utilisateur, email_utilisateur, mdp_utilisateur)
VALUES (1, 'otaku', 'Otaku', 'otaku@example.com', 'motdepasse');

-- Insertion d'un commentaire dans la table commentaire
INSERT INTO commentaire (id_anime, id_utilisateur, texte_commentaire)
VALUES (1,1, "MDR g pa lu");